// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ms_ui/src/buisness-logic/models/apiResponse.dart';
import 'package:user_ms_ui/src/buisness-logic/models/batches.dart';
import 'package:user_ms_ui/src/buisness-logic/models/colleges.dart';
import 'package:user_ms_ui/src/buisness-logic/models/signupInfo.dart';
import 'package:user_ms_ui/src/buisness-logic/signup_page/signUpProvider.dart';
import 'package:user_ms_ui/src/views/signup/signupController.dart';
import 'package:user_ms_ui/src/views/utils/custom-dropdown.dart';
import 'package:user_ms_ui/src/views/utils/custom-snackbar.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Signup3 extends StatelessWidget {
  Signup3({Key? key}) : super(key: key);
  late SignUpController controller;
  @override
  Widget build(BuildContext context) {
    controller = SignUpController.getInstance;
    return LoaderOverlay(
      useDefaultLoading: false,
      child: ChangeNotifierProvider(
          create: (context) => SignUpProvier(),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            children: [
              const Text(
                'College Details',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40.0),
              FutureBuilder<ApiResponse<AllCollegesModel>>(
                  future: SignUpProvier().getAllColleges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var statusCode = snapshot.data!.statusCode;
                      if (statusCode != 200) {
                        return CustomDropdownItem(
                        isLoading: false,
                        isError: true,
                        label: 'College',
                        onChanged: (String? newValues) {},
                        validateString: 'Select a College',
                        selectedValue: controller.selectedCollege,
                      );
                      }
                      AllCollegesModel data = snapshot.data!.data!;
                      List<String> dropDown = [];
                      SignUpController instance = SignUpController.getInstance;
                      instance.loadedCollegeData = data;
                      for (College collegeData in data.college) {
                        dropDown.add(collegeData.c_name);
                      }
                      return CustomDropdownItem(
                        label: 'College',
                        menuItems: dropDown,
                        onChanged: (String? newValue) {
                          controller.updateSelectedCollege(newValue!);
                        },
                        validateString: 'Select a College',
                        selectedValue: controller.selectedCollege,
                      );
                    } else if (snapshot.hasError) {
                      return CustomDropdownItem(
                        isLoading: false,
                        isError: true,
                        label: 'College',
                        onChanged: (String? newValues) {},
                        validateString: 'Select a College',
                        selectedValue: controller.selectedCollege,
                      );
                    } else {
                      return CustomDropdownItem(
                        isLoading: true,
                        label: 'College',
                        onChanged: (String? newValues) {},
                        validateString: 'Select a College',
                        selectedValue: controller.selectedCollege,
                      );
                    }
                  }),
              batchLoader(),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: button,
                      elevation: 30,
                    ),
                    onPressed: () {
                      SignUpController controller =
                          SignUpController.getInstance;
                      controller.currentStateToSignup2(SignupState.signup2);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: button, elevation: 20),
                    onPressed: () async {
                      if (controller.currentFormKey.currentState!.validate()) {
                        context.loaderOverlay.show(widget: SubmitLoading());
                        SignUpProvier provider =  SignUpProvier();
                        SignupData data = SignupData.fromController(controller);
                        var resp = await provider.signup(data);
                        context.loaderOverlay.hide();
                        if (resp.statusCode == 200) {
                          controller
                              .currentStateToFinished(SignupState.finished);
                        } else {
                          CustomSnackBars.showSnackbar(
                              resp.message, Colors.red, context,);
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget batchLoader() {
    if (controller.selectedCollegeId == null) {
      return CustomDropdownItem(
        isLoading: true,
        label: 'Batches',
        onChanged: (String? newValues) {},
        validateString: 'Select a Batch',
      );
    } else {
      return FutureBuilder<ApiResponse<AllBatchesModel>>(
          future: SignUpProvier().getAllBatches(controller.selectedCollegeId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var statusCode = snapshot.data!.statusCode;
              if (statusCode != 200) {
                return CustomDropdownItem(
                  label: 'Batches',
                  isError: true,
                  onChanged: (String? newValues) {},
                  validateString: 'Select a Batch',
                );
              }
              AllBatchesModel data = snapshot.data!.data!;
              List<String> dropDown = [];
              SignUpController instance = SignUpController.getInstance;
              instance.loadedBathData = data;
              for (Batch batchData in data.batch) {
                dropDown.add(batchData.b_id + ' : ' + batchData.b_desc);
              }
              return CustomDropdownItem(
                label: 'Batches',
                menuItems: dropDown,
                onChanged: (String? newValue) {
                 controller.updateSelectedBatch(newValue!);
                },
                validateString: 'Select a Batch',
              );
            } else if (snapshot.hasError) {
              return CustomDropdownItem(
                isLoading: false,
                isError: true,
                label: 'Batches',
                onChanged: (String? newValues) {},
                validateString: 'Select a Batch',
              );
            } else {
              return CustomDropdownItem(
                isLoading: true,
                label: 'Batches',
                onChanged: (String? newValues) {},
                validateString: 'Select a Batch',
              );
            }
          });
    }
  }

  Widget SubmitLoading() {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? appbar : grey1,
          ),
        );
      },
    );
  }
}
