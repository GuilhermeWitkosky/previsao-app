import 'dart:convert';
import 'package:previsao_tempo_app/models/previsao_hora.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class PrevisaoService {
  final String baseUrlApi = 'dataservice.accuweather.com';
  final String path = '/forecasts/v1/hourly/12hour/${env["CITY_CODE"]}';
  final Map<String, String> params = {
    'apikey': env['API_KEY'],
    'language': 'pt',
    'metric': 'true'
  };

  Future<List<PrevisaoHora>> recuperarUltimasPrevisoes() async {
    final Response resposta = await get(Uri.http(baseUrlApi, path, params));

    if(resposta.statusCode == 200){
      Iterable it = json.decode(resposta.body);
      List<PrevisaoHora> previsoes = List.from(
        it.map((objJson) => PrevisaoHora.transformarJSON(objJson))
      );

      print('Carregou novas previsoes');
      return previsoes;
    } else {
      throw Exception('Falha ao carregar as previsões');
    }
  }
}