import 'package:flutter/material.dart';
import 'package:previsao_tempo_app/controllers/tema_controller.dart';
import 'package:previsao_tempo_app/widgets/home.dart';

class VidenteApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TemaController.instancia, 
      builder: (context, child) {
        return MaterialApp(
          title: 'Previsao',
          theme: TemaController.instancia.usarTemaEscuro 
            ? ThemeData.dark()
            : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      }
    );
  }
}