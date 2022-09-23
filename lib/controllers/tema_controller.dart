import 'package:flutter/widgets.dart';

class TemaController extends ChangeNotifier {
  bool usarTemaEscuro;
  static TemaController instancia = new TemaController();

  TemaController() {
    usarTemaEscuro = false;
  }

  trocarTema() {
    usarTemaEscuro = !usarTemaEscuro;
    notifyListeners();
  }

}