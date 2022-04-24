import 'dart:convert';

class Login {
  String usuario;
  String senha;

  Login ({
    required this.usuario, 
    required this.senha
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'usuario': usuario});
    result.addAll({'senha': senha});
  
    return result;
  }

  String toJson() => json.encode(toMap());
}