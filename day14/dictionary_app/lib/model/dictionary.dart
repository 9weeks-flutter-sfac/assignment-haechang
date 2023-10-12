// ignore_for_file: public_member_api_docs, sort_constructors_first

class Dictionary {
  String word;
  String phonetic;
  List phonetics;
  List<Meaning> meanings;
  License license;
  String sourceUrls;
  Dictionary({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });
  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
        word: map['word'],
        phonetic: map['phonetic'],
        phonetics:
            List<Phonetic>.from(map['phonetics']), // phonetics를 따로 만들지 않고 적용
        meanings: List<Meaning>.from(map['meanings']),
        license: map['license'],
        sourceUrls: map['sourceUrls']);
  }
}

class Phonetic {
  String text;
  String audio;
  String sourceUrl;
  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
  });
  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
        text: map['text'], audio: map['audio'], sourceUrl: map['sourceUrl']);
  }
}

class License {
  String name;
  String url;
  License({
    required this.name,
    required this.url,
  });

  factory License.fromMap(Map<String, dynamic> map) {
    return License(name: map['name'], url: map['url']);
  }
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;
  List<String> synonyms;
  List antonyms;
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
        partOfSpeech: map['partOfSpeech'],
        definitions: List<Definition>.from(map['definitions']),
        synonyms: map['synonyms'],
        antonyms: map['antonyms']);
  }
}

class Definition {
  String definition;
  List synonyms;
  List antonyms;
  String? example;
  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
        definition: map['definition'],
        synonyms: map['synonyms'],
        antonyms: map['antonyms'],
        example: map['example']);
  }
}
