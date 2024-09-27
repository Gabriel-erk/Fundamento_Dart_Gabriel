import 'dart:io';

// Definindo a classe Produto - para deixar organizado, tenho uma instância dela que represente um produto, e contenha os campos codigo, valor unitario e qntd estoque mais "interligados" do que usando uma lista
class Produto {
  // criando atributos
  int codigo;
  double valorUnitario;
  int quantidadeEmEstoque;

  Produto(this.codigo, this.valorUnitario, this.quantidadeEmEstoque);

  @override
  String toString() {
    return 'Código: $codigo, Valor: \$${valorUnitario.toStringAsFixed(2)}, Estoque: $quantidadeEmEstoque unidades';
  }
}

void main() {
  // lista que vai guardar meus produtos
  List<Produto> produtos = [];

  // Pedindo ao usuário para inserir 3 produtos
  for (int i = 0; i < 3; i++) {
    print('Digite o código do produto ${i + 1}:');
    // pegando o valor e convertendo para int
    int codigo = int.parse(stdin.readLineSync()!);

    print('Digite o valor unitário do produto ${i + 1}:');
    double valorUnitario = double.parse(stdin.readLineSync()!);

    print('Digite a quantidade em estoque do produto ${i + 1}:');
    int quantidadeEmEstoque = int.parse(stdin.readLineSync()!);

    // Criando o produto e adicionando à lista
    Produto produto = Produto(codigo, valorUnitario, quantidadeEmEstoque);
    produtos.add(produto);
  }

  print('Deseja comprar? (sim/nao)');
  // convertendo para minusculo os caracteres digitados antes de armazenar
  String? desejaComprar = stdin.readLineSync()!.toLowerCase();

  // váriavel que vai representar o número do pedido, e representar a quantidadde de itens vendidos
  int numeroPedido = 0;
  double valor_total_a_pagar = 0;
  // deixando em loop - caso responda sim para comprar novamente vai pedir o código do produto, se não encerra o loop, assim permitindo o usuário comprar quantas vezes quiser
  while (true) {
    if (desejaComprar == 'sim') {
      print('Digite o código do produto que deseja comprar:');
      int codigoProdUser = int.parse(stdin.readLineSync()!);

      // Verificando se o produto existe na lista
      try {
        // utilizando metodo firstWhere que percorre minha lista de produtos e encontra o primeiro produto cujo código seja igual ao 'codigoProduser', onde, se for encontrado, armazeno na minha váriavel, se não jogará um erro dizendo que não foi encontrado
        Produto produtoSelecionado =
            produtos.firstWhere((produto) => produto.codigo == codigoProdUser);
        print('Produto encontrado: ${produtoSelecionado}');
        print(
            'Valor por unidade do produto selecionado é: ${produtoSelecionado.valorUnitario}');
        while (true) {
          print(
              'Digite a quantidade desejada do produto: ${produtoSelecionado}');
          int qntdProdutoUser = int.parse(stdin.readLineSync()!);
          if (qntdProdutoUser > produtoSelecionado.quantidadeEmEstoque) {
            print(
                'Quantidade maior que temos em estoque, temos ${produtoSelecionado.quantidadeEmEstoque}, por favor, digite um valor válido');
          } else {
            numeroPedido++;
            produtoSelecionado.quantidadeEmEstoque -= qntdProdutoUser;
            // ir somando todas as "vendas" para calcular o total q o usuário irá pagar no final
            valor_total_a_pagar +=
                qntdProdutoUser * produtoSelecionado.quantidadeEmEstoque;
            // print('Você comprou ${qntdProdutoUser} unidades');
            print(
                'Venda ${numeroPedido} = ${qntdProdutoUser * produtoSelecionado.quantidadeEmEstoque} reais');
            print('Obrigado por comprar conosco, volte sempre!');
            break;
          }
        }
      } catch (e) {
        print('Produto com código $codigoProdUser não encontrado.');
      }
    } else {
      print('Operação de compra cancelada.');
    }
    print('Deseja comprar novamente? (sim/nao)');
    String? outraCompra = stdin.readLineSync()!.toLowerCase();
    if (outraCompra == 'sim') {
      continue;
    } else {
      // sai do código se não quiser comprar denovo
      break;
    }
  }

  print('Foram vendidos ${numeroPedido} itens');
  print('Valor a ser pago: ${valor_total_a_pagar}');
  // Exibindo as informações dos produtos
  // print('\nProdutos cadastrados:');
  // for (var produto in produtos) {
  //   print(produto);
  // }
}