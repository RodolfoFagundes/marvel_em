import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_em/app/initialize.dart';
import 'package:marvel_em/app/injector.dart';
import 'package:marvel_em/domain/usecases/personagens_usecase.dart';
import 'package:marvel_em/presentation/screens/personagens/bloc/personagens_bloc.dart';
import 'package:marvel_em/presentation/screens/personagens/personagens_screen.dart';

void main() async {
  await Initialize.init();
  runApp(PersonagensApp());
}

class PersonagensApp extends MaterialApp {
  PersonagensApp({super.key})
      : super(
            home: BlocProvider(
          create: (_) =>
              PersonagensBloc(personagensUseCase: getIt<PersonagensUseCase>()),
          child: const PersonagensScreen(),
        ));
}
