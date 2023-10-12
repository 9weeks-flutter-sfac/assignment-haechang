class Dictionary {
  final String word;
  final String phonetic;
  final List<Phonetics> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  Dictionary({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    final List<dynamic> phoneticsList = json['phonetics'];
    final List<Phonetics> phonetics = phoneticsList
        .map((e) => Phonetics.fromJson(e as Map<String, dynamic>))
        .toList();

    final List<dynamic> meaningsList = json['meanings'];
    final List<Meaning> meanings = meaningsList
        .map((e) => Meaning.fromJson(e as Map<String, dynamic>))
        .toList();

    return Dictionary(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String,
      phonetics: phonetics,
      meanings: meanings,
      license: License.fromJson(json['license'] as Map<String, dynamic>),
      sourceUrls: List<String>.from(json['sourceUrls'] as List<dynamic>),
    );
  }
}

class Phonetics {
  final String text;
  final String audio;
  final String sourceUrl;

  Phonetics({
    required this.text,
    required this.audio,
    required this.sourceUrl,
  });

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return Phonetics(
      text: json['text'] as String,
      audio: json['audio'] as String,
      sourceUrl: json['sourceUrl'] as String,
    );
  }
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    final List<dynamic> definitionsList = json['definitions'];
    final List<Definition> definitions = definitionsList
        .map((e) => Definition.fromJson(e as Map<String, dynamic>))
        .toList();

    return Meaning(
      partOfSpeech: json['partOfSpeech'] as String,
      definitions: definitions,
      synonyms: List<String>.from(json['synonyms'] as List<dynamic>),
      antonyms: List<String>.from(json['antonyms'] as List<dynamic>),
      example: json['example'] != null ? json['example'] : null,
    );
  }
}

class Definition {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'] as String,
      synonyms: List<String>.from(json['synonyms'] as List<dynamic>),
      antonyms: List<String>.from(json['antonyms'] as List<dynamic>),
    );
  }
}

class License {
  final String name;
  final String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
