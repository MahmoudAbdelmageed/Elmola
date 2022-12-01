import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/books_model.dart';
import '../../pdf_view_screen.dart';

class BookDetailsScreen extends StatefulWidget {
  final BooksModel booksObject;
  BookDetailsScreen({required this.booksObject});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  ReceivePort _port = ReceivePort();
  late bool _permissionReady;
  String? _localPath;

  bool downloading = false;

  int progress = 0;
  String? taskId;
  bool dialoShow=false;

  @override
  void initState() {
    super.initState();
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
    _permissionReady = false;
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      String? id = data[0];
      int progresss = data[2];
      setState(() {
        taskId = id;
        progress = progresss;
        progress==100? {
        downloading = false,
        progress = 0,
          dialoShow==true? null: showDialogFunc()
      }
        : print("jhdjhdfjhjdfhjdfhjdfhjfhjfghjfhjfg");

      });
    });
  }

  showDialogFunc() async {

    setState((){
      dialoShow=true;
    });
    await showDialog(
      context: context,
      builder: (context) => Dialog(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 16,
          child: Container(
            width: 390,
            height: 252,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x1a000000),
                    offset: Offset(0, 0),
                    blurRadius: 27,
                    spreadRadius: 0)
              ],
              color: Color(0xffffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.check,
                    size: 60,
                    color: Colors.red,
                  ),
                ),
                Text("تم تحميل الملف بنجاح",
                    style: const TextStyle(
                        color: Color(0xff1a201d),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                    textAlign: TextAlign.center),
              ],
            ),
          ),

      ),

    );
  }


  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

//preper function
  Future<Null> _prepare() async {
    _permissionReady = await _checkPermission();
    if (_permissionReady) {
      await _prepareSaveDir();
    }
  }

// get permision
  Future<bool> _checkPermission() async {
    if (Platform.isIOS) return true;
    if (Theme.of(context).platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

// save file in downloader
  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

// get file path in downloader
  Future<String?> _findLocalPath() async {
    var externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await PathProviderAndroid()
            .getDownloadsPath(); //AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AspectRatio(
                        aspectRatio: 0.7,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.booksObject.imagePath!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.chevron_left_rounded,
                                    size: 36,
                                    color: AppTheme.brownColor,
                                  )),
                            )
                          ],
                        )),
                    Positioned(
                        left: 24.0,
                        bottom: -16.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigationClass.navigate(
                                    context,
                                    PDFScreen(
                                      path: widget.booksObject.pdfPath,
                                    ));
                                //    print("$pdfPath${booksObject.pdfPath}");
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(6.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffdc9e4c),
                                ),
                                alignment: Alignment.center,
                                child: const Icon(Icons.remove_red_eye_outlined,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () async {
                                await _prepare();

                                setState(() {
                                  downloading = true;
                                  dialoShow=false;
                                });
                                await FlutterDownloader.enqueue(
                                  url: widget.booksObject.pdfPath!,
                                  savedDir: _localPath!,
                                  showNotification: true,
                                  openFileFromNotification: true,
                                  saveInPublicStorage: true,
                                ).then((v) {



                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(6.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.brownColor,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/file.png",width: 16),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        widget.booksObject.name!,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        widget.booksObject.writerName!,
                        color: AppTheme.greyTxtColor,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/category.svg",
                            color: Color(0xffdc9e4c),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          AppText(
                            widget.booksObject.category!,
                            color: Color(0xffdc9e4c),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),

                    ],
                  ),
                ),
              ],
            ),
            downloading == false
                ? SizedBox()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: .5,
                        child: Container(
                          width: double.infinity,
                          color: Colors.red.withOpacity(.2),
                          height: MediaQuery.of(context).size.height * .755,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * .2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: AppText(
                                  "تحميل الكتاب",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.brownColor,
                                      ),
                                      alignment: Alignment.center,
                                      child:  Image.asset("assets/images/file.png",width:
                                      16),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    width: 300,
                                    height: 16,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: progress / 100,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppTheme.yellowColor),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: AppText(
                                      "${progress} %",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.greyRegularColor,
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        await FlutterDownloader.cancel(
                                                taskId: taskId!)
                                            .then((value) {
                                          Timer(Duration(seconds: 1), () {
                                            setState(() {
                                              downloading = false;
                                              progress = 0;
                                            });
                                          });
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Image.asset("assets/images/cancel.png",width: 22,),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _roundedButton(String icon, Color bgColor, Function onPressed) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset("assets/icons/file.svg", color: Colors.white),
    );
  }
}
