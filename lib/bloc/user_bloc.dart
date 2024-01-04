import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';


class UserBloc extends BlocBase{

  final userController = BehaviorSubject();
}