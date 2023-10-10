import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailsScreen extends StatefulWidget {
  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  List<String> message = ["Hi", "Hi", "How Are You?"];
  TextEditingController messgae = TextEditingController();

  bool readOnlyvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText("Mohamed ali", color: Colors.white, fontSize: 20),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                readOnlyvalue = !readOnlyvalue;
              });
              print(readOnlyvalue); // your logic
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("Block"),
                  value: '/Block',
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            message.isEmpty
                ? Center(
                    child: Text("no Data"),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 6),
                                child: Align(
                                  alignment: i.isOdd
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 6),
                                    constraints: BoxConstraints(
                                        minWidth: MediaQuery.of(context)
                                                .size
                                                .width -
                                            MediaQuery.of(context).size.width *
                                                .4),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      color: const Color(0xffeeeef0),
                                    ),
                                    child: Wrap(
                                      children: [
                                        Text(message[i],
                                            style: TextStyle(
                                                color: i.isEven
                                                    ? Colors.black
                                                    : Colors.blue,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: i.isEven
                                                ? TextAlign.left
                                                : TextAlign.right),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: message.length),
                  ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(0, -15),
                        blurRadius: 163,
                        spreadRadius: 0)
                  ],
                  color: Color(0xffffffff)),
              child: TextField(
                controller: messgae,
                readOnly: readOnlyvalue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'writeHere',
                    prefixIcon: RotatedBox(
                      quarterTurns: 90,
                      child: InkWell(
                          onTap: () {
                            if (messgae.text.isNotEmpty) {
                              setState(() {
                                message.add(messgae.text);
                              });
                              messgae.clear();
                            }
                          },
                          child: Icon(Icons.send)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
