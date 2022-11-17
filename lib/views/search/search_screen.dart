import 'package:el_mola/controllers/data_lists.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:el_mola/widgets/app_buttons/app_elevated_button.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/books_list.dart';
import '../../models/books_model.dart';
import '../../widgets/modal_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<BooksModel> searchList = [];
  List<String> filterList = [];

  TextEditingController con = TextEditingController();

  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "البحث",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.greyTxtColor,
                          blurRadius: 2.0,
                          spreadRadius: -1.0,
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: con,
                      enabled: true,
                      onChanged: (String value) {
                        searchList.clear();
                        for (var book in bookList) {
                          if (value.isEmpty || value == "") {
                            setState(() {
                              searchList.clear();
                            });
                          } else {
                            if (book.name!.contains(value)) {
                              setState(() {
                                searchList.add(book);
                              });
                            }
                          }
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 16),
                        // isDense: true,
                        // counter: Offstage(),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                filterList.clear();
                                searchList.clear();
                                con.clear();
                              });

                              FocusScope.of(context).unfocus();
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return ModelBottomSheet(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: StatefulBuilder(
                                        builder:
                                            (context, StateSetter stateSetter) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                  child: AppText(
                                                "تصفية النتائج",
                                                fontSize: 24,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              const AppText("التصنيف",
                                                  fontSize: 18,
                                                  color: Colors.black),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Expanded(
                                                child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: category.length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          mainAxisSpacing: 16,
                                                          crossAxisSpacing: 16,
                                                          childAspectRatio:
                                                              1.7),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                        stateSetter(() {
                                                          filterList.add(
                                                              category[index]);
                                                          for (var book
                                                              in bookList) {
                                                            for (var cat
                                                                in filterList) {
                                                              if (book.category ==
                                                                  cat) {
                                                               if(searchList.contains(book)){
                                                                 debugPrint("cant add");
                                                               }else{
                                                                 searchList
                                                                     .add(book);
                                                               }
                                                              }
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:const EdgeInsets
                                                            .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 8.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: filterList
                                                                  .contains(
                                                                      category[
                                                                          index])
                                                              ? AppTheme
                                                                  .primaryColor
                                                              :const Color(
                                                                  0xfff3f3f3),
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          16.0)),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: AppText(
                                                            category[index],
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            centerText: true,
                                                            maxLines: 2,
                                                            color: filterList
                                                                    .contains(
                                                                        category[
                                                                            index])
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children:  [
                                               const   AppText("عرض",
                                                      fontSize: 18,
                                                      color: AppTheme
                                                          .greyRegularColor),
                                               const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  AppText("${searchList.length.toString()}",
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                 const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                 const AppText("كتاب",
                                                      fontSize: 18,
                                                      color: AppTheme
                                                          .greyRegularColor),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: AppElevatedButton(
                                                  text: "عرض النتائج",
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  textColor: Colors.white,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  stateSetter(
                                                      () => filterList.clear());
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 16.0),
                                                  child: Center(
                                                      child: AppText(
                                                          "مسح التصفية",
                                                          fontSize: 18,
                                                          color: AppTheme
                                                              .greyRegularColor)),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    sheetHeight: Get.height * 0.75,
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/icons/filter.png",
                              width: 20,
                              height: 20,
                              color: AppTheme.lightGreyColor,
                            )),
                        prefixIcon: Image.asset(
                          "assets/icons/search.png",
                          width: 20,
                          height: 20,
                          color: AppTheme.lightGreyColor,
                        ),
                        // prefixIcon: SvgPicture.asset("assets/icons/search.svg", color: AppTheme.lightGreyColor, width: 18,height: 18,),
                        hintText: 'ابحث هنا...', fillColor: Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: searchList.isEmpty
                ? const SizedBox()
                : AppText(
                    "نتيجة بحث (${searchList.length} كتب)",
                    color: AppTheme.greyTxtColor,
                    fontSize: 16,
                  ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                scrollDirection: Axis.vertical,
                itemCount: searchList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.5),
                itemBuilder: (BuildContext context, int index) {
                  return BookItemWidget(
                    booksObject: searchList[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFilterBottomSheet() {
  //   return Directionality(
  //     textDirection: TextDirection.rtl,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Center(
  //             child: AppText(
  //               "تصفية النتائج",
  //               fontSize: 24,
  //               color: Colors.black,
  //               fontWeight: FontWeight.bold,
  //             )),
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         const AppText("التصنيف", fontSize: 18, color: Colors.black),
  //         const SizedBox(
  //           height: 6,
  //         ),
  //         Expanded(
  //           child: GridView.builder(
  //             scrollDirection: Axis.vertical,
  //             itemCount: category.length,
  //             physics: const BouncingScrollPhysics(),
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 2,
  //                 mainAxisSpacing: 16,
  //                 crossAxisSpacing: 16,
  //                 childAspectRatio: 1.7),
  //             itemBuilder: (BuildContext context, int index) {
  //
  //               return InkWell(
  //                 onTap: (){
  //                   print(category[index]);
  //                   print(filterList);
  //                   setState((){
  //                     filterList.add(category[index]);
  //
  //                   });
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
  //                   decoration: BoxDecoration(
  //                     color: filterList.contains(category[index])
  //                         ? AppTheme.primaryColor
  //                         : const Color(0xfff3f3f3),
  //                     borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  //                     shape: BoxShape.rectangle,
  //                   ),
  //                   alignment: Alignment.center,
  //                   child: AppText(category[index], fontSize: 18, fontWeight: FontWeight.bold,
  //                       centerText: true,
  //                       maxLines: 2, color: filterList.contains(category[index])
  //                           ? Colors.white
  //                           : Colors.black),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: const [
  //             AppText("عرض", fontSize: 18, color: AppTheme.greyRegularColor),
  //             SizedBox(
  //               width: 4.0,
  //             ),
  //             AppText("50", fontSize: 20, color: Colors.black),
  //             SizedBox(
  //               width: 4.0,
  //             ),
  //             AppText("كتاب", fontSize: 18, color: AppTheme.greyRegularColor),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         SizedBox(
  //           width: double.infinity,
  //           child: AppElevatedButton(
  //
  //             text: "عرض النتائج",
  //             onPressed: () {},
  //             textColor: Colors.white,
  //           ),
  //         ),
  //
  //         InkWell(
  //           onTap: (){
  //             setState((){
  //               filterList.clear();
  //             });
  //           },
  //           child: const Padding(
  //             padding: EdgeInsets.only(top: 16.0),
  //             child: Center(
  //                 child: AppText("مسح التصفية",
  //                     fontSize: 18, color: AppTheme.greyRegularColor)),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// _buildBottomSheet(BuildContext context) {
//   return Stack(
//     children: [
//       Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
//         ),
//         child: Column(
//           children: [
//             const Center(
//                 child: AppText(
//                   "تصفية النتائج",
//                   color: Colors.black,
//                   fontSize: 16,
//                   maxLines: 1,
//                 )),
//             const SizedBox(
//               height: 16,
//             ),
//             const AppText(
//               "التنصيف",
//               color: AppTheme.primaryColor,
//               fontSize: 16,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: const [
//                 AppText("عرض", color: AppTheme.lightGreyColor),
//                 SizedBox(
//                   width: 4.0,
//                 ),
//                 AppText("50", color: Colors.black),
//                 SizedBox(
//                   width: 4.0,
//                 ),
//                 AppText("كتاب", color: AppTheme.lightGreyColor),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             SizedBox(
//                 width: Get.width,
//                 child: AppElevatedButton(
//                   text: "عرض النتائج",
//                   onPressed: () {},
//                 )),
//             const SizedBox(
//               height: 16,
//             ),
//             InkWell(
//                 onTap: () {},
//                 child: const Center(
//                     child: AppText(
//                       "مسح التصفية",
//                       color: AppTheme.lightGreyColor,
//                       fontSize: 16,
//                       maxLines: 1,
//                     ))),
//             const SizedBox(
//               height: 28,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
