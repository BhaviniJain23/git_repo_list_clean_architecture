part of 'git_repo_cubit.dart';

@immutable
sealed class GitRepoState {}

final class GitRepoInitial extends GitRepoState {}

final class GitRepoLoading extends GitRepoState {}

final class GitRepoFailure extends GitRepoState {
  final String errorMsg;

  GitRepoFailure(this.errorMsg);
}

final class GitRepoSuccess extends GitRepoState {
  final List<Item> model;

  GitRepoSuccess(this.model);
}

final class GitRepoRefreshFailed extends GitRepoState {
  final String errorMsg;

  GitRepoRefreshFailed(this.errorMsg);
}
