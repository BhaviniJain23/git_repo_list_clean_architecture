import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/core/useCases/use_cases.dart';
import 'package:ailoitte/app/data/repositories/git_repository_api_repo_impl.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:dartz/dartz.dart';

class GitRepoUseCase
    extends UseCase<GitRepoResponseModel, GitRepoRequestModel> {
  final GitRepositoryApiRepo repository;

  GitRepoUseCase({required this.repository});

  @override
  Future<Either<GenericException, GitRepoResponseModel>> call(
      GitRepoRequestModel params) async {
    final result = await repository.getAllRepositories(params);
    return result;
  }
}
