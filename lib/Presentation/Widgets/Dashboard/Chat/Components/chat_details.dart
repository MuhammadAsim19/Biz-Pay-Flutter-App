import 'dart:io';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/pop_munu.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxControllers.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'ChatModel/chat_message_model.dart';
import 'ChatModel/chat_tile_model.dart';

import 'message_container.dart';

class ChatDetailsScreen extends StatefulWidget with ChangeNotifier {
  ChatDetailsScreen({super.key, this.modelId, this.chatDto});

  final String? modelId;
  final ChatTileApiModel? chatDto;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController message = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  FocusNode focusNode = FocusNode();

  final List<ChatMessageModel> chats = [
    ChatMessageModel(user: 'receiver', time: '11:20 PM', message: 'Hello'),
    ChatMessageModel(user: 'sender', time: '01:20 PM', message: 'Hi'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:21 PM',
        message: 'I see your business in listing'),
    ChatMessageModel(
        user: 'sender',
        time: '03:30 PM',
        message: 'I wan to sell my business with more profit margin in it.'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:20 PM',
        message: 'I would love to get more info about this'),
    ChatMessageModel(
        user: 'sender',
        time: '04:20 PM',
        message: 'business portfolio.pdf',
        file: 'assets/images/pdf_icon.png'),
    ChatMessageModel(user: 'receiver', time: '04:20 PM', message: 'Thank You'),
  ];
  bool? isLoading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to the end when the widgets are fully painted and visible
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent + 400);
      //_scrollController2.jumpTo(_scrollController.position.maxScrollExtent+100);
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print("keyboard is open");
        // InboxRepo.socket.on(event, (data) => null);
        var data = {
          "status": true,
          "reciever": InboxControllers.chatDetailData.value.receiver
        };
        InboxRepo.socket.emit("isTyping", data);
      } else {
        print("keyBoard is closed");
        var data = {
          "status": false,
          "reciever": InboxControllers.chatDetailData.value.receiver
        };
        InboxRepo.socket.emit("isTyping", data);
      }
    });

    ///replace userIdValue with storyId
    ///
    var dataGet = {
      "userId": "6579ea61d76f7a30f94f5c80",

      ///from shared prefs
      "businessConversationId": widget.chatDto?.id

      ///from chatDto
    };
    InboxRepo.socket.on('user_online_status', (data) {
      print("Online Status");
      String recId = InboxControllers.chatDetailData.value.receiver.toString();

      List<dynamic> allUsers = data;
      if (allUsers.contains(recId)) {
        InboxControllers.connectivityStatus.value = true;
      } else {
        InboxControllers.connectivityStatus.value = false;
      }

      print("${InboxControllers.connectivityStatus.value}valueeeeeeee");
      InboxControllers.connectivityStatus.notifyListeners();
      print(data);
    });

    InboxRepo.socket.emit('getBusinessChatDetails', dataGet);
    InboxRepo.socket.onError((e) {
      print(e);
    });
    InboxRepo.socket.on('error', (data) {
      print(data);
    });

    ///full chat listener first time
    InboxRepo.socket.on('businessChatDetails', (data) {
      print("bizness details");
      print(data);
      InboxControllers.chatDetailData.value = ChatTileApiModel.fromJson(data);
      InboxControllers.chatDetailData.notifyListeners();
    });

    ///new messageto  chat
    InboxRepo.socket.on("newMessageToBusiness", (data) {
      print("new message listener ");
      Message newMessageDto = Message.fromJson(data);
      //InboxControllers.chatDetailData.value.messages?.clear();
      ChatTileApiModel dto = InboxControllers.chatDetailData.value;
      dto.messages?.add(newMessageDto);
      // InboxControllers.chatDetailData.value.messages?.clear();
      // await  Future.delayed(const Duration(milliseconds: 20));
      InboxControllers.chatDetailData.value = dto;

      InboxControllers.chatDetailData.notifyListeners();
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent + 80);

      print(data);
    });
//InboxRepo.socket.emit("user_online_status","Online");

    InboxRepo.socket.on("isTyping", (data) {
      print("status");
      print(Data);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    InboxRepo.socket.off("newMessageToBusiness");
    focusNode.dispose();
    //InboxRepo.socket.clearListeners();
    super.dispose();
  }

  List<PlatformFile>? images = [];
  List<PlatformFile>? docs = [];
  List<PlatformFile>? videos = [];
  List<PlatformFile>? audios;
  List<PlatformFile> allFiles = [];
  List<PlatformFile> actualFiles = [];
  List<String> validImageExt = ["jpg", "jpeg", "png", "webp", "heic"];
  List<String> validVideExt = ["mp4", "avi", "mpeg", "wmv", "mkv"];
  List<String> validDocExt = ["pdf", "docx", "xlsx", "pptx"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              children: [
                16.y,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.sp),
                  child: Row(
                    children: [
                      const BackArrowWidget(),
                      10.x,
                      CachedNetworkImage(
                          height: 50.h,
                          width: 50.w,
                          imageUrl:
                              "${ApiConstant.baseUrl}${widget.chatDto!.profilePic}"),
                      10.x,
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(widget.chatDto!.username ?? "",
                                style: Styles.circularStdBold(context,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500)),
                            AppText(
                              widget.chatDto!.businessReff?.name ?? "",
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.circularStdMedium(
                                context,
                                fontSize: 12.sp,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                            ValueListenableBuilder(
                              builder: (context, cStatus, ss) {
                                return AppText(
                                    cStatus == false ? "Offline" : "Online",
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 12.sp,
                                        color: AppColors.greyTextColor));
                              },
                              valueListenable:
                                  InboxControllers.connectivityStatus,
                            ),
                          ],
                        ),
                      ),
                      //const Spacer(),
                      const PopMenu(),
                    ],
                  ),
                ),
                5.y,
                const Divider(
                  color: AppColors.borderColor,
                  thickness: 2,
                ),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    // controller: _scrollController,

                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Chip(
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 2.sp),
                            backgroundColor: AppColors.borderColor,
                            label: AppText(
                              '16 May, 2023',
                              style: Styles.circularStdMedium(context),
                            )),
                        20.y,
                        ValueListenableBuilder(
                          builder: (context, chatState, ss) {
                            return chatState.messages != null &&
                                    chatState.messages!.isNotEmpty
                                ? SizedBox(
                                    height: 1.sh / 1.6,
                                    child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        controller: _scrollController,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.sp),
                                        //shrinkWrap: true,
                                        // controller: _scrollController2,

                                        itemBuilder: (context, index) {
                                          //  getThumbnailsFromVidz

                                          //getThumbnailFromVideo(chatState.messages![index].videos)

                                          return MessageContainer(
                                            modelData: chats[0],
                                            index: index,
                                            chatDto: chatState.messages![index],
                                            senderId:
                                                "6579ea61d76f7a30f94f5c80",
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 5.sp,
                                          );
                                        },
                                        itemCount: chatState.messages!.length),
                                  )
                                : chatState.messages != null &&
                                        chatState.messages!.isEmpty
                                    ? Center(
                                        child: AppText(
                                        "No New Messages",
                                        style:
                                            Styles.circularStdMedium(context),
                                      ))
                                    : const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                          },
                          valueListenable: InboxControllers.chatDetailData,
                        ),
                        75.y,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: allFiles.isNotEmpty ? 220 : 80.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: allFiles.isNotEmpty
                            ? AppColors.borderColor
                            : Colors.transparent,
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    // color: AppColors.borderColor,
                  ),
                  child: Column(
                    children: [
                      allFiles.isNotEmpty
                          ? SizedBox(
                              height: 120.h,
                              width: 1.sw,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: allFiles.length,
                                itemBuilder: (context, index) {
                                  return DisplayFileImageChat(
                                    fileImage: allFiles[index].path.toString(),
                                    fullFile: allFiles[index],
                                    onDeleteTap: () {
                                      setState(() {
                                        if (validImageExt.contains(
                                            allFiles[index]
                                                .extension
                                                ?.toLowerCase())) {
                                          images?.remove(allFiles[index]);
                                        }
                                        // if(   allFiles?[index].path!.contains("thumbnail")==true)
                                        // {
                                        //   videos?.remove(allFiles![index]);
                                        // }
                                        if (validDocExt.contains(allFiles[index]
                                            .extension
                                            ?.toLowerCase())) {
                                          docs?.remove(allFiles[index]);
                                        }
                                        allFiles.removeAt(index);
                                        // actualFiles.removeAt(index);
                                        //image = [];
                                      });
                                    },
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 5.sp,
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                      CustomTextFieldWithOnTap(
                        filledColor: AppColors.borderColor,
                        focusNode: focusNode,
                        isBorderRequired: allFiles.isNotEmpty ? false : true,
                        prefixIcon: GestureDetector(
                            onTap: () async {
                              showPickerCustomBottomSheet(context, actualFiles);
                            },
                            child:
                                SvgPicture.asset('assets/images/attach.svg')),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (message.text.isNotEmpty) {
                              _sendMessage(message.text);
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10.sp),
                              child:
                                  SvgPicture.asset('assets/images/send.svg')),
                        ),
                        borderRadius: 40.sp,
                        controller: message,
                        hintText: 'Message',
                        textInputType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : const Stack())
          ],
        ),
      ),
    ));
  }

  void showPickerCustomBottomSheet(BuildContext context, actualFiles) {
    showModalBottomSheet(
      backgroundColor: AppColors.primaryColor,
      context: context,
      builder: (context) => Container(
        height: 150.0, // Adjust height as needed
        decoration: BoxDecoration(
          color: AppColors.lightGraphColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image Circle
              InkWell(
                onTap: () async {
                  // Handle image selection

                  final List<PlatformFile>? filesPicked =
                      await PickFile.pickMultipleFiles(validImageExt, true);

                  if (filesPicked != null) {
                    print("in filepickeddd");
                    for (PlatformFile pf in filesPicked) {
                      print(pf.extension);
                      if (validImageExt.contains(pf.extension)) {
                        print("here");
                        images?.add(pf);
                        print(images?.length);
                        actualFiles.add(pf);
                      }
                    }
                    allFiles = actualFiles;
                    setState(() {});
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        child: const Icon(Icons.image, color: Colors.black)),
                    AppText("Images",
                        style: Styles.circularStdRegular(context,
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
              ),

              // Video Circle
              InkWell(
                onTap: () async {
                  // Handle image selection

                  final List<PlatformFile>? filesPicked =
                      await PickFile.pickMultipleFiles(validVideExt, false);
                  // final  List<PlatformFile> actualFiles =[];

                  if (filesPicked != null) {
                    print("in filepickeddd");
                    for (PlatformFile pf in filesPicked) {
                      print(pf.extension);
                      if (validVideExt.contains(pf.extension)) {
                        videos?.add(pf);
                        print("inpicled videoss");
                        print(videos?.length);
                        var path =
                            await getThumbnailFromVideo(pf.path.toString());
                        PlatformFile? pff = PlatformFile(
                            name:
                                "thumbnail ${DateTime.now().microsecondsSinceEpoch}",
                            size: 10 * 1024 * 3,
                            path: path);
                        print("actual  path${pff.path}");
                        actualFiles.add(pff);
                      }
                    }
                    allFiles = actualFiles;
                    setState(() {});
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        child: const Icon(Icons.video_library,
                            color: Colors.black)),
                    AppText("Videos",
                        style: Styles.circularStdRegular(context,
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
              ),

              // Document Circle
              InkWell(
                onTap: () async {
                  // Handle image selection

                  final List<PlatformFile>? filesPicked =
                      await PickFile.pickMultipleFiles(validDocExt, false);
                  // final  List<PlatformFile> actualFiles =[];
                  List<PlatformFile> actualDocsFiles = [];

                  if (filesPicked != null) {
                    print("in filepickeddd");
                    for (PlatformFile pf in filesPicked) {
                      if (validDocExt.contains(pf.extension)) {
                        docs?.add(pf);
                        print("docs selected");
                        print(docs?.length);
                        actualDocsFiles.add(pf);
                      }
                    }
                    allFiles = actualDocsFiles;
                    setState(() {});
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        child: const Icon(Icons.file_copy_outlined,
                            color: Colors.black)),
                    AppText("Documents",
                        style: Styles.circularStdRegular(context,
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendMessage(cc) async {
    List<Map<String, dynamic>> imagesToSend = [];
    List<Map<String, dynamic>> vidToSend = [];
    List<Map<String, dynamic>> docsToSend = [];
    List<PlatformFile> vidThumbs = [];
    for (var i in allFiles) {
      if (i.path!.contains("thumbnail") == true) {
        vidThumbs.add(i);
      }
    }

    ///images
    if (images != null) {
      setState(() {
        isLoading = true;
      });
      await Future.forEach(images as Iterable<PlatformFile?>, (element) async {
        final Uint8List buffer = await compute((PlatformFile? message) {
          return File(message!.path!).readAsBytesSync();
        }, element);

        Map<String, dynamic> addDto = {"name": element?.name, "buffer": buffer};
        imagesToSend.add(addDto);
      });
      // for (var i in images!) {
      //   final Uint8List buffer = await compute((PlatformFile? message)   {
      //
      //     return File(message!.path!).readAsBytesSync();
      //
      //   },i);
      //   Map<String, dynamic> addDto = {
      //     "name": i.name,
      //     "buffer":buffer
      //   };
      //   imagesToSend.add(addDto);
      // }
      //isLoading=false;
      setState(() {
        isLoading = false;
      });
    }

    ///videoos
    if (videos != null && videos!.isNotEmpty && vidThumbs.isNotEmpty) {
      print("here in videoss");
      setState(() {
        isLoading = true;
      });
      await Future.forEach(videos as Iterable<PlatformFile?>, (element) async {
        final Uint8List buffer = await compute((PlatformFile? message) {
          return File(message!.path!).readAsBytesSync();
        }, element);

        Map<String, dynamic> addDto = {"name": element?.name, "buffer": buffer};
        vidToSend.add(addDto);
      });
      // for (var i in images!) {
      //   final Uint8List buffer = await compute((PlatformFile? message)   {
      //
      //     return File(message!.path!).readAsBytesSync();
      //
      //   },i);
      //   Map<String, dynamic> addDto = {
      //     "name": i.name,
      //     "buffer":buffer
      //   };
      //   imagesToSend.add(addDto);
      // }
      //isLoading=false;
      setState(() {
        isLoading = false;
      });
    }

    ///docs
    if (docs != null) {
      setState(() {
        isLoading = true;
      });
      await Future.forEach(docs as Iterable<PlatformFile?>, (element) async {
        final Uint8List buffer = await compute((PlatformFile? message) {
          return File(message!.path!).readAsBytesSync();
        }, element);

        Map<String, dynamic> addDto = {"name": element?.name, "buffer": buffer};
        docsToSend.add(addDto);
      });
      // for (var i in images!) {
      //   final Uint8List buffer = await compute((PlatformFile? message)   {
      //
      //     return File(message!.path!).readAsBytesSync();
      //
      //   },i);
      //   Map<String, dynamic> addDto = {
      //     "name": i.name,
      //     "buffer":buffer
      //   };
      //   imagesToSend.add(addDto);
      // }
      //isLoading=false;
      setState(() {
        isLoading = false;
      });
    }
    print("imagesDto length+${imagesToSend.length}");
    print("imagesDto length+${vidToSend.length}");
    print("imagesDto length+${docsToSend.length}");

    var messageToSend = {
      "sender": "6579ea61d76f7a30f94f5c80",
      "receiver": InboxControllers.chatDetailData.value.receiver.toString(),
      //"receiver" : "6579f21c00996aa38f7c7a2b",
      "businessConversationId": widget.chatDto?.id,
      "content": message.text,
      "images": images != null ? imagesToSend : [],
      "videos": videos != null ? vidToSend : [],
      "docs": docs != null ? docsToSend : []
    };
    if (allFiles.isEmpty) {
      print("in here");
      InboxControllers.chatDetailData.value.messages?.add(Message(
          id: widget.chatDto?.id,
          sender: "6579ea61d76f7a30f94f5c80",
          receiver: widget.chatDto?.receiver.toString(),
          images: [],
          videos: [],
          docs: [],
          content: message.text,
          createdAt: DateTime.now()));
      InboxControllers.chatDetailData.notifyListeners();
    }
    print("here");
    // const images = [
    //   {
    //     name: filename,
    //     buffer: file
    //   }
    // ]

    InboxRepo.socket.emit('sendMessageToBusiness', messageToSend);

    message.clear();
    if (images != null ||
        videos != null ||
        docs != null ||
        allFiles.isNotEmpty) {
      images?.clear();
      videos?.clear();
      docs?.clear();
      allFiles.clear();
      actualFiles.clear();

      setState(() {});
    }
  }

  Future<String> getThumbnailFromVideo(String url) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 100,
      maxHeight: 130,
    );
    print("here$fileName");

    final file = File(fileName!);
    print("hereeee${file.path}");
    print("hereeee$file"); // Your file path
    String dir = path.dirname(file.path); // Get directory
    String newPath = path.join(dir,
        'thumbnail_${DateTime.now().millisecondsSinceEpoch}.jpg'); // Rename
    file.renameSync(newPath);

    return newPath;
  }
}
