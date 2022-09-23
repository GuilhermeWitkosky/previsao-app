import 'package:flutter/material.dart';
import 'package:previsao_tempo_app/controllers/tema_controller.dart';

class Resumo extends StatelessWidget {

  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  const Resumo({
    Key key, 
    this.cidade, 
    this.descricao, 
    this.temperaturaAtual, 
    this.temperaturaMaxima, 
    this.temperaturaMinima, 
    this.numeroIcone
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Icon(Icons.brightness_7_sharp),
                Switch(
                  value: TemaController.instancia.usarTemaEscuro,
                  onChanged: (valor) {
                    TemaController.instancia.trocarTema();
                  },
                 ),
              ],
            ),
          ],
        ),
        Text(
          cidade, 
          style: TextStyle(fontSize: 18),
        ),
        Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/$numeroIcone.png')),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                '${temperaturaAtual.toStringAsFixed(0)} °C',
                style: TextStyle(fontSize: 40),
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${temperaturaMaxima.toStringAsFixed(0)} °C'),
                  Text('${temperaturaMinima.toStringAsFixed(0)} °C'),
                ],
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          descricao,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}