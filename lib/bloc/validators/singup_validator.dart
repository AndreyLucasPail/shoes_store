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
      if(pass.length < 6){
        sink.add(pass);
      }else{
        sink.addError("Senha inválida");
      }
    },
  );

  final cepValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (cep, sink) {
      if(cep.length <= 6){
        sink.add(cep);
      }else{
        sink.addError("O CEP deve conter 6 digitos");
      }
    },
  );
}