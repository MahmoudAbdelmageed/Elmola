import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/appTheme.dart';
import '../../widgets/app_text.dart';
import '../setting/setting.dart';
import 'chat_details_screen.dart';


class ChatScreen extends StatefulWidget {
  late var  scaffold;
  ChatScreen(this.scaffold);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Mohamed ali", messageText: "Hi", imageURL: "https://i.pravatar.cc/250?u=mail@ashallendesign.co.uk", time: "yesterday"),
  ];





  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .18,
          child: Container(
              height: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/appbar.png"),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                      widget.scaffold.currentState!.openDrawer();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/menu.svg",
                        color: Colors.white,
                        width: 22,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                    ),
                    AppText(
                      'الشات',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * .25,
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SettingScreen();
                        }));

                      },
                      child: Icon(Icons.settings,   color: Colors.white,
                      size: 28,)
                    ),


                  ],
                ),
              )),
        ),
        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ConversationList(
                        name: chatUsers[index].name,
                        messageText: chatUsers[index].messageText,
                        imageUrl: chatUsers[index].imageURL,
                        time: chatUsers[index].time,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                      );
                    },
                  ),

                ],
              ),
            ))
      ],
    );
  }
}


class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList({required this.name,required this.messageText,required this.imageUrl,required this.time,required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailsScreen();
        }));

      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({required this.name,required this.messageText,required this.imageURL,required this.time});
}



