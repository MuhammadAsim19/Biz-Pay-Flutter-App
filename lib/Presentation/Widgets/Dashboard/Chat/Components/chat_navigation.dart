import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';

class ChatNavigation{

 static getToChatDetails(BuildContext context,String createdFor,String businessId)
  {
    InboxRepo().initSocket(context, Data().user?.user?.id);
    print("user id${Data().user!.user!.id}");
    var data={
    "createdBy" : Data().user?.user?.id,  //"6579ea61d76f7a30f94f5c80"
    "createdFor" : createdFor,  //"6579f21c00996aa38f7c7a2b"
    "businessReff" :businessId      //"6579ed17d76f7a30f94f5c9c"
  };
    print("alldata");
    print(data);

    InboxRepo.socket.emit("createBusinessConversation",data);
    InboxRepo.socket.on("newBusinessConversation",(data)
    {
print("data socket");
print(data);

    });
    
    
    

  }

}