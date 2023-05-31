import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação entre Páginas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const navegacao(),
    );
  }
}

class navegacao extends StatefulWidget {
  const navegacao({super.key});

  @override
  _navegacao createState() => _navegacao();
}

class _navegacao extends State<navegacao> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação entre Páginas'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Text('Página Inicial',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Text('Página de Notificações',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Text('Página do Perfil',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
