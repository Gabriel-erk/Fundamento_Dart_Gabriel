void main() {
  print(
      '--------------------------------- DESAFIO FUNDAMENTOS EM DART ---------------------------------');
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //1º Imprima os dados dos pacientes na tela
  print('\n// 1º - Pacientes');
  for (var paciente in pacientes) {
    print('$paciente');
  }

  // 2º Imprima os pacientes acima de 20 anos
  print('\n// 2º - Pacientes acima de 20 anos');
  List<String> pacientesSelecionados =
      []; // Lista para guardar os pacientes acima de 20 anos
  for (var paciente in pacientes) {
    List<String> procuraPacienteMaiorVinte = paciente.split('|');
    int idadePaciente = int.parse(procuraPacienteMaiorVinte[1]);
    if (idadePaciente > 20) {
      pacientesSelecionados.add(
          paciente); // Adiciona à lista os pacientes que têm mais de 20 anos
    }
  }

  for (var paciente in pacientesSelecionados) {
    print(paciente);
  }

  // 3º Imprima a quantidade de pacientes por profissão
  // Inicializando os contadores
  int desenvolvedor = 0;
  int estudante = 0;
  int dentista = 0;
  int jornalista = 0;

  // Percorrendo cada paciente
  for (var paciente in pacientes) {
    // Separando os dados do paciente
    List<String> separaPacientes = paciente.split('|');

    // Verificando a profissão e incrementando o contador apropriado
    if (separaPacientes[2] == 'desenvolvedor') {
      desenvolvedor++;
    } else if (separaPacientes[2] == 'estudante') {
      estudante++;
    } else if (separaPacientes[2] == 'dentista') {
      dentista++;
    } else if (separaPacientes[2] == 'jornalista') {
      jornalista++;
    }
  }
  print('\n// 3º - Quantidade de pacientes por profissão');
  print('- Quantidade de Desenvolvedore(s):  ${desenvolvedor}');
  print('- Quantidade de Estudante(s):  ${estudante}');
  print('- Quantidade de Dentista(s):  ${dentista}');
  print('- Quantidade de Jornalista(s):  ${jornalista}');

  // 4º Imprima os pacientes por profissão.
  // Deve ser impresso apenas Nome, idade e profissão.
  print('\N// 4º - Pacientes que moram em SP');
  for (var paciente in pacientes) {
    // método contains verifica se na string paciente possui os caracteres 'SP'
    if (paciente.contains('SP')) {
      print(paciente);
    }
  }

  // 5º Exclua todos os estudantes e em seguida imprima os pacientes
  print('\N// 5º - Remover estudantes e imprimir os pacientes');
  /*
  * método removeWhere percorre cada elemento da lista pacientes
  * a função passada como argumento = (paciente) => paciente.contains('estudante') é uma função anônima, que retorna true se o elemento paciente tiver a palavra estudante
  * sempre que essa condição for verdadeira, removeWhere remove o elemento correspondente da lista - no caso, paciente (que foi passado como argumento)
  * resumo: todos os pacientes com a palavra 'estudante' serão removidos da lista pacientes
   */
  pacientes.removeWhere((paciente) => paciente.contains('estudante'));
  for (var paciente in pacientes) {
    print(paciente);
  }

  // 6º Inclua os pacentes abaixo nas primeira posições
  final novosPacientes = [
    'Manoel Silva|12|estagiário|MG',
    'Joaquim Rahman|18|estagiário|SP',
    'Fernando Verne|35|estagiário|MG'
  ];

  // Adicionando os novos pacientes no início da lista
  pacientes.insertAll(0, novosPacientes);

  print('\n// 6º - Lista final de pacientes com estagiários incluídos');
  for (var paciente in pacientes) {
    print(paciente);
  }
}
