import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: FittedBox(
            child: Scatter(
                fillGaps: true,
                delegate: ArchimedeanSpiralScatterDelegate(
                    ratio: MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height),
                children: (_words.entries.toList()
                      ..sort(
                        (e1, e2) => e1.value.compareTo(e2.value),
                      ))
                    .map((e) => SizedBox(
                          width: e.value /
                              (_words.values.toList()..sort()).first *
                              0.1 *
                              MediaQuery.of(context).size.width,
                          child: FittedBox(
                            child: Text(
                              e.key,
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
