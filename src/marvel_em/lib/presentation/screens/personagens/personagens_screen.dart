import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_em/presentation/screens/personagens/bloc/personagens_bloc.dart';
import 'package:marvel_em/presentation/screens/personagens/components/personagens_body.dart';
import 'package:marvel_em/presentation/screens/shared/enumeradores.dart';
import 'package:marvel_em/presentation/screens/shared/widgets_functions.dart';

class PersonagensScreen extends StatelessWidget {
  const PersonagensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buscaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Herois da EM')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: buscaController,
            ),
          ),
          Expanded(child: BlocBuilder<PersonagensBloc, PersonagensState>(
              builder: (context, state) {
            if (state.eCarregando) {
              return WidgetsFunctions.exibaCarregandoSplash(context);
            }

            if (state.eErro) {
              WidgetsFunctions.showSnack(context, state.erro, TypeMessage.erro);

              return WidgetsFunctions.exibaCarregandoSplash(context);
            }

            return PersonagensBody(personagens: state.personagens.toList());
          }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<PersonagensBloc>()
            .add(PesquisarPorNomeComecaComEvent(name: buscaController.text)),
        child: const Icon(Icons.search),
      ),
    );
  }
}
