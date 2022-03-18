import 'package:sample_bloc/data/config/http.dart';
import 'package:sample_bloc/data/model/meme_model.dart';

class MemeRepository {
  final HttpClient _httpClient = HttpClient();
  Future<List<MemeModel>> getMeme() async {
    return await _httpClient.getMeme();
  }
}
