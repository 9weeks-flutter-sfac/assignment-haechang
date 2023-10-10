import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  String a = '''
xbwrdmplfjgmjuvcfvjsmsrskxgnxdpnwhgoqhlt
pqdaaqiwgsjrqihjmwtlnkeujpanittylhziyzjb
qvimbvvptflrbahyqaokefsbsoepirynzrrodvsi
tsxuejzstvhosgnvrkmqztkungvpkwvcmmpynoxq
silgbjthjdiselckwjyeoeymxbrythqtgzsbyoou
goczlkbseerrsruolgfdkcknierpibmhfarocflf
xbyygxzzfkdxyaaischvmqzmcyljftghfrrfsxqv
hidygaqcxfyxrjyzjsqlfqvivexvtgeqhlykgflw
dorlwemswbwbudkypspwpuwvllygonqwutrqeims
xfjhkahngpojdoudtslbhfdoxhrlollkpwiyenyr
vdxdindfnujvcqzkporfiuywonkkulsxusudmdra
olkiwicnevzrgjfpsfnxxaslrkpkdtylureicfmn
vgzcnfmqekejecsgisjpcyoyfewyptoyibazbhzz
qclokdthasozrqokkvqidslrumbsmukqjpmxfjxr
yifrbxievbdhowqyfwuqpxrwwwisxbaibtaoajug
qymnicvqlfrzxlrzvimznzjadlqrsnysvegydsqh
vaugisjpqcbdkbahismxxdyuyknvarrjetpqlkdi
vgfodmvdjvfixttbvbvcisgnqquvjhxjbamwdkwz
cyknkjspuppqdwgfoftitstsgnboyvcxyihptrbz
jasztnunctxicdtbqoxmsfyzlhccjirlshksoozg
mlmjgnwswuhyzvzlzdmqiboiqhhjfnxmjzbtbced
anriuxamqwktrleextoafoisfnksbxoluoytupqg
xllclbmhfsvciadiwjwiqjoahfhhxewiphnmeids
xplggkmyttjqqpnfwtoizmioujdqptfsqnzcztya
lcdmvujeqrgtyersulhrvuigtzjbmthrrarwisjl
lfneuoebbhmilkxwsqibanlpphapsejlhpemrnnw
rmkvnmzmcydjuegsfkniwmltuppkxzdxnwavimxd
zgtblluyjrxdziqktdgofoaufsrsgximdojhjdvb
pmjlqzoxagfwowjgrdtgyqjjxustmpsqrxocxfno
mcdthwaqhdygokwoviedxxiiwztcymxxuqspwyup
wrfrcxwqclapmbszprsengbfwgiubynoarqajvmd
zqvhrloveowltmjclgfdbanqigsagyahyyyxwisx
qqqwfhuecwdevktjfilrtzmggytvrsjfyjfrbkny
nnthltnehoeahrlgjyhxhuziqwftqmpmyxdhvabv
lwhqdqeralktdklrbiipmnimzazobkvfxpmguknj
aywmpruovglpohacgwfmjzbradwwhmndkdfkyxuh
dpqvrcupynlkygdwamxtzqabchhtiwdwyfweyvib
iltgovjwzdmmqnrkytewlpwgwmmrxksxxaskjugc
zgvahbxbqrrxpgvzelucrxdlmbvbyydtbazzbfra
hflbgjqlmqabtatxesfalxjjfhuvyiyzgpfwjtct
''';
  List b = a.split('');
  int sum = 0;
  for (var i = 0; i < b.length; i++) {
    if (b[i] == 'a') {
      sum++;
    }
  }
  print(sum);
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'neo'),
//       home: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             colorFilter:
//                 ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
//             fit: BoxFit.cover,
//             image: NetworkImage(
//                 'https://images.unsplash.com/photo-1682686580950-960d1d513532?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
//           ),
//         ),
//         child: MainPage(),
//       ),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.transparent,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Stack(children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 70),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 140.0),
//                     child: Text(
//                       '10월 5일 목요일',
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(80, 100, 0, 0),
//                   child: Text(
//                     '17:19',
//                     style: TextStyle(fontSize: 108, color: Colors.green),
//                   ),
//                 ),
//                 Positioned(
//                     top: 150,
//                     left: -200,
//                     child: CircleAvatar(
//                       radius: 200,
//                       backgroundImage: AssetImage(
//                           'assets/png-transparent-moon-moon-atmosphere-monochrome-sphere-thumbnail.png'),
//                     ))
//               ]),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Stack(children: [
//         Align(
//           alignment:
//               Alignment(Alignment.bottomLeft.x + 0.2, Alignment.bottomRight.y),
//           child: FloatingActionButton(
//             backgroundColor: Colors.black,
//             onPressed: () {},
//             child: Icon(Icons.flashlight_on),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: FloatingActionButton(
//             backgroundColor: Colors.black,
//             onPressed: () {},
//             child: Icon(
//               Icons.photo_camera,
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
