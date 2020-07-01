String generateButtonPage() => '''
class FramyButtonPage extends StatefulWidget {
  const FramyButtonPage() : super(key: const Key('FramyButtonPage'));

  @override
  _FramyButtonPageState createState() => _FramyButtonPageState();
}

class _FramyButtonPageState extends State<FramyButtonPage> {
  String selectedOptionInDropdown;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FramyHeaderText('Raised button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  RaisedButton(child: Text('Button'), onPressed: () {}),
                  RaisedButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Flat button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  FlatButton(child: Text('Button'), onPressed: () {}),
                  FlatButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Outline button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  OutlineButton(child: Text('Button'), onPressed: () {}),
                  OutlineButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Floating Action Button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    heroTag: 'FabTag1',
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.delete),
                    onPressed: null,
                    heroTag: 'FabTag2',
                  ),
                  FloatingActionButton.extended(
                    icon: Icon(Icons.delete),
                    label: Text('Button'),
                    onPressed: () {},
                    heroTag: 'FabTag3',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Icon button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Dropdown button'),
              const SizedBox(height: 4),
              DropdownButton(
                hint: Text('Select option'),
                value: selectedOptionInDropdown,
                onChanged: (option) =>
                    setState(() => selectedOptionInDropdown = option),
                items: [
                  DropdownMenuItem(
                    child: Text('Option A'),
                    value: 'Option A',
                  ),
                  DropdownMenuItem(
                    child: Text('Option B'),
                    value: 'Option B',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';
