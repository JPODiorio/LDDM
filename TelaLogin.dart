import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.blue,
        ),
        drawer: const Drawer(),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 300,
                child: const TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 300,
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Novo aqui?',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.example.com');
                    },
                    child: const Text(' Criar nova conta',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Minha Conta',
            ),
          ],
        ),
      ),
    );
  }
}
