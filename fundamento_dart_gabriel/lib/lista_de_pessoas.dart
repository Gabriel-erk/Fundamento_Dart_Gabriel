import 'dart:io';

void main() {
  // criando uma lista dentro de outra lista, onde cada posição da lista cadastros será associada a um cadastro de usuário
  List<List<String>> cadastros = [];

  while (true) {
    print("Digite seu nome e telefone separados por '|', ou 'sair' para encerrar:");

    String? input = stdin.readLineSync();
    if (input == null || input.toLowerCase() == 'sair') {
      break;
    }

    List<String> partes = input.split('|');

    if (partes.length == 2) {
      String nome = partes[0].trim();
      String telefone = partes[1].trim();

      // Adiciona o cadastro à lista
      cadastros.add([nome, telefone]);

      print("Cadastro realizado com sucesso.");
    } else {
      print("Formato inválido. Certifique-se de usar o delimitador '|' e inserir duas partes.");
    }
  }

  // Exibindo todos os cadastros
  print("\nTodos os cadastros com telefone válido:");
  for (var i = 0; i < cadastros.length; i++) {
    String telefone = cadastros[i][1];
    if (telefone.length >= 15) {
      print("Cadastro ${i + 1} - Nome: ${cadastros[i][0]}, Telefone: $telefone");
    }
  }
}
