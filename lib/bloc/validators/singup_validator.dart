import 'dart:async';

mixin class SingUpValidator {
  
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Email inválido");
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if(pass.length >= 6){
        sink.add(pass);
      }else{
        sink.addError("Senha inválida");
      }
    },
  );

  final cepValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (cep, sink) {
      if(cep.length <= 8){
        sink.add(cep);
      }else{
        sink.addError("O CEP deve conter 8 digitos");
      }
    },
  );

  final nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if(name.isNotEmpty){
        sink.add(name);
      }else{
        sink.addError("Campo não pode star vázio");
      }
    },
  );

  final addressValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (address, sink) {
      if(address.isNotEmpty){
        sink.add(address);
      }else{
        sink.addError("Campo não pode star vázio");
      }
    },
  );

  final birthdayValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (birthday, sink) {
      if(birthday.isNotEmpty){
        sink.add(birthday);
      }else{
        sink.addError("Campo não pode star vázio");
      }
    },
  );
}