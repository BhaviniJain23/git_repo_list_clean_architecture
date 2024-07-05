import 'dart:isolate';

import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/repositories/home/git_repositories_local_repo_base.dart';
import 'package:ailoitte/app/domain/usecases/git_repo_usecase.dart';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'git_repo_state.dart';

class GitRepoCubit extends Cubit<GitRepoState> {
  final GitRepoUseCase useCase;
  final GitRepoLocalRepo _localRepo;

  GitRepoCubit({required this.useCase, required GitRepoLocalRepo localRepo})
      : _localRepo = localRepo,
        super(GitRepoInitial());

  Future<void> fetchRepositories() async {
    emit(GitRepoLoading());
    final localData = await _localRepo.getRepositories();
    if (localData.isNotEmpty) {
      emit(GitRepoSuccess(localData));
    }
    final result = await useCase(GitRepoRequestModel(
        query: "created:>2022-04-29", sort: "stars", order: "desc"));
    result.fold(
      (error) => emit(GitRepoFailure(error.message)),
      (data) async {
        final saved = await _localRepo.saveRepositories([data.items[0]]);
        if (saved) {
          print('Repositories saved successfully');
        } else {
          print('Error saving repositories 1');
        }
        final localData = await _localRepo.getRepositories();
        emit(GitRepoSuccess(localData));
      },
    );
  }

  Future<void> fetchGitRepositoriesInIsolate() async {
    emit(GitRepoLoading());
    final result = await useCase(GitRepoRequestModel(
        query: "created:>2022-04-29", sort: "stars", order: "desc"));
    result.fold(
      (error) => emit(GitRepoFailure(error.message)),
      (data) async {
        await _localRepo.saveRepositories(data.items);
        final localData = await _localRepo.getRepositories();
        emit(GitRepoSuccess(localData));
      },
    );
  }

  Future<void> refreshRepositoriesAsIsolatePoint(SendPort sendPort) async {
    try {
      final result = await useCase(GitRepoRequestModel(
          query: "created:>2022-04-29", sort: "stars", order: "desc"));

      if (result.isRight()) {
        await _localRepo
            .saveRepositories((result as GitRepoResponseModel).items);
        sendPort
            .send((result as GitRepoResponseModel).items); // Send only the data
      } else {
        sendPort.send("Error:${(result as GenericException).message}");
      }
    } on Exception catch (e) {
      sendPort.send("Error:${e.toString()}");
    }
  }

  Future<void> refreshRepositories() async {
    try {
      final receivePort = ReceivePort();
      await Isolate.spawn(
          refreshRepositoriesAsIsolatePoint, receivePort.sendPort);
      receivePort.listen((returnState) async {
        // Here, you can't access the BuildContext, so you can't show a SnackBar.
        // Instead, you can use a callback function to notify the main isolate
        // that the operation is complete.
        if (returnState.toString().toLowerCase().contains("success")) {
          // Handle success
          final localData = await _localRepo.getRepositories();
          emit(GitRepoSuccess(localData));
        } else {
          // Handle error
          // You can't show a SnackBar here because you don't have access to the BuildContext.
          // Instead, you can use a callback function to notify the main isolate
          // that an error occurred.
        }
      });
    } on Exception catch (e) {
      // Handle error
      // You can't show a SnackBar here because you don't have access to the BuildContext.
      // Instead, you can use a callback function to notify the main isolate
      // that an error occurred.
    }
  }
}
