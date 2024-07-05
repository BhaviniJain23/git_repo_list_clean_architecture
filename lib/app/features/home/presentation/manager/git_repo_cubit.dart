import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:ailoitte/app/domain/repositories/home/git_repositories_local_repo_base.dart';
import 'package:ailoitte/app/domain/usecases/git_repo_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'git_repo_state.dart';

class GitRepoCubit extends Cubit<GitRepoState> {
  final GitRepoUseCase useCase;
  final GitRepoLocalRepo localRepo;

  GitRepoCubit({required this.useCase, required this.localRepo})
      : super(GitRepoInitial());

  Future<void> fetchRepositories() async {
    emit(GitRepoLoading());
    final localData = await localRepo.getRepositories();
    if (localData.isNotEmpty) {
      emit(GitRepoSuccess(localData));
    }
    final result = await useCase(GitRepoRequestModel(
        query: "created:>2022-04-29", sort: "stars", order: "desc"));
    result.fold(
      (error) => emit(GitRepoFailure(error.message)),
      (data) async {
        await localRepo.saveRepositories(data.items);
        await getDataFromLocal();
      },
    );
  }

  Future<void> getDataFromLocal() async {
    final localData = await localRepo.getRepositories();
    emit(GitRepoSuccess(localData));
  }

  refreshRepositories() async {
    try {
      final result = await useCase(GitRepoRequestModel(
          query: "created:>2022-04-29", sort: "stars", order: "desc"));

      result.fold(
        (left) => "Error:${left.message}",
        (right) async {
          await localRepo.saveRepositories(right.items);
          return "Success";
        },
      );
      return "Success";
    } on Exception catch (e) {
      return "Error:${e.toString()}";
    }
  }
}
