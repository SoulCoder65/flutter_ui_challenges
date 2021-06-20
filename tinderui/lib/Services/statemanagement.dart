import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Modals/usermodal.dart';
import '../Services/fetchdata.dart';

class ManageState with ChangeNotifier {
  List<Results> profile = [];
  List<Map<String, dynamic>> allprofiles = [];
  bool isError = false;
  bool setError=false;

  get userProfiles => allprofiles;
  get errorStatus=>setError;
  void showUpdate() {
    notifyListeners();
  }

  void getUsers() async {
    try {
      getUserData().then((dt) => {
            if (dt == "network")
              {
                setError=true,
                showUpdate(),
              }
            else if (dt != null)
              {
                setError=false,

                profile = UserProfiles.fromJson(dt).results,
                allprofiles.add(profile[0].toJson()),
                showUpdate()
              }
            else
              {
                print("eror"),
                // allprofiles.clear(),
                showUpdate()
              }
          });
    } catch (e) {
      print("error ${e}");
    }
  }

  void clearList() {
    allprofiles.clear();
    showUpdate();
  }
}
