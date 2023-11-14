import 'dart:convert';

import 'package:ilebora_empowertech/ilebora_empowertech.dart';

void main() async {
  // Create an instance of BoraMailer
  final mailer = BoraMailer(
    userID: 'developer_user_id', //Proovided ID
    apiKey: 'developer_api_key', //Provided key
    to: 'recipient@example.com',
    from: 'sender@example.com',
    subject: 'Subject of the email',
    body: 'Body of the email',
    title: 'Email Title',
  );

  //Attachments
  mailer.addAttachment('path/to/attachment1.pdf');
  mailer.addAttachment('path/to/attachment2.txt');

  final response = await mailer.sendRemote();

  if (response != null) {
    final jsonRes = jsonDecode(response!.body); // parse the json response
    //Do something with the response

    print('Email sent successfully. Response: $jsonRes');
  } else {
    //Handle error
    print('Failed to send email. Error: ${mailer.error}');
  }
}
