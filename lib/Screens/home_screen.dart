import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();

  static const String KEYNAME = "name";

  var nameValue = "No Value Saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
            ),
            SizedBox(height: 11),
            ElevatedButton(
              onPressed: () async {
                var name = nameController.text.toString();
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(KEYNAME, name);
              },
              child: Text("Save"),
            ),
            Text(nameValue)
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(KEYNAME);

    nameValue = getName != null ? getName : "No Value Saved";

    setState(() {});
  }
}
