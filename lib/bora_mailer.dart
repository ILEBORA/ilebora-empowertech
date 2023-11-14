import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ilebora_empowertech/config/bora_constants.dart';

class BoraMailer {
  String to;
  String from;
  String subject;
  String body;
  Map<String, Map<String, String>> attachments = {};
  String boundary = 'anystring';

  String title;
  String error = '';

  String userID;
  String apiKey;

  BoraMailer({
    required this.userID,
    required this.apiKey,
    required this.to,
    required this.from,
    required this.subject,
    required this.body,
    required this.title,
  });

  void addAttachment(String file) {
    if (File(file).existsSync()) {
      final fileContent = File(file).readAsStringSync();
      final fileContentEncoded = base64.encode(utf8.encode(fileContent));
      final fileName = file.split('/').last;

      attachments[fileName] = {
        'content': fileContentEncoded,
        'file': fileName,
      };
    }
  }

  Future<http.Response?> sendRemote() async {
    try {
      if (attachments.isNotEmpty) {
        // Add Attachment to body
        for (final attachment in attachments.values) {
          final content = attachment['content'];
          final file = attachment['file'];
          body += '''
						--$boundary
						Content-Type: text/plain
						
						See attached file!
						
						--$boundary
						Content-Type: application/pdf
						Content-Transfer-Encoding: base64
						Content-Disposition: attachment; filename='$file'
						
						$content
						--$boundary--
						''';
        }
      }

      final data = jsonEncode(<String, dynamic>{
        'to': to,
        'from': from,
        'subject': subject,
        'body': body,
        'attachments': attachments,
        'title': title,
      });

      final response = await http.post(
        Uri.parse(BoraConstants.emailApi),
        body: data,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${base64Encode(utf8.encode('$userID:$apiKey'))}',
        },
      );

      return response;
    } catch (ex) {
      error = jsonEncode(ex);
      return null;
    }
  }
}
