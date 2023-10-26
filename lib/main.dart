import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_screen/routes/pages.dart';
import 'package:welcome_screen/routes/path.dart';
bool language=false;
String accessUserToken="";
String phoneNumber="";
main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  language=sharedPreferences.getBool("language")??false;
  phoneNumber=sharedPreferences.getString("phoneNumber")??"";
  accessUserToken=sharedPreferences.getString("accessToken")??"";
  print(accessUserToken);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages().pages,
      initialRoute: accessUserToken==""?AppPath.login:AppPath.home,
      //initialRoute:AppPath.home,
    );
  }
}