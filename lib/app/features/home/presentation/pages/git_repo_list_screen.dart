import 'dart:convert';
import 'dart:isolate';

import 'package:ailoitte/app/features/home/presentation/manager/git_repo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GitRepoListScreen extends StatelessWidget {
  const GitRepoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<GitRepoCubit, GitRepoState>(
        builder: (context, state) {
          if (state is GitRepoInitial) {
            context.read<GitRepoCubit>().fetchRepositories();
            return const Center(child: CircularProgressIndicator());
          } else if (state is GitRepoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GitRepoFailure) {
            return Center(child: Text(state.errorMsg));
          } else if (state is GitRepoSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                // fetchGitRepositoriesInIsolate(context);
              },
              child: ListView.separated(
                itemCount: state.model.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      jsonEncode(state.model[index].toJson()),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
