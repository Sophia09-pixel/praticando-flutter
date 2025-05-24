import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Perfis> perfis = [
    Perfis(1, 'Livia Gallafrio', 'lili@gmail.com'),
    Perfis(2, 'Sophia de Sousa', 'Sophicooper@gmail.com'),
    Perfis(3, 'Luis Miguel', 'LuisMiguel@gmail.com'),
    Perfis(4, 'Alanzoka', 'alanzoka@gmail.com'),
    Perfis(5, 'Leon', 'leon@gmail.com'),
  ];
  int totalFavoritos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Perfil')),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Michael Scott'),
              accountEmail: Text('m.scott@dundler.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/michael.png'),
              ),
            ),
            Column(
              children: [
                ListTile(leading: Icon(Icons.person), title: Text('Perfil')),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Repositorios'),
                ),
                ListTile(leading: Icon(Icons.star), title: Text('Favoritos')),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/michael.png'),
              ),
              SizedBox(height: 9),
              Text(
                'Michael Scott',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Mcott',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 171, 171, 171),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map),
                      SizedBox(width: 8),
                      Text('Brazil, São Paulo, SP'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('m.scott@dundler.com'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 8),
                      Text('32', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('Seguidores'),
                      SizedBox(width: 8),
                      Text("45", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text("seguindo"),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25),
              Text(
                'Perfis favoritos $totalFavoritos',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: perfis.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=${perfis[index].id}',
                          ),
                        ),
                        title: Text(perfis[index].nomeCompleto),
                        subtitle: Text(perfis[index].email),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite),
                          color: setColor(index),
                          onPressed: () {
                            setState(() {
                              setFavorite(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setFavorite(index) {
    perfis[index].favorito = !perfis[index].favorito;
    if (perfis[index].favorito) {
      totalFavoritos++;
    } else {
      totalFavoritos--;
    }
  }

  Color setColor(index) {
    Color color;
    if (perfis[index].favorito) {
      color = Colors.red;
    } else {
      color = Colors.grey;
    }
    return color;
  }
}

class Perfis {
  int id;
  String nomeCompleto;
  String email;
  bool favorito = false;

  Perfis(this.id, this.nomeCompleto, this.email, {this.favorito = false});
}
