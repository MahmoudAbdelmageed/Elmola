
import '../models/books_model.dart';
import 'data_lists.dart';

List<BooksModel> newList =[
  BooksModel(
      name: "مجالس الحداد",
      pdfPath: "مجالس الحداد" + ".pdf",
      imagePath: "مجالس الحداد" + ".png",
      writerName: "السيد عبد الله بن علوي الحداد الحضرمي",

      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "وسيلة الرضوان لختم القرآن",
      pdfPath: "وسيلة الرضوان لختم القرآن" + ".pdf",
      imagePath: "وسيلة الرضوان لختم القرآن" + ".png",
      writerName: "أبي بكر بن الشيخ محمد بن الشيخ عمر الملا",

      category: category[3],
      latest: false,
      mostViewed: false),
];