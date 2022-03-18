import 'package:dio/dio.dart';
import 'package:sample_bloc/data/model/meme_model.dart';

class HttpClient {
  final String _endpoint = "https://api.imgflip.com/get_memes";
  final Dio _dio = Dio();

  Future<List<MemeModel>> getMeme() async {
    try {
      Response response = await _dio.get(_endpoint);
      return MemeResponse.fromJson(response.data).results;
    } catch (error) {
      return [];
    }
  }
}

class MemeResponse {
  final List<MemeModel> results;
  final String error;

  MemeResponse(this.results, this.error);

  MemeResponse.fromJson(Map<String, dynamic> json)
      : results = (json["data"]["memes"] as List)
            .map((i) => MemeModel.fromMap(i))
            .toList(),
        error = "";

  MemeResponse.withError(String errorValue)
      : results = [],
        error = errorValue;
}
