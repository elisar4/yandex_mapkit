import 'package:flutter/material.dart';
import 'package:yandex_mapkit_example/examples/layers_page.dart';
import 'package:yandex_mapkit_example/examples/map_controls_page.dart';
import 'package:yandex_mapkit_example/examples/page.dart';
import 'package:yandex_mapkit_example/examples/placemark_page.dart';
import 'package:yandex_mapkit_example/examples/polyline_page.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

final List<Page> _allPages = <Page>[
  const LayersPage(),
  const MapControlsPage(),
  const PlacemarkPage(),
  const PolylinePage(),
];

class MainPage extends StatelessWidget {
  void _pushPage(BuildContext context, Page page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) =>
        Scaffold(
          appBar: AppBar(title: Text(page.title)),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: page
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YandexMap examples')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}
