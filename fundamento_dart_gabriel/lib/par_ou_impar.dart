import 'dart:io';

int lerInteiro() {
  while (true) {
    print("Digite um número inteiro: ");
    String? numeroUm = stdin.readLineSync();

    // tratando erros que a conversão para int pode causar
    try {
      // Tenta converter a entrada para um número inteiro
      return int.parse(numeroUm!);
    } catch (e) {
      // Caso ocorra um erro, exibe uma mensagem e pede a entrada novamente
      print('Entrada inválida. Por favor, digite um número inteiro.');
    }
  }
}

void main(List<String> args) {
  final int parOuImpar = lerInteiro();

  if (parOuImpar % 2 == 0) {
    print('O número ${parOuImpar} é par');
  } else {
    print('O número ${parOuImpar} é impar');
  }
}
