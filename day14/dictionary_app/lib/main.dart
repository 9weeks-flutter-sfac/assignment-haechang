// ignore_for_file: prefer_const_constructors

import 'package:dictionary_app/model/dictionary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var dio = Dio();

  List<Dictionary>? dictionary = [];

  searchData(String value) async {
    var res = await dio
        .get('https://api.dictionaryapi.dev/api/v2/entries/en/' + value);
    var resList = List<Map<String, dynamic>>.from(res.data);
    dictionary = resList.map((e) => Dictionary.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        searchData(value);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            dictionary!.isEmpty
                ? Text('')
                : Expanded(
                    child: Container(
                      color: Colors.grey.shade800,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: dictionary!.map((e) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          e.word,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: e.meanings.map((e) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    e.partOfSpeech,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('- Synonyms:'),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children:
                                                          e.synonyms.map((e) {
                                                        return Text(e);
                                                      }).toList(),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('- Antonyms:'),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children:
                                                          e.antonyms.map((e) {
                                                        return Text(e);
                                                      }).toList(),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('- Definition:'),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: e
                                                                .definitions
                                                                .map((e) {
                                                              return Text(
                                                                  e.definition);
                                                            }).toList()),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      )
                                    ],
                                  );
                                }).toList()),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
// dictionary!.map((e) => e.meanings.map((e) => e.definitions.map((e) => Text(e.definition))).toList()),
// dictionary[index].word
// dicionary[index].meaning[index].partOfSpeech
// dicionary[index].meaning[index].definitions[index].definition
// dicionary[index].meaning[index].definitions[index].synonyms
// dicionary[index].meaning[index].definitions[index].antonyms
// dicionary[index].meaning[index].definitions[index].example
