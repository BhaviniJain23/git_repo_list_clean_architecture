import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/core/network/dio_consumer.dart';
import 'package:ailoitte/app/core/utils/app_endpoints.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_request_params.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';

abstract class GitRepositoryApiDataSourceBase {
  Future<GitRepoResponseModel> getAllGitRepositories(
      GitRepoRequestModel params);
}

class GitRepositoryApiImplBase extends GitRepositoryApiDataSourceBase {
  final ApiConsumer apiConsumer;

  GitRepositoryApiImplBase(this.apiConsumer);

  @override
  Future<GitRepoResponseModel> getAllGitRepositories(
      GitRepoRequestModel params) async {
    try {
      final result = await apiConsumer
          .get("${EndPoints.getAPI}?${params.toPassInRequest()}");

      if (result == null || !(result is Map && result.isNotEmpty)) {
        throw const FetchDataException();
      }

      return GitRepoResponseModel.fromJson({...result});
    } on Exception catch (_) {
      rethrow;
    }
  }
}
