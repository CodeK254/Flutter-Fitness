import 'package:get/get.dart';

class Messages implements Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": {
      "hello": "Hello and welcome.",
      "logged_in": "Logged in as @name \n email @email",
    },
    "es_ES": {
      "hello": "Hola Mundo en gratias.",
      "logged_in": "Inicardo sesion como @name \n e-mail @email"
    }
  };
}