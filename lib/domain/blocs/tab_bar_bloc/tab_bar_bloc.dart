import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarBloc extends Cubit<int> {
  TabBarBloc() : super(0);
  void setTabIndex(int index) {
    emit(index);
  }
}
