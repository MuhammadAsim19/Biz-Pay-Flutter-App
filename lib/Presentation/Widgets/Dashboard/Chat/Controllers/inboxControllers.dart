import 'package:flutter/cupertino.dart';

import 'inboxmodel.dart';

class InboxControllers{

  static ValueNotifier<List<ChatTileApiModel>> tileInboxData= ValueNotifier([]);
  static ValueNotifier<ChatTileApiModel> chatDetailData=ValueNotifier(ChatTileApiModel());
  static ValueNotifier<bool> connectivityStatus=ValueNotifier(false);
  static ValueNotifier<bool> typingStatus=ValueNotifier(false);
  static ValueNotifier<bool> blockedStatus=ValueNotifier(false);
  static ValueNotifier<String> blockedString=ValueNotifier("");
  static ValueNotifier<String> dateChatTime=ValueNotifier("");
  static ValueNotifier<bool> scrollDownNotifier=ValueNotifier(false);
  static const GlobalObjectKey scrollGroupedKey = GlobalObjectKey("ScrollKey");

}