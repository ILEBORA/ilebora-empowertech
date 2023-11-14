A Flutter package for integrating with Bora Empowertech services. Bora Empowertech is a portal to access various Ilebora services, including email, push notifications, and SMS.

## Features

- **BoraMailer:** Send emails using the Bora Empowertech Mailer service.
- **BoraSTK:** Integrate with the Bora Empowertech Push service for push notifications.
- **BoraSMS:** Send text messages using the Bora Empowertech SMS service.
- **Other services:** Coming soon...

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  ilebora_empowertech: ^0.0.1
```

Then run:

```bash

flutter pub get

```

## Configuration

To use the Bora Empowertech package, you'll need to configure your API key and user ID (or generate new keys from https://empowertech.ilebora.com ). Update the userID and apiKey's in your initializations and you are all set. 

```dart

 final mailer = BoraMailer(
    userID: 'developer_user_id', //Proovided ID
    apiKey: 'developer_api_key', //Provided key
    // Other configuration options...
  );
```

Remember to replace placeholders like `your_user_id` and `your_api_key` with the actual values.

## Issues and Feedback

For any issues or feedback, please open an [Issues](https://github.com/ILEBORA/ilebora-empowertech/issues) on GitHub.

## License

This project is licensed under the MIT License  - see the [LICENSE](https://github.com/ILEBORA/ilebora-empowertech/blob/main/LICENSE) file for details..
