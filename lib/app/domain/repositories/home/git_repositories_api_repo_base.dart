import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/data/data_sources/remote/git_repository_data_source.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class GitRepositoriesApiRepoBase {
  final GitRepositoryApiDataSourceBase remote;

  GitRepositoriesApiRepoBase(this.remote);

  Future<Either<GenericException, GitRepoResponseModel>> getAllRepositories(
      GitRepoRequestModel params);
}
