import 'dart:io';

class Task {
  static void taskInit() {
    List<String> notas = [];
    Task.menu(notas);
  }

  static List<String> insert(List<String> notas) {
    print('Escreva uma nota:');
    String? nota = "";
    nota = stdin.readLineSync().toString();
    if (nota.isEmpty) {
      insert(notas);
    }
    print('Nota criada: $nota.');
    notas.add(nota);

    return notas;
  }

  static void findAll(List<String> notas) {
    if (notas.isEmpty) {
      print('Não há notas');
      menu(notas);
    }
    for (int i = 0; i < notas.length; i++) {
      print('Suas notas:');
      print(" ${i + 1}) ${notas[i]}");
    }
  }

  static void remove(List<String> notas) {
    print('');
    print('');
    String response = '';
    print('Remova uma nota');
    print('');
    findAll(notas);
    response = stdin.readLineSync().toString();
    int index = int.parse(response) - 1;
    notas.removeAt(index);
    print('Digite\n\n1 - Remover nova nota\n2 - Sair');
    response = stdin.readLineSync().toString();
    if (response.isEmpty) {
      menu(notas);
    } else {
      if (response.contains('1')) {
        remove(notas);
      } else {
        menu(notas);
      }
    }
  }

  static void menu(List<String> notas) {
    print("");
    String input = _getComando();
    print("");
    switch (input) {
      case '1':
        Task.insert(notas);
        menu(notas);
        break;
      case '2':
        Task.findAll(notas);
        menu(notas);
        break;
      case '3':
        remove(notas);
        break;
      case '4':
        sair();
        break;
    }
  }

  static String _getComando() {
    print(
        "Digite um comando:\n1 - Adicionar nota\n2 - Listar notas\n3 - Remove\n4 - Sair");
    List<String> comands = ["1", "2", "3", "4"];
    String? inPut = "";

    inPut = stdin.readLineSync().toString();
    if (inPut.isEmpty || !comands.contains(inPut)) {
      print('Por favor, digite algo');
      _getComando();
    }
    return inPut;
  }

  static void sair() {
    print('Adeus!! Aplicação de notas finalizada');
  }
}
