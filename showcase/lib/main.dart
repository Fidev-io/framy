import 'package:counter_app/main.app.framy.dart' as counterApp;
import 'package:flutter/material.dart';
import 'package:weight_tracker/main.app.framy.dart' as weightTrackerApp;

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
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    final routes = {
      AppRoutes.couterRoute: ApplicationPage(page: counterApp.FramyApp()),
      AppRoutes.weightTrackerRoute: ApplicationPage(
        page: weightTrackerApp.FramyApp(),
      ),
    };
    final page = routes[settings.name] ?? ShowcasePage();
    return PageRouteBuilder<dynamic>(
      pageBuilder: (_, __, ___) => page,
      settings: settings,
    );
  }
}

class AppRoutes {
  static const couterRoute = '/counter';
  static const weightTrackerRoute = '/weight-tracker';
}

class ShowcasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Framy examples', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          runSpacing: 24,
          spacing: 24,
          children: [
            ExampleCard(
              title: 'Counter',
              image: 'assets/counter.png',
              routeName: AppRoutes.couterRoute,
              description: 'Generated Framy app for well-known Counter app!',
            ),
            ExampleCard(
              title: 'Weight tracker',
              image: 'assets/weight_tracker.png',
              routeName: AppRoutes.weightTrackerRoute,
              description: 'Generated Framy app for Weight-Tracker prototype!',
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String routeName;

  const ExampleCard(
      {Key key, this.title, this.description, this.image, this.routeName})
      : super(key: key);

  void onPressed(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = 600.0;
    final maxHeight = 400.0;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AspectRatio(
        aspectRatio: maxWidth / maxHeight,
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.white.withOpacity(0.3)],
                  ),
                ),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(title, style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(description, maxLines: 4)),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () => onPressed(context),
                            child: Text('View →'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationPage extends StatelessWidget {
  final Widget page;

  const ApplicationPage({Key key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        page,
        Positioned(
          bottom: 0,
          left: 6,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('← Showcase App'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
