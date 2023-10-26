import 'package:get/get.dart';
import 'package:welcome_screen/binding/chat_binding.dart';
import 'package:welcome_screen/binding/contact_us_binding.dart';
import 'package:welcome_screen/binding/courses_binding.dart';
import 'package:welcome_screen/binding/exam_binding.dart';
import 'package:welcome_screen/binding/exam_status_binding.dart';
import 'package:welcome_screen/binding/forget_binding.dart';
import 'package:welcome_screen/binding/game_binding.dart';
import 'package:welcome_screen/binding/home_binding.dart';
import 'package:welcome_screen/binding/language_change.dart';
import 'package:welcome_screen/binding/list_cross_game.dart';
import 'package:welcome_screen/binding/list_cross_game_level_binding.dart';
import 'package:welcome_screen/binding/login_binding.dart';
import 'package:welcome_screen/binding/material_binding.dart';
import 'package:welcome_screen/binding/material_detail_binding.dart';
import 'package:welcome_screen/binding/payment_history_binding.dart';
import 'package:welcome_screen/binding/privacy_binding.dart';
import 'package:welcome_screen/binding/progress_details_binding.dart';
import 'package:welcome_screen/binding/progress_screen_binding.dart';
import 'package:welcome_screen/binding/register_binding.dart';
import 'package:welcome_screen/binding/setting_binding.dart';
import 'package:welcome_screen/binding/start_binding.dart';
import 'package:welcome_screen/routes/path.dart';
import 'package:welcome_screen/view/screens/chats.dart';
import 'package:welcome_screen/view/screens/cotact_us.dart';
import 'package:welcome_screen/view/screens/courses_screen.dart';
import 'package:welcome_screen/view/screens/detais_screen.dart';
import 'package:welcome_screen/view/screens/exam_screen.dart';
import 'package:welcome_screen/view/screens/forget_password.dart';
import 'package:welcome_screen/view/screens/game_screen.dart';
import 'package:welcome_screen/view/screens/home.dart';
import 'package:welcome_screen/view/screens/language_change.dart';
import 'package:welcome_screen/view/screens/list_cross_game_level_screen.dart';
import 'package:welcome_screen/view/screens/login_screen.dart';
import 'package:welcome_screen/view/screens/material_dtail_screen.dart';
import 'package:welcome_screen/view/screens/materials.dart';
import 'package:welcome_screen/view/screens/network_error.dart';
import 'package:welcome_screen/view/screens/otp_screen.dart';
import 'package:welcome_screen/view/screens/password_change_screen.dart';
import 'package:welcome_screen/view/screens/payment_history_screen.dart';
import 'package:welcome_screen/view/screens/prepare_video.dart';
import 'package:welcome_screen/view/screens/privacy_screen.dart';
import 'package:welcome_screen/view/screens/profile_course.dart';
import 'package:welcome_screen/view/screens/progress_details_screen.dart';
import 'package:welcome_screen/view/screens/progress_screen.dart';
import 'package:welcome_screen/view/screens/register_screen.dart';
import 'package:welcome_screen/view/screens/setting_screen.dart';
import 'package:welcome_screen/view/screens/splash_screen.dart';

import '../binding/detail_binding.dart';
import '../binding/otp_binding.dart';
import '../binding/password_change_binding.dart';
import '../binding/profile_courseBinding.dart';
import '../view/screens/list_cross_game.dart';

class AppPages{
  List<GetPage<dynamic>> pages=[
    GetPage(name: AppPath.home, page: ()=>const Home(),bindings: [MaterialBinding(),CoursesBinding(),ProgressScreenBinding(),HomeBinding(),]),
    GetPage(name: AppPath.splash, page: ()=>const Splash_screen()),
    GetPage(name: AppPath.login, page: ()=>const LoginScreen(),binding: LoginBinding()),
    GetPage(name: AppPath.forget, page: ()=>const ForgetPassword(),binding: ForgetBinding()),
    GetPage(name: AppPath.otp, page: ()=> OtpScreen(),bindings: [OtpBinding(),ForgetBinding(),RegisterBinding()]),
    GetPage(name: AppPath.courses, page: ()=>  Courses(),),
    GetPage(name: AppPath.prepareScreen, page: ()=> const PrepareScreen(),binding: StartVideoBinding()),
    GetPage(name: AppPath.detailsScreen, page: ()=> const DetailsScreen(),binding: DetailsBinding()),
    GetPage(name: AppPath.examScreen, page: ()=>  ExamScreen(),bindings:[ExamBinding(),ExamStatusBinding()]),
    //GetPage(name: AppPath.examStatus, page: ()=> ExamStatus()),
    //using at code as Get.to
    GetPage(name: AppPath.profileCourse, page: ()=>  ProfileCourse(),binding: ProfileCourseBinding()),
    GetPage(name: AppPath.settingScreen, page: ()=>  SettingScreen(),binding: Settingbinding()),
    GetPage(name: AppPath.passwordChange, page: ()=> const PasswordChange(),binding: PassowrdChangeBinding()),
    GetPage(name: AppPath.privacyScreen, page: ()=> const PrivacyScreen(),binding: PrivacyBinding()),
    GetPage(name: AppPath.contactUs, page: ()=>  ContactUs(),binding: ContacUsBinding()),
    GetPage(name: AppPath.paymentHistory, page: ()=> const PaymentHistory(),binding: PaymentHistoryBinding()),
    GetPage(name: AppPath.progressDetailsScreen, page: ()=> const ProgressDetailsScreen(),binding: ProgressBindingDetails()),
    GetPage(name: AppPath.progressScreen, page: ()=> const ProgressScreen()),
    GetPage(name: AppPath.materialScreen, page: ()=> const MaterialScreen()),
    GetPage(name: AppPath.materialDetailScreen, page: ()=>  MaterialDetailScreen(),binding: MaterialDetailBinding()),
    GetPage(name: AppPath.networkError, page: ()=> const NetworkError()),
    GetPage(name: AppPath.registerScreen, page: ()=> const RegisterScreen(),binding: RegisterBinding()),
    GetPage(name: AppPath.chatScreen, page: ()=> const Chats(),binding: ChatBinding()),
    GetPage(name: AppPath.languageChange, page: ()=> const LanguageChange(),binding: LanguageChangeBinding()),
    GetPage(name: AppPath.gameScreen, page: ()=> const GameScreen(),binding: GameBinding()),
    GetPage(name: AppPath.listCrossGame, page: ()=> const ListCrossGameScreen(),binding: ListCrossGame()),
    GetPage(name: AppPath.listCrossGameLevel, page: ()=> const ListCrossGameLevelScreen(),binding: ListCrossGameLevelBinding()),
























  ];
}