String generateTogglePage() => '''
class FramyTogglePage extends StatefulWidget {
  const FramyTogglePage() : super(key: const Key('FramyTogglePage'));

  @override
  _FramyTogglePageState createState() => _FramyTogglePageState();
}

class _FramyTogglePageState extends State<FramyTogglePage> {
  bool switchState = false;
  List<bool> toggleState = [false, true, false];
  bool checkboxState = false;
  String radioState = 'Option A';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('Switch'),
            Switch(
              value: switchState,
              onChanged: (bool value) => setState(() => switchState = value),
            ),
            const FramyHeaderText('Toggle buttons'),
            const SizedBox(height: 8),
            ToggleButtons(
              onPressed: (index) =>
                  setState(() => toggleState[index] = !toggleState[index]),
              isSelected: toggleState,
              children: [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_align_center),
              ],
            ),
            const SizedBox(height: 8),
            const FramyHeaderText('Checkbox'),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) => setState(() => checkboxState = value),
              value: checkboxState,
              title: Text('Option'),
            ),
            const FramyHeaderText('Radio'),
            RadioListTile(
              value: 'Option A',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option A'),
            ),
            RadioListTile(
              value: 'Option B',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option B'),
            ),
          ],
        ),
      ),
    );
  }
}
''';