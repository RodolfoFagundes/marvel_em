import 'package:flutter/material.dart';
import 'package:marvel_em/presentation/screens/shared/enumeradores.dart';

class WidgetsFunctions {
  static Widget exibaCarregandoSplash(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: Colors.white,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Icon(Icons.search)),
          const CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
          Text(
            "Carregando",
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }

  static void showSnack(
    BuildContext contexto,
    String mensagem,
    TypeMessage tipoMensagem, {
    Duration? duracao,
    SnackBarAction? acao,
  }) {
    _onWidgetDidBuild(() {
      Color? cor;
      switch (tipoMensagem) {
        case TypeMessage.sucesso:
          cor = Colors.blue;
          break;
        case TypeMessage.erro:
          cor = Colors.red;
          break;
      }

      ScaffoldMessenger.of(contexto).showSnackBar(
        SnackBar(
          content: SizedBox(
            child: Text(
              mensagem,
              key: const Key('show-snack'),
            ),
          ),
          duration: duracao ?? const Duration(seconds: 5),
          backgroundColor: cor,
          action: acao,
        ),
      );
    });
  }

  static void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
