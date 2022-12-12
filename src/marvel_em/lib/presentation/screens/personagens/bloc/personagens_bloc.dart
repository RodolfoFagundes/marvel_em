import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_em/domain/entities/personagem.dart';
import 'package:marvel_em/domain/usecases/personagens_usecase.dart';

part 'personagens_event.dart';
part 'personagens_state.dart';

class PersonagensBloc extends Bloc<PersonagensEvent, PersonagensState> {
  final PersonagensUseCase personagensUseCase;

  PersonagensBloc({required this.personagensUseCase})
      : super(PersonagensState.inicio()) {
    on<PesquisarPorNomeComecaComEvent>(
      (event, emit) async {
        emit(PersonagensState.carregando());

        final result =
            await personagensUseCase.pesquisarPorNomeComecaCom(event.name);

        result.fold(
          (failure) => emit(PersonagensState.erro(failure.message)),
          (sucess) => emit(PersonagensState.sucesso(sucess)),
        );
      },
      transformer: restartable(),
    );
  }
}
