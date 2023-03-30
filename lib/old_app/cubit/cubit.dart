import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/local/api_manger.dart';
import 'states.dart';

class MainCubit extends Cubit<States> {
  MainCubit() : super(InitStates());
  static MainCubit get(context) => BlocProvider.of(context);
    List sources=[];
  void userDoctor(
      {required double latitude, required double longitude, required int id}) {

    DioHelper.putData(
        url: "DoctorCoordinate/update/$id?latitude=$latitude&longitude=$longitude&Status=1",
        data: {"latitude": latitude, "longitude": longitude, "id": id}).then((value){
          print(value.data);
          sources=value.data;
          emit(GetDoctorSuccessStates());
    }).catchError((error){
         print(error);
         emit(GetDoctorErrorStates());
    });
  }

}
