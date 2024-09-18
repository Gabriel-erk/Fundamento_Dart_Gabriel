import 'dart:io';

int imprimeTabuadaEscohida() {
  while (true) {
    try {
      print("Digite um número entre 0 e 10: ");
      String? numeroUsuario = stdin.readLineSync();
      int numeroTabuada = int.parse(numeroUsuario!);

      if (numeroTabuada > 10 || numeroTabuada < 0) {
        print('Número fora do intervalo, insira um valor entre 0 e 10.');
      } else {
        for (var i = 0; i <= 10; i++) {
          print('${numeroTabuada} X ${i} = ${numeroTabuada * i}');
        }
        // retornando para não repetir ifinitamente a pergunta
        return numeroTabuada;
      }
    } catch (e) {
      print('Entrada inválida. Por favor, digite um número inteiro.');
    }
  }
}

void main(List<String> args) {
  imprimeTabuadaEscohida();
}
