import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:firebase_database/firebase_database.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late DatabaseReference _wordsRef;
  late StreamSubscription<DatabaseEvent> _wordsSubscription;

  bool initialized = false;
  Map<String, num> _words = {};
  List<Widget> _wordWidgets = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _wordsRef = FirebaseDatabase.instance.ref('words');

    final database = FirebaseDatabase.instance;

    database.setLoggingEnabled(false);

    if (!kIsWeb) {
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);
    }

    if (!kIsWeb) {
      await _wordsRef.keepSynced(true);
    }

    setState(() {
      initialized = true;
    });

    try {
      final wordsSnapshot = await _wordsRef.get();

      print(
        'Connected to directly configured database and read '
        '${wordsSnapshot.value}',
      );
    } catch (err) {
      print(err);
    }

    _wordsSubscription = _wordsRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _words = ((event.snapshot.value ?? {}) as Map)
            .map((key, value) => MapEntry(key as String, value as num));
        _wordWidgets = (_words.entries.toList()
              ..sort(
                (e1, e2) => e1.value.compareTo(e2.value),
              ))
            .map((e) => Text(
                  e.key,
                  style: TextStyle(
                    fontSize:
                        (e.value / (_words.values.toList()..sort()).first) * 10,
                  ),
                ))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: WordCloud(_wordWidgets),
      ),
    );
  }
}

class WordCloud extends StatelessWidget {
  final List<Widget> widgets;

  WordCloud(this.widgets);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Center(
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Scatter(
            fillGaps: true,
            delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
            children: widgets,
          ),
        ),
      ),
    );
  }
}
