import 'package:flutter/material.dart';
import 'package:my_waifu_flutter/list_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return const WelcomeWebPage();
        } else {
          return const WelcomeMobilePage();
        }
      },
    );
  }
}


class WelcomeMobilePage extends StatefulWidget {
  const WelcomeMobilePage({super.key});

  @override
  State<WelcomeMobilePage> createState() => _WelcomeMobilePageState();
}

class _WelcomeMobilePageState extends State<WelcomeMobilePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "My Waifu App",
                    style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                  ),
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Input your name...',
                    labelText: 'Your Name',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    final String name = _controller.text;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ListScreen(name);
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WelcomeWebPage extends StatefulWidget {
  const WelcomeWebPage({super.key});

  @override
  State<WelcomeWebPage> createState() => _WelcomeWebPageState();
}

class _WelcomeWebPageState extends State<WelcomeWebPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to My Waifu App',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("images/asuna.png"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                                  child: const Text("To start, enter your name", style: TextStyle(fontFamily: "Poppins",fontSize: 18, fontStyle: FontStyle.italic)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                                  child: TextField(
                                    controller: _controller,
                                    decoration: const InputDecoration(
                                      hintText: 'Input your name...',
                                      labelText: 'Your Name',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                                  child: ElevatedButton(
                                    child: const Text('Submit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    onPressed: () {
                                      final String name = _controller.text;
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return ListScreen(name);
                                      }));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

