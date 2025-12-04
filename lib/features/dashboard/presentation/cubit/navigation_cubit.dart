import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class TabModel {
  final String title;
  final int index;

  TabModel({required this.title, required this.index});
}

class NavigationCubit extends Cubit<TabModel> {
  NavigationCubit() : super(TabModel(title: "Tickets", index: 0));

  //  Set Current tab
  void setTab(TabModel tab) => emit(tab);
}
