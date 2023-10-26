import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:welcome_screen/constant/app_color.dart';
import 'package:welcome_screen/controller/details_contriller.dart';

class StartVideoController extends GetxController{
  DetailsController detailsController=Get.find();
  String videoUrl="";
  String title="";
  String description ="";
  String fileUrl="";
  late BetterPlayerController betterPlayerController;
  BetterPlayerTheme playerTheme = BetterPlayerTheme.material;
assignVariable(){
  videoUrl=detailsController.list[detailsController.indexClicked].uriVideo;
  title=detailsController.list[detailsController.indexClicked].title;
  description=detailsController.list[detailsController.indexClicked].description;
  fileUrl=detailsController.list[detailsController.indexClicked].uriPDF;



}
  @override
  void onInit() {
    super.onInit();
    assignVariable();
    // TODO: implement onInit
  BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
    videoUrl,


    // cacheConfiguration: BetterPlayerCacheConfiguration(
    //   useCache: true,
    //   preCacheSize: 10 * 1024 * 1024,
    //   maxCacheSize: 10 * 1024 * 1024,
    //   maxCacheFileSize: 10 * 1024 * 1024,
    //
    //   ///Android only option to use cached video between app sessions
    //   key: "testCacheKey6",
    //
    //
    // ),
      );
  betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        controlsConfiguration: BetterPlayerControlsConfiguration(
          playerTheme: playerTheme,

        ),

      ),
      betterPlayerDataSource: betterPlayerDataSource);


  //betterPlayerController.preCache(betterPlayerDataSource);
  //betterPlayerController.clearCache();
  }
}