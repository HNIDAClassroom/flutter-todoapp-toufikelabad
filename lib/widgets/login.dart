import 'package:flutter/material.dart';
import 'package:tp3/widgets/tasks.dart';

class Login extends StatefulWidget {
  const Login();
  @override
  LoginPage createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  String username = '';
  String password = '';
  Color backgroundColor = Colors.white; // Couleur de fond initiale

  Future<String?> handlePressed() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Nice!'),
              content: Text('Hello $username'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Thanks!'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: SizedBox(
                height: 350,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        // Naviguer vers la page des tâches (Tasks) lorsque le bouton "Submit" est appuyé
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tasks()),
                        );
                      },
                      child: const Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          backgroundColor =
                              Colors.blue; // Changer la couleur de fond en bleu
                        });
                      },
                      child: const Text("Changer la couleur en bleu"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor, // Utiliser la couleur de fond dynamique
    );
  }
}
