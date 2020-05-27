String generateMaterialComponentsPage() => '''
class MaterialComponentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Raised buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(child: Text('Active'), onPressed: () {}),
                const SizedBox(width: 16),
                RaisedButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Flat buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(child: Text('Active'), onPressed: () {}),
                SizedBox(width: 16),
                FlatButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Outline buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(child: Text('Active'), onPressed: () {}),
                SizedBox(width: 16),
                OutlineButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Floating action buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: Text('A'),
                  onPressed: () {},
                  heroTag: null,
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  child: Text('D'),
                  onPressed: null,
                  heroTag: null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Textfields'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Underline textfield',
                hintText: 'Some hint',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Underline disabled textfield',
                hintText: 'Some hint',
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Filled underline textfield',
                hintText: 'Some hint',
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Filled underline disabled textfield',
                hintText: 'Some hint',
                filled: true,
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline textfield',
                hintText: 'Some hint',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline disabled textfield',
                hintText: 'Some hint',
                border: OutlineInputBorder(),
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            Text('App Bar'),
            const SizedBox(height: 4),
            AppBar(title: Text('AppBar')),
            const SizedBox(height: 16),
            Text('Bottom navigation Bar'),
            const SizedBox(height: 4),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 1')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 2')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 3')),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
''';
