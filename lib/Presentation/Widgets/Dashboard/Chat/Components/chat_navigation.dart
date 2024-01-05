import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatNavigation{

 static getToChatDetails(BuildContext context,String createdFor,String businessId)
  async {
     print(InboxRepo.socket !=  null);
    // if(InboxRepo.socket.connected==false) {
    //
    // }
    if(InboxRepo.socket==null && InboxRepo.socket?.connected==false)
    {
      print("in  hereee");
      InboxRepo().initSocket(context, Data().user?.user?.id);
    }
    print("user id${Data().user!.user!.id}");
    var data={
    "createdBy" : Data().user?.user?.id,  //"6579ea61d76f7a30f94f5c80"
    "createdFor" : createdFor,  //"6579f21c00996aa38f7c7a2b"
    "businessReff" :businessId      //"6579ed17d76f7a30f94f5c9c"
  };
    print("alldata");
    print(data);

    await InboxRepo().createBuissness(body: data).then((value) {
      print("valueeeeeeeeeeeeee");
      print(value);
      if(value['Success']) {
        ChatTileApiModel chatTileApiModel=ChatTileApiModel.fromJson(value['body']);
        Navigate.to(context, ChatDetailsScreen(chatDto: chatTileApiModel,));
      }
     // Navigate.to(context, ChatDetailsScreen(chatDto: chatTileApiModel,));
    });
// InboxRepo.socket.onConnect((s){
// print("here in on connect");
//
//
// });
//     InboxRepo.socket.emit("createBusinessConversation",data);
//
//     InboxRepo.socket.on("newBusinessConversation",(data)
//     {
// print("data socket");
// print(data);
// ChatTileApiModel chatTileApiModel=ChatTileApiModel.fromJson(data);
// Navigate.to(context, ChatDetailsScreen(chatDto: chatTileApiModel,));
//
//     });
//     InboxRepo.socket.on("chatAlreadyExists",(data)
//     {
//       print("data socket");
//       print(data);
//       ChatTileApiModel chatTileApiModel=ChatTileApiModel.fromJson(data);
//       Navigate.to(context, ChatDetailsScreen(chatDto: chatTileApiModel,));
//
//     });
    
    
    

  }

}