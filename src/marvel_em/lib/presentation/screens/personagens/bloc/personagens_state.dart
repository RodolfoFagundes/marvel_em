part of 'personagens_bloc.dart';

class PersonagensState {
  final bool eInicio;
  final bool eCarregando;
  final bool eSucesso;
  final bool eErro;
  final String erro;
  final Iterable<Personagem> personagens;

  PersonagensState({
    required this.eInicio,
    required this.eCarregando,
    required this.eSucesso,
    required this.eErro,
    required this.erro,
    required this.personagens,
  });

  factory PersonagensState.inicio() => PersonagensState(
        eInicio: true,
        eCarregando: false,
        eSucesso: false,
        eErro: false,
        erro: '',
        personagens: [],
      );

  factory PersonagensState.carregando() => PersonagensState(
        eInicio: false,
        eCarregando: true,
        eSucesso: false,
        eErro: false,
        erro: '',
        personagens: [],
      );

  factory PersonagensState.sucesso(Iterable<Personagem> personagens) =>
      PersonagensState(
        eInicio: false,
        eCarregando: false,
        eSucesso: true,
        eErro: false,
        erro: '',
        personagens: personagens,
      );

  factory PersonagensState.erro(String erro) => PersonagensState(
        eInicio: false,
        eCarregando: false,
        eSucesso: false,
        eErro: true,
        erro: erro,
        personagens: [],
      );
}
