import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'porovider/language.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // final Language _languages = Language();
  final List<String> _languages = ['FR', 'EN'];
  dynamic _selectedLanguage;
  bool _darkMode = false;
  bool _notifications = false;

  @override
  void initState() {
    super.initState();
    getSelectedPref();

    ///setState(() => _languages.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: const Text('Shared Peferences'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                color: Colors.purple,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline4,
                    //.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Change Language'),
                    leading: const Icon(
                      FontAwesomeIcons.language,
                      color: Colors.purple,
                    ),
                    trailing: DropdownButton(
                      hint: const Text('Language'),
                      value: _selectedLanguage,
                      onChanged: (newValue) async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString('language', newValue.toString());

                        setState(() {
                          _selectedLanguage = newValue;
                        });
                      },
                      items: _languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        );
                      }).toList(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Dark Mode'),
                    leading: const Icon(
                      FontAwesomeIcons.brush,
                      color: Colors.black,
                    ),
                    trailing: Switch(
                        activeColor: Colors.blue,
                        value: _darkMode,
                        onChanged: (val) async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setBool('darkMode', val);
                          setState(() {
                            _darkMode = val;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Notifications'),
                    leading: const Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.red,
                    ),
                    trailing: Switch(
                        activeColor: Colors.blue,
                        value: _notifications,
                        onChanged: (val) async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setBool('notifications', val);
                          setState(() {
                            _notifications = val;
                          });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSelectedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = pref.getString('language');
      _darkMode = pref.getBool('darkMode')!;
      _notifications = pref.getBool('notifications')!;
    });
  }
}
