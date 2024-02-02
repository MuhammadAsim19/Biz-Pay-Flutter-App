import 'package:flutter/cupertino.dart';

import 'inboxmodel.dart';

class InboxControllers {
  static ValueNotifier<int> businessChatLoading = ValueNotifier(0);
  static ValueNotifier<List<ChatTileApiModel>> businessChatTile =
      ValueNotifier([]);
  static ValueNotifier<List<ChatTileApiModel>> brokerChatTile =
      ValueNotifier([]);
  static ValueNotifier<List<ChatTileApiModel>> businessSearchChatTile =
      ValueNotifier([]);
  static ValueNotifier<List<ChatTileApiModel>> brokerSearchChatTile =
      ValueNotifier([]);

  static ValueNotifier<ChatTileApiModel> chatDetailData =
      ValueNotifier(ChatTileApiModel());
  static ValueNotifier<bool> connectivityStatus = ValueNotifier(false);
  static ValueNotifier<bool> typingStatus = ValueNotifier(false);
  static ValueNotifier<bool> blockedStatus = ValueNotifier(false);
  static ValueNotifier<String> blockedString = ValueNotifier("");
  static ValueNotifier<String> dateChatTime = ValueNotifier("");
  static ValueNotifier<bool> scrollDownNotifier = ValueNotifier(false);
  static const GlobalObjectKey scrollGroupedKey = GlobalObjectKey("ScrollKey");
}
