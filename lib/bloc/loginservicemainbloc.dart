// import 'dart:async';

// import 'package:petfitproject/Network/apiresponse.dart';
// import 'package:petfitproject/bloc/loginservicemainrepo.dart';
// import 'package:petfitproject/pojoClass/logindata.dart';

// class LoginServiceMainBloc {
//   String? email;
//   String? password;

//   LoginServiceMainRepo? _loginServiceRepository;
//   StreamController? _baseServiceController;

//   StreamSink<dynamic>? get baseserviceSink => _baseServiceController!.sink;

//   Stream<dynamic>? get baseserviceStream => _baseServiceController!.stream;

//   loginserviceController() {
//     _baseServiceController = StreamController<ApiResponse<loginData>>();
//     _loginServiceRepository = LoginServiceMainRepo();
//     baseService(email, password);
//   }

//   baseService(email, password) async {
//     try {
//       loginData baseServicedata =
//           await _loginServiceRepository!.fetchBaseServiceData(email, password);
//       baseserviceSink!.add(ApiResponse.completed(baseServicedata));
//     } catch (e) {
//       baseserviceSink!.add(ApiResponse.error(e.toString()));
//     }
//   }

//   dispose() {
//     _baseServiceController!.close();
//   }
// }
