import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllertext = TextEditingController();
  String translated = "Translation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.translate),
        centerTitle: true,
        title: const Text("Translation"),
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const Text("English (US)"),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(hintText: "Enter text "),
                    controller: controllertext,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      final convertTraslation = await controllertext.text
                          .translate(from: 'en', to: 'ur');
                      setState(() {
                        translated = convertTraslation.text;
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Urdu"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  translated,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
