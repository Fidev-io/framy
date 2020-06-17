import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      routes: {
        '/': (_) => ShowcasePage(),
      },
    );
  }
}

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Framy showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 800),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 0.5,
                child: Column(
                  children: [
                    Text(
                      '👇This is your app👇',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 16),
                    Expanded(child: MyApp()),
                  ],
                ),
              ),
              SizedBox(width: 32),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '👇This is generated Framy app👇',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 16),
                    Expanded(child: FramyApp()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
