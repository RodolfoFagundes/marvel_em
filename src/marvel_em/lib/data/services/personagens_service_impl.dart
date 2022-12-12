import 'package:marvel_em/data/services/functions/apin_services.dart';
import 'package:marvel_em/domain/entities/personagem.dart';
import 'package:marvel_em/domain/services/personagens_service.dart';

class PersonagensServiceImpl implements PersonagensService {
  @override
  Future<Iterable<Personagem>> pesquisarPorNomeComecaCom(String name) async {
    const urlBase = 'https://gateway.marvel.com/v1/public/characters';
    const timestamp = 'INFORME O TIMESTAMP NO FORMATO YYYYMMDD';
    const apikey = 'INFORME A SUA API KEY';
    const hash = 'INFORME O SEU HASH';

    final url =
        '$urlBase?ts=$timestamp&apikey=$apikey&hash=$hash&nameStartsWith=$name';

    var data = await ApiServices.get(url);

    return _mapeiePersonagens(data.data['data']['results']);
  }

  Iterable<Personagem> _mapeiePersonagens(Iterable? data) {
    if (data == null || data.isEmpty) {
      return [];
    }

    return data.map((map) => Personagem(
          id: map['id'],
          name: map['name'],
          description: map['description'],
          modified: map['modified'] != null
              ? DateTime.parse(map['modified'])
              : DateTime.now(),
        ));
  }
}
