import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:marvel_em/domain/entities/personagem.dart';
import 'package:marvel_em/domain/errors/errors.dart';
import 'package:marvel_em/domain/services/personagens_service.dart';

class PersonagensUseCase {
  final PersonagensService personagensService;

  PersonagensUseCase({required this.personagensService});

  Future<Either<Failure, Iterable<Personagem>>> pesquisarPorNomeComecaCom(
      String name) async {
    try {
      final personagens =
          await personagensService.pesquisarPorNomeComecaCom(name);

      return Right(personagens);
    } catch (error, stackTrace) {
      log(
        error.toString(),
        time: DateTime.now(),
        name: 'PersonagensService.pesquisarPorNomeComecaCom',
        stackTrace: stackTrace,
      );

      return Left(InternalError(message: error.toString()));
    }
  }
}
