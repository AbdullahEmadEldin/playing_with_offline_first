import 'package:brick_core/core.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' show databaseFactory;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/brick/models/note.model.dart';
import 'package:test/brick/repository.dart';
import 'package:test/src/repository/notes_repo.dart';

void main() async {
  await Repository.configure(databaseFactory);
  // .initialize() does not need to be invoked within main()
  // It can be invoked from within a state manager or within
  // an initState()
  await Repository().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NoteService noteService;
  late final List<NoteRow> notes;
  @override
  void initState() {
    super.initState();
    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      Supabase.instance.client.auth.signInAnonymously();
    }

    noteService = NoteService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: noteService.getAllNotes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              if (!snapshot.hasData ||
                  (snapshot.hasData && snapshot.data!.isEmpty)) {
                return const Text('No data');
              }

              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final note = snapshot.data![index];
                  return ListTile(
                    title: Text(note.content),
                    subtitle: Text('00'),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            noteService.createNote(
              'Hello this is note',
              Supabase.instance.client.auth.currentUser!.id,
              ['Hla Hla'],
            );
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
