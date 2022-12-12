import 'package:flutter/cupertino.dart';
import 'package:marvel_em/domain/entities/personagem.dart';

class PersonagensBody extends StatefulWidget {
  final List<Personagem> personagens;

  const PersonagensBody({super.key, required this.personagens});

  @override
  State<PersonagensBody> createState() => _PersonagensBodyState();
}

class _PersonagensBodyState extends State<PersonagensBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.personagens.length,
        itemBuilder: (context, index) {
          return Text(widget.personagens[index].name);
        });
  }
}
