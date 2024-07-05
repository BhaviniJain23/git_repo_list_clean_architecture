import 'package:ailoitte/app/core/network/dio_consumer.dart';
import 'package:ailoitte/app/core/network/dio_provider.dart';
import 'package:ailoitte/app/core/network/network_info.dart';
import 'package:ailoitte/app/data/data_sources/local/git_repo_database.dart';
import 'package:ailoitte/app/data/data_sources/remote/git_repository_data_source.dart';
import 'package:ailoitte/app/data/repositories/git_repository_api_repo_impl.dart';
import 'package:ailoitte/app/domain/repositories/home/git_repositories_local_repo_base.dart';
import 'package:ailoitte/app/domain/usecases/git_repo_usecase.dart';

import 'package:ailoitte/app/features/home/presentation/manager/git_repo_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

void setup() {
  // Register Dio
  getIt.registerSingleton<Dio>(DioProvider.dioInstance);

  // Register ApiConsumer
  getIt.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: getIt<Dio>()));

  // Register NetworkInfo
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: InternetConnectionChecker()));

  // Register GitRepositoryApiDataSource
  getIt.registerLazySingleton<GitRepositoryApiDataSourceBase>(
      () => GitRepositoryApiImplBase(getIt<ApiConsumer>()));

  // Register GitRepositoryApiRepo
  getIt.registerLazySingleton<GitRepositoryApiRepo>(() => GitRepositoryApiRepo(
      getIt<GitRepositoryApiDataSourceBase>(),
      networkInfo: getIt<NetworkInfo>()));

  // Register GitRepoUseCase
  getIt.registerLazySingleton<GitRepoUseCase>(
      () => GitRepoUseCase(repository: getIt<GitRepositoryApiRepo>()));

  getIt.registerLazySingleton<SqliteDatabaseHelper>(
      () => SqliteDatabaseHelper());

  getIt.registerLazySingleton<GitRepoLocalRepo>(
      () => GitRepoLocalRepo(getIt<SqliteDatabaseHelper>()));

  // Register GitRepoCubit
  getIt.registerLazySingleton<GitRepoCubit>(() => GitRepoCubit(
      useCase: getIt<GitRepoUseCase>(), localRepo: getIt<GitRepoLocalRepo>()));
}
