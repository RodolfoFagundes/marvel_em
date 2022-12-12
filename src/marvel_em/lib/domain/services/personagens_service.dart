import 'package:marvel_em/domain/entities/personagem.dart';

abstract class PersonagensService {
  Future<Iterable<Personagem>> pesquisarPorNomeComecaCom(String name);
}
