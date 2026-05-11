import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants/app_links.dart';

Future<bool> sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  final url = Uri.parse(AppLinks.emailJsSend);

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': const String.fromEnvironment('service_id'), //set your service id here
        'template_id': const String.fromEnvironment('template_id'), //set your template id here
        'user_id': const String.fromEnvironment('user_id'), //set your user id here
        'template_params': {
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
        },
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }

    return false;
  } catch (e) {
    return false;
  }
}
