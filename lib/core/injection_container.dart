import 'package:biblio/features/search/data/data_sources/remote_datasource.dart';
import 'package:biblio/features/search/data/repositories/search_repository_impl.dart';
import 'package:biblio/features/search/domain/repositories/search_book_repository.dart';
import 'package:biblio/features/search/domain/usecases/search_book_usecase.dart';
import 'package:biblio/features/search/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl
    ..registerFactory(
      () => SearchBloc(searchBookUseCase: sl()),
    )

    //usecases
    ..registerLazySingleton(() => SearchBookUsecase(repository: sl()))

    //repositories
    ..registerLazySingleton<SearchBookRepository>(
        () => SearchRepositoryImpl(searchRemoteDataSource: sl()))

    //data sources
    ..registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl(httpClient: sl()))

    //core - http client
    ..registerLazySingleton(() => http.Client());
}
