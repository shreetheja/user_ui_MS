import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_ms_ui/src/buisness-logic/models/batches.dart';
import 'package:user_ms_ui/src/buisness-logic/models/colleges.dart';
enum SignupState{
  signup1,
  signup2,
  signup3,
  finished
}

class SignUpController extends ChangeNotifier{
  SignupState currentState = SignupState.signup1;
  late GlobalKey<FormState> currentFormKey;
  late Function reload;
  static SignUpController? instance;

  static get getInstance {
    instance ??= SignUpController();
    return instance;
  }

  TextEditingController uidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DateRangePickerController dobDateController = DateRangePickerController();
  String selectedDob = "";

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? selectedCollegeId;
  String? selectedCollege;
  String? selectedBatch;
  String? selectedBatchId;
  late AllCollegesModel loadedCollegeData;
  late AllBatchesModel loadedBathData;


  void currentStateToSignup1(SignupState currentStateToSignup1) {
    currentState = currentStateToSignup1;
    reload();
  }

  void currentStateToSignup2(SignupState state){
    if(!currentFormKey.currentState!.validate() || dobDateController.selectedDate==null || selectedDob=="nil"){
      return;
    }
    currentState = state;
    reload();
  }

  void currentStateToSignup3(SignupState state){
    if(!currentFormKey.currentState!.validate()){
      return;
    }
    currentState = state;
    reload();
  }

  void currentStateToFinished(SignupState state) async{
    currentState = state;
    reload();
  }

  void updateSelectedCollege(String selectedCollege){
    this.selectedCollege = selectedCollege;
    for(College item in loadedCollegeData.college){
      if(item.c_name == selectedCollege){
        selectedCollegeId = item.c_id;
        break;
      }
    }
    reload();
  }

  void updateSelectedBatch(String selectedBatch){
    this.selectedBatch = selectedBatch;
    for(Batch batchData in loadedBathData.batch){
      if(batchData.b_id+ ' : '+batchData.b_desc == selectedBatch){
        selectedBatchId = batchData.b_id;
        break;
      }
    }
  }
}
