import 'package:assignment1/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  var ref = FirebaseFirestore.instance.collection('post').withConverter(
        fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
        toFirestore: (data, _) => data.toMap(),
      );

  List listId = ['hcGGMJgAdIEetbSCai8N', 'Wj5ckTKtgXUEetfhuVNR'];

  Future<List<QueryDocumentSnapshot<Post>>> readData() async {
    var items = await ref.get();
    print(items.docs[0].data().id);
    return items.docs;
  }

  likesUp(String id) {
    ref.doc(id).update({'likes': FieldValue.increment(1)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<QueryDocumentSnapshot<Post>>>(
          future: readData(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data![index].data().title),
                  subtitle: Text(snapshot.data![index].data().content),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      likesUp(listId[index]);
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
