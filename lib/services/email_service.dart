import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String serviceId = 'service_wutk1ja';
  static const String templateId = 'template_bjxr7ge';
  static const String publicKey = '7dPE6aqu_bkcVi6gr';

  /// Sends an email using the EmailJS API.
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String phone,
    required String company,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_phone': phone,
            'user_company': company,
            'message': message,
          },
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
