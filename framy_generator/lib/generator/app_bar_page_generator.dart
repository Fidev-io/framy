String generateAppBarPage() => '''
class FramyAppBarPage extends StatelessWidget {
  const FramyAppBarPage() : super(key: const Key('FramyAppBarPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FramyHeaderText('AppBar'),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: BackButton(),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: CloseButton(),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Edit')),
                  PopupMenuItem(child: Text('Save')),
                  PopupMenuItem(child: Text('Delete')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
''';
