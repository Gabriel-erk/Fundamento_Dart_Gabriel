import 'dart:io';

double calculaMediaUsuario() {
  while (true) {
    try {
      // inicializando lista com 4 posições e todas com o valor 0
      List<double> notasAluno = List.filled(4, 0);
      double somaNotasAluno = 0;

      for (var i = 0; i < notasAluno.length; i++) {
        print("Digite a sua nota: ");
        String? input = stdin.readLineSync();
        notasAluno[i] = double.parse(input!);

        somaNotasAluno += notasAluno[i];
      }

      double mediaAluno = somaNotasAluno / 4;

      if (mediaAluno >= 0 && mediaAluno <= 4.99) {
        print("Reprovado");
      } else if (mediaAluno >= 5.00 && mediaAluno <= 6.99) {
        print("Em Recuperação");
      } else if (mediaAluno > 7.00) {
        print("Aprovado");
      }
      return mediaAluno;
    } catch (e) {
      print('Entrada inválida. Por favor, digite um número inteiro.');
    }
  }
}

void main(List<String> args) {
  calculaMediaUsuario();
}
