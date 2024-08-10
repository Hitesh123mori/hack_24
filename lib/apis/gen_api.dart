import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static List<SafetySetting> safetSettings = [
    SafetySetting(
      category: SafetyCategory.harassment,
      threshold: SafetyThreshold.blockNone,
    ),
    SafetySetting(
      category: SafetyCategory.hateSpeech,
      threshold: SafetyThreshold.blockNone,
    ),
    SafetySetting(
      category: SafetyCategory.dangerous,
      threshold: SafetyThreshold.blockNone,
    ),
    SafetySetting(
      category: SafetyCategory.sexuallyExplicit,
      threshold: SafetyThreshold.blockNone,
    )
  ];

  // static Future<Map<String, dynamic>> fetchDiseaseData(String disease) async {
  //   final url = Uri.parse('http://192.168.137.1:5000/generate?disease=$disease');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //   };
  //
  //   try {
  //     final response = await http
  //         .get(url, headers: headers)
  //         .timeout(const Duration(seconds: 10));
  //
  //     if (response.statusCode == 200) {
  //       return json.decode(response.body) as Map<String, dynamic>;
  //     } else {
  //       throw Exception('Failed to load data: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching data: $e');
  //   }
  // }

  static Future<Map<String, dynamic>> getDiseaseSolution(String disease) async {
    final String prompt =
        "For the crop disease: '${disease}', return only a JSON response with the following details: {\"best_pesticide\":, \"amount_per_acre\":, \"recovery_time\":}. Please ensure the pesticide, dosage, are realistic and relevant. Do not include any other text, only return the JSON.";
    final gemini = Gemini.instance;

    return gemini.text(prompt, safetySettings: safetSettings).then((value) {
      String? s = value?.output.toString();
      Map<String, dynamic> map = jsonDecode(s ?? "{}");
      print("#o/p ${s} ");
      print("#map ${map.runtimeType}: $map");
      return map;
    }).catchError((e) {
      print("#gemini-error $e");

      return {"gemini-error": e};
    });
  }
}
