import 'dart:isolate';
import 'package:ailoitte/app/core/helper/extension.dart';
import 'package:ailoitte/app/core/injections.dart';
import 'package:ailoitte/app/features/home/presentation/manager/git_repo_cubit.dart';
import 'package:ailoitte/app/features/home/presentation/widget/git_repo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GitRepoListScreen extends StatelessWidget {
  const GitRepoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final receivePort = ReceivePort();
          var rootToken = RootIsolateToken.instance!;

          await Isolate.spawn(
              refreshRepositoriesIsolate, [receivePort.sendPort, rootToken]);
          receivePort.listen((result) {
            if (!result.startsWith("Error")) {
              context.read<GitRepoCubit>().getDataFromLocal();
              context
                  .showSnackBar("Your data has been successfully refreshed.");
            } else {
              // Handle error
              debugPrint("Error: $result");
              context.showSnackBar(result, snackType: SnackType.error);
            }
          });
        },
        child: BlocBuilder<GitRepoCubit, GitRepoState>(
          builder: (context, state) {
            if (state is GitRepoInitial) {
              context.read<GitRepoCubit>().fetchRepositories();
              return const Center(child: CircularProgressIndicator());
            } else if (state is GitRepoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GitRepoFailure) {
              return Center(child: Text(state.errorMsg));
            } else if (state is GitRepoSuccess) {
              if (state.model.isEmpty) {
                return const Center(child: Text('No Data Found'));
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.model.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return GitRepoCard(item: state.model[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  refreshRepositoriesIsolate(List<dynamic> args) async {
    final sendPort = args[0] as SendPort;
    final rootToken = args[1] as RootIsolateToken;
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
    setup();
    final cubit = getIt<GitRepoCubit>();
    try {
      final result = await cubit.refreshRepositories();
      sendPort.send(result);
    } on Exception catch (e) {
      sendPort.send("Error:${e.toString()}");
    }
  }
}
