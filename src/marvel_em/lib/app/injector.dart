import 'package:get_it/get_it.dart';
import 'package:marvel_em/data/services/personagens_service_impl.dart';
import 'package:marvel_em/domain/services/personagens_service.dart';
import 'package:marvel_em/domain/usecases/personagens_usecase.dart';
import 'package:marvel_em/presentation/screens/personagens/bloc/personagens_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerFactory(() => PersonagensBloc(personagensUseCase: getIt()))
    ..registerFactory(() => PersonagensUseCase(personagensService: getIt()))
    ..registerFactory<PersonagensService>(() => PersonagensServiceImpl());
}
