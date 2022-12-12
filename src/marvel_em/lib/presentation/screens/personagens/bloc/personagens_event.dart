part of 'personagens_bloc.dart';

class PersonagensEvent extends Equatable {
  const PersonagensEvent([Iterable? props]);

  @override
  List<Object?> get props => [props];
}

class PesquisarPorNomeComecaComEvent extends PersonagensEvent {
  final String name;

  const PesquisarPorNomeComecaComEvent({required this.name});

  @override
  String toString() => 'PesquisarPorNomeComecaComEvent {name: $name}';
}
