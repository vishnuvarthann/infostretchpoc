import 'package:petfitproject/bloc_cubit/service.dart';
import 'package:petfitproject/pojoClass/CountriesResponse.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  @override
  Future<CountriesResponse> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<CountriesResponse> fetchData();
}
