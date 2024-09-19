import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isSwitchOn = false;
  String _textFieldValue = '';

  void _toggleSwitch(bool newValue) {
    setState(() {
      _isSwitchOn = newValue;
    });
  }

  void _updateTextField(String newText) {
    setState(() {
      _textFieldValue = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Toggle Switch:',
              style: TextStyle(fontSize: 16),
            ),
            Switch(
              value: _isSwitchOn,
              onChanged: _toggleSwitch,
            ),
            const SizedBox(height: 20),
            const Text(
              'Text Field:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              onChanged: _updateTextField,
              decoration: const InputDecoration(
                hintText: 'Enter some text',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Current Text:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              _textFieldValue,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
