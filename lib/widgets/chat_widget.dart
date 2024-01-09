import 'package:dakachatgpt_v2/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/my_theme_provider.dart';
import '../service/image_cache_manager.dart';

class ChatWidget extends StatelessWidget {
  // const ChatWidget({super.key});
  const ChatWidget({
    Key? key,
    required this.messageData,
    required this.senderId,
  }) : super(key: key);

  final dynamic messageData;
  final dynamic senderId;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<MyThemeProvider>(context).themeType;
    Color color = isDarkTheme ? Colors.white : Colors.black;
    var user = context.read<AuthenticationProvider>().userModel!;
    return Column(
      children: [
        !isDarkTheme
            ? Material(
                color: senderId ==
                        context.read<AuthenticationProvider>().userModel!.uid
                    ? Colors.grey.shade300
                    : Colors.white,
                child: Row(
                  children: [
                    senderId == user.uid
                        ? CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(
                              user.profilePic,
                            ))
                        : Image.asset(
                            AssetsManager.openAILogo,
                            height: 30,
                            width: 30,
                          ),
                    const SizedBox(width: 8),
                    Expanded(child: SelectableText())
                  ],
                ),
              )
            : Material()
      ],
    );
  }
}
