import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool visivel = false;
  TextEditingController nome = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  int max = 25;
  int atual = 0;
  String generoSelecionado = '';
  double tamanhoFonte = 16.0;
  bool notificarPorEmail = false;
  bool notificarPorTelefone = false;

  @override
  void initState() {
    super.initState();
    senha.addListener(_updatePasswordLength);
  }

  void _updatePasswordLength() {
    setState(() {
      atual = senha.text.length;
    });
  }

  void _handleGeneroSelecionado(String? valor) {
    setState(() {
      generoSelecionado = valor ?? '';
    });
  }

  void _alterarTamanhoFonte(double valor) {
    setState(() {
      tamanhoFonte = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: tamanhoFonte),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nome,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: dataNascimento,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: senha,
                obscureText: !visivel,
                maxLength: max,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                    icon: Icon(
                      visivel ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        visivel = !visivel;
                      });
                    },
                  ),
                  counterText: '',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Password Length: $atual/$max',
                style: TextStyle(
                  fontSize: 12,
                  color: atual <= max ? Colors.grey : Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Gênero:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                title: const Text('Masculino'),
                value: 'masculino',
                groupValue: generoSelecionado,
                onChanged: _handleGeneroSelecionado,
              ),
              RadioListTile(
                title: const Text('Feminino'),
                value: 'feminino',
                groupValue: generoSelecionado,
                onChanged: _handleGeneroSelecionado,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Notificar por e-mail',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: notificarPorEmail,
                    onChanged: (value) {
                      setState(() {
                        notificarPorEmail = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Notificar por telefone',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: notificarPorTelefone,
                    onChanged: (value) {
                      setState(() {
                        notificarPorTelefone = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Slider(
                value: tamanhoFonte,
                min: 10.0,
                max: 30.0,
                onChanged: _alterarTamanhoFonte,
              ),
              Text(
                'Tamanho da Fonte: ${tamanhoFonte.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Cadastro',
    home: RegistrationScreen(),
  ));
}
