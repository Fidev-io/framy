String generateDrawer() => '''
class FramyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
                child: Text('Framy App'),
              ),
              ListTile(
                leading: Icon(Icons.text_fields),
                title: Text('Typography'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Color scheme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';
