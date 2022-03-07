// import 'package:flutter/material.dart';
// import 'package:petfitproject/Network/request_state.dart';
// import 'package:petfitproject/Network/response.dart';
// import 'package:petfitproject/vdart/Vmodel/newsapi.dart';
// import 'package:petfitproject/vdart/vbloc/NewsHeaderBloc.dart';


// class Newsheadlines extends StatefulWidget {
//   const Newsheadlines({Key? key}) : super(key: key);

//   @override
//   _NewsheadlinesState createState() => _NewsheadlinesState();
// }

// class _NewsheadlinesState extends State<Newsheadlines> {

//  // ignore: non_constant_identifier_names
//  INewsHeaderBloc? _INewsHeaderBloc;
//  Response<NewsApi?> newsResponse =
//       Response(null, RequestState.INITIATE, null);

      
//   _initLoginBloc() {
//     _INewsHeaderBloc ??= NewsHeaderBloc();
//   }


//  INewsHeaderBloc _getnewsHeaderBloc() {
//     _initLoginBloc();
//     return _INewsHeaderBloc!;
//   }

//        @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       _initLoginBloc();
//     });
//   }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('newsheadline')),
//       body: FutureBuilder<List<NewsApi>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                       color: const Color(0xff97FFFF),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${snapshot.data![index].articles}",
//                           style: const TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text("${snapshot.data![index].totalResults}"),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
      
//     );
//   }
// }


