import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/core/network/network_info.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:ailoitte/app/domain/repositories/home/git_repositories_api_repo_base.dart';
import 'package:dartz/dartz.dart';

class GitRepositoryApiRepo extends GitRepositoriesApiRepoBase {
  final NetworkInfo networkInfo;

  GitRepositoryApiRepo(super.remote, {required this.networkInfo});

  @override
  Future<Either<GenericException, GitRepoResponseModel>> getAllRepositories(
      GitRepoRequestModel params) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remote.getAllGitRepositories(params));
      } catch (e) {
        return Left(UnhandledFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
