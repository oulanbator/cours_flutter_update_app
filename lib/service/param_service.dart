import 'dart:convert';

import 'package:cours_flutter_update_app/constants.dart';
import 'package:cours_flutter_update_app/model/param.dart';
import 'package:http/http.dart' as http;

class ParamService {
  Future<Param?> fetchParam(String paramKey) async {
    var url = "${Constants.uriParams}?filter[key][_eq]=$paramKey";

    final response = await http.get(
      Uri.parse(url),
      headers: Constants.publicHeaders,
    );

    if (response.statusCode == 200) {
      return parseParam(response.body);
    } else {
      throw Exception('Failed to load users. Status : ${response.statusCode}');
    }
  }

  Param? parseParam(String responseBody) {
    final Map<String, dynamic> body = jsonDecode(responseBody);
    final List<dynamic> data = body['data'];

    if (data.isNotEmpty) {
      var json = data[0];
      return Param.fromJson(json);
    } else {
      return null;
    }
  }

  Future<String?> getAppVersion() async {
    var appVersionParam = await fetchParam("demo_app_version");
    if (appVersionParam != null) {
      return appVersionParam.value;
    }
    return null;
  }
}
