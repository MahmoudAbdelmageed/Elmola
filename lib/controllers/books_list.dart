import '../models/books_model.dart';
import 'data_lists.dart';

List<BooksModel> bookList = [
  BooksModel(
      name: "إتحاف الطالب",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%95%d8%aa%d8%ad%d8%a7%d9%81%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%95%d8%aa%d8%ad%d8%a7%d9%81%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.jpg",
      writerName: "الشيخ أبو بكر بن الشيخ محمد الملا (١١٩٨-١٢٧٠هـ)",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "أحكام المناسك",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%94%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%94%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83.jpg",
      writerName: "العلامة الشيخ أبوبكر الملا الإحسائي",
      category: category[0],

      latest: false,
      mostViewed: false),
  BooksModel(
      name: "الرد الفصيح على منكر العمل بما في الحديث الصريح",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d8%b1%d8%af%20%d8%a7%d9%84%d9%81%d8%b5%d9%8a%d8%ad%20%d8%b9%d9%84%d9%89%20%d9%85%d9%86%d9%83%d8%b1%20%d8%a7%d9%84%d8%b9%d9%85%d9%84%20%d8%a8%d9%85%d8%a7%20%d9%81%d9%8a%20%d8%a7%d9%84%d8%ad%d8%af%d9%8a%d8%ab%20%d8%a7%d9%84%d8%b5%d8%b1%d9%8a%d8%ad.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d8%b1%d8%af%20%d8%a7%d9%84%d9%81%d8%b5%d9%8a%d8%ad%20%d8%b9%d9%84%d9%89%20%d9%85%d9%86%d9%83%d8%b1%20%d8%a7%d9%84%d8%b9%d9%85%d9%84%20%d8%a8%d9%85%d8%a7%20%d9%81%d9%8a%20%d8%a7%d9%84%d8%ad%d8%af%d9%8a%d8%ab%20%d8%a7%d9%84%d8%b5%d8%b1%d9%8a%d8%ad.jpg",
      writerName: "العلامة الشيخ أبو بكر بن الشيخ محمد الملا (١١٩٨-١٢٧٠هـ)",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "القول الصائب في اداب الطالب",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d9%82%d9%88%d9%84%20%d8%a7%d9%84%d8%b5%d8%a7%d9%8a%d9%94%d8%a8%20%d9%81%d9%8a%20%d8%a7%d8%af%d8%a7%d8%a8%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d9%82%d9%88%d9%84%20%d8%a7%d9%84%d8%b5%d8%a7%d9%8a%d9%94%d8%a8%20%d9%81%d9%8a%20%d8%a7%d8%af%d8%a7%d8%a8%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.jpg",
      writerName: "حمد أحمد الملا",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "اللفظ المعقول في بيان تعريف الاصول",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d9%84%d9%81%d8%b8%20%d8%a7%d9%84%d9%85%d8%b9%d9%82%d9%88%d9%84%20%d9%81%d9%8a%20%d8%a8%d9%8a%d8%a7%d9%86%20%d8%aa%d8%b9%d8%b1%d9%8a%d9%81%20%d8%a7%d9%84%d8%a7%d8%b5%d9%88%d9%84.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d9%84%d9%81%d8%b8%20%d8%a7%d9%84%d9%85%d8%b9%d9%82%d9%88%d9%84%20%d9%81%d9%8a%20%d8%a8%d9%8a%d8%a7%d9%86%20%d8%aa%d8%b9%d8%b1%d9%8a%d9%81%20%d8%a7%d9%84%d8%a7%d8%b5%d9%88%d9%84.jpg",
      writerName: "الشيخ محمد بن أبي بكر الملا الحنفي الأحسائي المتوفى ١٣٩٥ هـ",
      category: category[9],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "المختصر في القواعد الفقهية",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d9%85%d8%ae%d8%aa%d8%b5%20%d9%81%d9%8a%20%d8%a7%d9%84%d9%82%d9%88%d8%a7%d8%b9%d8%af%20%d8%a7%d9%84%d9%81%d9%82%d9%87%d9%8a%d8%a9.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d9%85%d8%ae%d8%aa%d8%b5%20%d9%81%d9%8a%20%d8%a7%d9%84%d9%82%d9%88%d8%a7%d8%b9%d8%af%20%d8%a7%d9%84%d9%81%d9%82%d9%87%d9%8a%d8%a9.jpg",
      writerName: "د. رائد بن عبد الله بن محمد الملا الحنفي الأحسائي",
      category: category[9],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "النصيحة العامة للخاصة من الناس والعامة-1",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d9%86%d8%b5%d9%8a%d8%ad%d8%a9%20%d8%a7%d9%84%d8%b9%d8%a7%d9%85%d8%a9%20%d9%84%d9%84%d8%ae%d8%a7%d8%b5%d8%a9%20%d9%85%d9%86%20%d8%a7%d9%84%d9%86%d8%a7%d8%b3%20%d9%88%d8%a7%d9%84%d8%b9%d8%a7%d9%85%d8%a9-1.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d9%86%d8%b5%d9%8a%d8%ad%d8%a9%20%d8%a7%d9%84%d8%b9%d8%a7%d9%85%d8%a9%20%d9%84%d9%84%d8%ae%d8%a7%d8%b5%d8%a9%20%d9%85%d9%86%20%d8%a7%d9%84%d9%86%d8%a7%d8%b3%20%d9%88%d8%a7%d9%84%d8%b9%d8%a7%d9%85%d8%a9-1.jpg",
      writerName: "الشيخ عبد الله بن الشيخ أبي بكر الملا ال الواعظ المتوفى ١٣٠٩ هـ",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "الوصايا الجامعة",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%a7%d9%84%d9%88%d8%b5%d8%a7%d9%8a%d8%a7%20%d8%a7%d9%84%d8%ac%d8%a7%d9%85%d8%b9%d8%a9.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%a7%d9%84%d9%88%d8%b5%d8%a7%d9%8a%d8%a7%20%d8%a7%d9%84%d8%ac%d8%a7%d9%85%d8%b9%d8%a9.jpg",
      writerName: "العلامة الشيخ أحمد بن عبد الرحمن بن محمد بن عبد اللطيف الأحسائي",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "تحفة الأخيار بمختصر الأذكار",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d8%a7%d9%94%d8%ae%d9%8a%d8%a7%d8%b1%20%d8%a8%d9%85%d8%ae%d8%aa%d8%b5%d8%b1%20%d8%a7%d9%84%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d8%a7%d9%94%d8%ae%d9%8a%d8%a7%d8%b1%20%d8%a8%d9%85%d8%ae%d8%aa%d8%b5%d8%b1%20%d8%a7%d9%84%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1.jpg",
      writerName: "العلامة الشيخ أبو بكر بن الشيخ محمد الملا (١١٩٨-١٢٧٠هـ)",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "تحفة المبتدي في الوضوء والصلاة",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%20%d9%81%d9%8a%20%d8%a7%d9%84%d9%88%d8%b6%d9%88%d8%a1%20%d9%88%d8%a7%d9%84%d8%b5%d9%84%d8%a7%d8%a9.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%20%d9%81%d9%8a%20%d8%a7%d9%84%d9%88%d8%b6%d9%88%d8%a1%20%d9%88%d8%a7%d9%84%d8%b5%d9%84%d8%a7%d8%a9.jpg",
      writerName: "العلامة برهان الدين إبراهيم بن حسن الملا الأحسائي المتوفى سنة ١٠٤٨ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "تحفة المبتدي",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a1.jpg",
      writerName: "العلامة برهان الدين إبراهيم بن حسن الملا المتوفى ١٠٤٨ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),

  BooksModel(
      name: "جامع تفسير الاحلام 1",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%ac%d8%a7%d9%85%d8%b9%20%d8%aa%d9%81%d8%b3%d9%8a%d8%b1%20%d8%a7%d9%84%d8%a7%d8%ad%d9%84%d8%a7%d9%85%201.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%ac%d8%a7%d9%85%d8%b9%20%d8%aa%d9%81%d8%b3%d9%8a%d8%b1%20%d8%a7%d9%84%d8%a7%d8%ad%d9%84%d8%a7%d9%85%201.jpg",
      writerName: "العلامة الشيخ أبي بكر بن الشيخ محمد بن عمر الملا الأحسائي (١١٩٨-١٢٠٧هـ)",
      category: category[1],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "حادي الأنام إلى دار السلام",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%ad%d8%a7%d8%af%d9%8a%20%d8%a7%d9%84%d8%a7%d9%94%d9%86%d8%a7%d9%85%20%d8%a7%d9%95%d9%84%d9%89%20%d8%af%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b3%d9%84%d8%a7%d9%85.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%ad%d8%a7%d8%af%d9%8a%20%d8%a7%d9%84%d8%a7%d9%94%d9%86%d8%a7%d9%85%20%d8%a7%d9%95%d9%84%d9%89%20%d8%af%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b3%d9%84%d8%a7%d9%85.jpg",
      writerName: "العلامة الشيخ أبو بكر بن الشيخ محمد بن عمر الملا الأحسائي المتوفى ١٠٤٨ هـ",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "دعاء الحطيم",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%af%d8%b9%d8%a7%d8%a1%20%d8%a7%d9%84%d8%ad%d8%b7%d9%8a%d9%85.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%af%d8%b9%d8%a7%d8%a1%20%d8%a7%d9%84%d8%ad%d8%b7%d9%8a%d9%85.jpg",
      writerName: "العلامة الشيخ أبي بكر بن الشيخ محمد بن عمر الملا الحنفي الأحسائي المتوفى سنة ١٠٤٨ هـ",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "دعاء ختم القران",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%af%d8%b9%d8%a7%d8%a1%20%d8%ae%d8%aa%d9%85%20%d8%a7%d9%84%d9%82%d8%b1%d8%a7%d9%86.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%af%d8%b9%d8%a7%d8%a1%20%d8%ae%d8%aa%d9%85%20%d8%a7%d9%84%d9%82%d8%b1%d8%a7%d9%86.jpg",
      writerName: "أبي بكر بن الشيخ محمد بن الشيخ عمر الملا",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "دفع الاسى في اذكار الصباح والمسا",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%af%d9%81%d8%b9%20%d8%a7%d9%84%d8%a7%d9%94%d8%b3%d9%89%20%d9%81%d9%8a%20%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad%20%d9%88%d8%a7%d9%84%d9%85%d8%b3%d8%a7.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%af%d9%81%d8%b9%20%d8%a7%d9%84%d8%a7%d9%94%d8%b3%d9%89%20%d9%81%d9%8a%20%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad%20%d9%88%d8%a7%d9%84%d9%85%d8%b3%d8%a7.jpg",
      writerName: "الإمام برهان الدين إبراهيم بن حسن الملا",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "دفع الأسى في أذكار الصباح والمسا",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%af%d9%81%d8%b9%20%d8%a7%d9%84%d8%a7%d8%b3%d9%89%20%d9%81%d9%8a%20%d8%a7%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad%20%d9%88%d8%a7%d9%84%d9%85%d8%b3%d8%a7.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%af%d9%81%d8%b9%20%d8%a7%d9%84%d8%a7%d8%b3%d9%89%20%d9%81%d9%8a%20%d8%a7%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad%20%d9%88%d8%a7%d9%84%d9%85%d8%b3%d8%a7.jpg",
      writerName: "الشيخ إبراهيم بن حسن الملا",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "ذكر يوم عرفة",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b0%d9%83%d8%b1%20%d9%8a%d9%88%d9%85%20%d8%b9%d8%b1%d9%81%d8%a9.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b0%d9%83%d8%b1%20%d9%8a%d9%88%d9%85%20%d8%b9%d8%b1%d9%81%d8%a9.jpg",
      writerName: "الشيخ عبد الله بن الشيخ أبي بكر الملا الأحسائي",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "رفع اللوم عن من استخار لعمل الليلة واليوم",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b1%d9%81%d8%b9%20%d8%a7%d9%84%d9%84%d9%88%d9%85%20%d8%b9%d9%86%20%d9%85%d9%86%20%d8%a7%d8%b3%d8%aa%d8%ae%d8%a7%d8%b1%20%d9%84%d8%b9%d9%85%d9%84%20%d8%a7%d9%84%d9%84%d9%8a%d9%84%d8%a9%20%d9%88%d8%a7%d9%84%d9%8a%d9%88%d9%85.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b1%d9%81%d8%b9%20%d8%a7%d9%84%d9%84%d9%88%d9%85%20%d8%b9%d9%86%20%d9%85%d9%86%20%d8%a7%d8%b3%d8%aa%d8%ae%d8%a7%d8%b1%20%d9%84%d8%b9%d9%85%d9%84%20%d8%a7%d9%84%d9%84%d9%8a%d9%84%d8%a9%20%d9%88%d8%a7%d9%84%d9%8a%d9%88%d9%85.jpg",
      writerName: "العالم العلامة الشيخ الشيخ أبو بكر بن الشيخ محمدالملا الحنفي الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "روضة الازهار في متنوعات الاشعار",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b1%d9%88%d8%b6%d8%a9%20%d8%a7%d9%84%d8%a7%d8%b2%d9%87%d8%a7%d8%b1%20%d9%81%d9%8a%20%d9%85%d8%aa%d9%86%d9%88%d8%b9%d8%a7%d8%aa%20%d8%a7%d9%84%d8%a7%d8%b4%d8%b9%d8%a7%d8%b1.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b1%d9%88%d8%b6%d8%a9%20%d8%a7%d9%84%d8%a7%d8%b2%d9%87%d8%a7%d8%b1%20%d9%81%d9%8a%20%d9%85%d8%aa%d9%86%d9%88%d8%b9%d8%a7%d8%aa%20%d8%a7%d9%84%d8%a7%d8%b4%d8%b9%d8%a7%d8%b1.jpg",
      writerName: "العلامة المحدث الأديب الشيخ عبد الرحمن بن الشيخ أبي بكر الملا (١٣٢٣-١٤٢١هـ)",
      category: category[2],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "زواهر القلائد إلى مهمات القواعد",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b2%d9%88%d8%a7%d9%87%d8%b1%20%d8%a7%d9%84%d9%82%d9%84%d8%a7%d9%8a%d9%94%d8%af%20%d8%a7%d9%95%d9%84%d9%89%20%d9%85%d9%87%d9%85%d8%a7%d8%aa%20%d8%a7%d9%84%d9%82%d9%88%d8%a7%d8%b9%d8%af.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b2%d9%88%d8%a7%d9%87%d8%b1%20%d8%a7%d9%84%d9%82%d9%84%d8%a7%d9%8a%d9%94%d8%af%20%d8%a7%d9%95%d9%84%d9%89%20%d9%85%d9%87%d9%85%d8%a7%d8%aa%20%d8%a7%d9%84%d9%82%d9%88%d8%a7%d8%b9%d8%af.jpg",
      writerName: "العلامة الشيخ أبو بكر ابن الشيخ محمد الملا الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[9],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "سراج الظلم في تلخيص الحكم",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b3%d8%b1%d8%a7%d8%ac%20%d8%a7%d9%84%d8%b8%d9%84%d9%85%20%d9%81%d9%8a%20%d8%aa%d9%84%d8%ae%d9%8a%d8%b5%20%d8%a7%d9%84%d8%ad%d9%83%d9%85.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b3%d8%b1%d8%a7%d8%ac%20%d8%a7%d9%84%d8%b8%d9%84%d9%85%20%d9%81%d9%8a%20%d8%aa%d9%84%d8%ae%d9%8a%d8%b5%20%d8%a7%d9%84%d8%ad%d9%83%d9%85.jpg",
      writerName: "العلامة الشيخ أبي بكر بن الشيخ محمد بن عمر الملا الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "سلم المريد لمعرفة أحكام التجويد",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b3%d9%84%d9%85%20%d8%a7%d9%84%d9%85%d9%8a%d8%b1%d8%af%20%d9%81%d9%8a%20%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d8%aa%d8%ac%d9%88%d9%8a%d8%af.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b3%d9%84%d9%85%20%d8%a7%d9%84%d9%85%d9%8a%d8%b1%d8%af%20%d9%81%d9%8a%20%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d8%aa%d8%ac%d9%88%d9%8a%d8%af.jpg",
      writerName: "الشيخ محمد بن الشيخ أبي بكر الملا",
      category: category[5],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "سلم المريد لمعرفة أحكام التجويد",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b3%d9%84%d9%85%20%d8%a7%d9%84%d9%85%d8%b1%d9%8a%d8%af%20%d9%84%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d9%94%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d8%aa%d8%ac%d9%88%d9%8a%d8%af.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b3%d9%84%d9%85%20%d8%a7%d9%84%d9%85%d8%b1%d9%8a%d8%af%20%d9%84%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d9%94%d8%ad%d9%83%d8%a7%d9%85%20%d8%a7%d9%84%d8%aa%d8%ac%d9%88%d9%8a%d8%af.jpg",
      writerName: " للعلامة الشيخ محمد بن أبي بكر الملا",
      category: category[5],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "سير الأوائل في حكم تملك العروق والأصائل",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d8%b3%d9%8a%d8%b1%20%d8%a7%d9%84%d8%a7%d9%94%d9%88%d8%a7%d9%8a%d9%94%d9%84%20%d9%81%d9%8a%20%d8%ad%d9%83%d9%85%20%d8%aa%d9%85%d9%84%d9%83%20%d8%a7%d9%84%d8%b9%d8%b1%d9%88%d9%82%20%d9%88%d8%a7%d9%84%d8%a7%d9%94%d8%b5%d8%a7%d9%8a%d9%94%d9%84.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d8%b3%d9%8a%d8%b1%20%d8%a7%d9%84%d8%a7%d9%94%d9%88%d8%a7%d9%8a%d9%94%d9%84%20%d9%81%d9%8a%20%d8%ad%d9%83%d9%85%20%d8%aa%d9%85%d9%84%d9%83%20%d8%a7%d9%84%d8%b9%d8%b1%d9%88%d9%82%20%d9%88%d8%a7%d9%84%d8%a7%d9%94%d8%b5%d8%a7%d9%8a%d9%94%d9%84.jpg",
      writerName: "العلامة الفقيه المحدث الشيخ عبد الرحمن بن الشيخ أبي بكر الملا (١٣٢٣هـ-١٤٢١هـ)",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "شرح نصيحة التاج ابن زكريا",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d8%b4%d8%b1%d8%ad%20%d9%86%d8%b5%d9%8a%d8%ad%d8%a9%20%d8%a7%d9%84%d8%aa%d8%a7%d8%ac%20%d8%a7%d8%a8%d9%86%20%d8%b2%d9%83%d8%b1%d9%8a%d8%a7.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d8%b4%d8%b1%d8%ad%20%d9%86%d8%b5%d9%8a%d8%ad%d8%a9%20%d8%a7%d9%84%d8%aa%d8%a7%d8%ac%20%d8%a7%d8%a8%d9%86%20%d8%b2%d9%83%d8%b1%d9%8a%d8%a7.jpg",
      writerName: "الإمام العلامة برهان الدين إبراهيم بن حسن الملا الحنفي الأحسائي المتوفى سنة ١٠٤٨ هـ - رحمه الله تعالى",
      category: category[1],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "صفة صلاة النبي صلى الله عليه وسلم",
      pdfPath: "https://mulla.hwzn.sa/image/%d8%b4%d8%b1%d8%ad%20%d9%86%d8%b5%d9%8a%d8%ad%d8%a9%20%d8%a7%d9%84%d8%aa%d8%a7%d8%ac%20%d8%a7%d8%a8%d9%86%20%d8%b2%d9%83%d8%b1%d9%8a%d8%a7.jpg",
      imagePath: "https://mulla.hwzn.sa/image/%d8%b5%d9%81%d8%a9%20%d8%b5%d9%84%d8%a7%d8%a9%20%d8%a7%d9%84%d9%86%d8%a8%d9%8a%20%d8%b5%d9%84%d9%89%20%d8%a7%d9%84%d9%84%d9%87%20%d8%b9%d9%84%d9%8a%d9%87%20%d9%88%d8%b3%d9%84%d9%85.jpg",
      writerName: "رائد عبد الله الملا",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "عقد البضاعة في شرح بنت ساعة",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d8%b9%d9%82%d8%af%20%d8%a7%d9%84%d8%a8%d8%b6%d8%a7%d8%b9%d8%a9%20%d9%81%d9%8a%20%d8%b4%d8%b1%d8%ad%20%d8%a8%d9%86%d8%aa%20%d8%b3%d8%a7%d8%b9%d8%a9.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d8%b9%d9%82%d8%af%20%d8%a7%d9%84%d8%a8%d8%b6%d8%a7%d8%b9%d8%a9%20%d9%81%d9%8a%20%d8%b4%d8%b1%d8%ad%20%d8%a8%d9%86%d8%aa%20%d8%b3%d8%a7%d8%b9%d8%a9.jpg",
      writerName: "العالم العلامةأبو بكر بن الشيخ محمد الملا المتوفى سنة ١٢٧٠ هـ",
      category: category[6],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "فقه المبتدئين تبصرة الصبيان",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%81%d9%82%d9%87%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%d9%94%d9%8a%d9%86%20%d8%aa%d8%a8%d8%b5%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b5%d8%a8%d9%8a%d8%a7%d9%86.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%81%d9%82%d9%87%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%d9%94%d9%8a%d9%86%20%d8%aa%d8%a8%d8%b5%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b5%d8%a8%d9%8a%d8%a7%d9%86.jpg",
      writerName: "العالمة الفقيه محمد صالح بن الشيخ صديق كمال الحنفى الملكي (١٢٦٣-١٣٣٢هـ)",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "قرة العيون المبصرة 2",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%82%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b9%d9%8a%d9%88%d9%86%20%d8%a7%d9%84%d9%85%d8%a8%d8%b5%d8%b1%d8%a9%202.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%82%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b9%d9%8a%d9%88%d9%86%20%d8%a7%d9%84%d9%85%d8%a8%d8%b5%d8%b1%d8%a9%202.jpg",
      writerName: "الشيخ أبي بكر بن الشيخ محمد بن الشيخ عمر الملا الحنفي الأحسائي",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "قرة العيون المبصرة",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%82%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b9%d9%8a%d9%88%d9%86%20%d8%a7%d9%84%d9%85%d8%a8%d8%b5%d8%b1%d8%a9.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%82%d8%b1%d8%a9%20%d8%a7%d9%84%d8%b9%d9%8a%d9%88%d9%86%20%d8%a7%d9%84%d9%85%d8%a8%d8%b5%d8%b1%d8%a9.jpg",
      writerName: "الشيخ أبي بكر بن الشيخ محمد بن الشيخ عمر الملا الحنفي الأحسائي",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "كفاية المبتدي وتذكرة المنتهي",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%83%d9%81%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%20%d9%88%d8%aa%d8%b0%d9%83%d8%b1%d8%a9%20%d8%a7%d9%84%d9%85%d9%86%d8%aa%d9%87%d9%8a.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%83%d9%81%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%a8%d8%aa%d8%af%d9%8a%20%d9%88%d8%aa%d8%b0%d9%83%d8%b1%d8%a9%20%d8%a7%d9%84%d9%85%d9%86%d8%aa%d9%87%d9%8a.jpg",
      writerName: "العالمة الفقية الشيخ مصطفي بن احمد الاسقاطي الحنفي المتوفى سنة (١٣٨٧) هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "لباب المناسك وعباب المسالك",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%84%d8%a8%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83%20%d9%88%d8%b9%d8%a8%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d8%b3%d8%a7%d9%84%d9%83.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%84%d8%a8%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83%20%d9%88%d8%b9%d8%a8%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d8%b3%d8%a7%d9%84%d9%83.jpg",
      writerName: "العلامة الفقية المحدث الشيخ عبد الله ابن ابراهيم العمري السندي المكي الحنفي المولود سنة (٩٣٠) هـ و المتوفى سنة (٩٩٣) هـ رحمه الله تعالى",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "متن تحفةالطلاب",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%85%d8%aa%d9%86%20%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d8%b7%d9%84%d8%a7%d8%a8.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%85%d8%aa%d9%86%20%d8%aa%d8%ad%d9%81%d8%a9%20%d8%a7%d9%84%d8%b7%d9%84%d8%a7%d8%a8.jpg",
      writerName: "المرحوم الإمام العلامة العارف بالله والال عليه من بالعلم والورع تحلى الشيخ أبي بكر بن الشيخ محمد بن عمر الملا قدس الله روحه",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "مجالس الحداد",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%85%d8%ac%d8%a7%d9%84%d8%b3%20%d8%a7%d9%84%d8%ad%d8%af%d8%a7%d8%af.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%85%d8%ac%d8%a7%d9%84%d8%b3%20%d8%a7%d9%84%d8%ad%d8%af%d8%a7%d8%af.jpg",
      writerName: "الامام السيد عبد الله بن علوي الحداد الحضرمي",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "مسلك البيان لقلادة العقيان",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%85%d8%b3%d9%84%d9%83%20%d8%a7%d9%84%d8%a8%d9%8a%d8%a7%d9%86%20%d9%84%d9%82%d9%84%d8%a7%d8%af%d8%a9%20%d8%a7%d9%84%d8%b9%d9%82%d9%8a%d8%a7%d9%86.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%85%d8%b3%d9%84%d9%83%20%d8%a7%d9%84%d8%a8%d9%8a%d8%a7%d9%86%20%d9%84%d9%82%d9%84%d8%a7%d8%af%d8%a9%20%d8%a7%d9%84%d8%b9%d9%82%d9%8a%d8%a7%d9%86.jpg",
      writerName: "العلامة الشيخ محمد بن عبد الرحمن الملا الحنفي الأحسائي المتوفى سنة (١١٠٠) هـ",
      category: category[6],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "مسلك الثقات",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%85%d8%b3%d9%84%d9%83%20%d8%a7%d9%84%d8%ab%d9%82%d8%a7%d8%aa.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%85%d8%b3%d9%84%d9%83%20%d8%a7%d9%84%d8%ab%d9%82%d8%a7%d8%aa.jpg",
      writerName: "خاتمة المتأخرين العلامة أبي بكر بن الشيخ محمد الملا الأحسائي",
      category: category[6],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "منهاج الراغب إلى إتحاف الطالب",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%85%d9%86%d9%87%d8%a7%d8%ac%20%d8%a7%d9%84%d8%b1%d8%a7%d8%ba%d8%a8%20%d8%a7%d9%95%d9%84%d9%89%20%d8%a7%d9%95%d8%aa%d8%ad%d8%a7%d9%81%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%85%d9%86%d9%87%d8%a7%d8%ac%20%d8%a7%d9%84%d8%b1%d8%a7%d8%ba%d8%a8%20%d8%a7%d9%95%d9%84%d9%89%20%d8%a7%d9%95%d8%aa%d8%ad%d8%a7%d9%81%20%d8%a7%d9%84%d8%b7%d8%a7%d9%84%d8%a8.jpg",
      writerName: "صنفه وشرحه العلامة الشيخ أبو بكر بن الشيخ محمد الملا الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "هداية المحتذي لشمائل الترمذي 1",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%ad%d8%aa%d8%b0%d9%8a%20%d9%84%d8%b4%d9%85%d8%a7%d9%8a%d9%94%d9%84%20%d8%a7%d9%84%d8%aa%d8%b1%d9%85%d8%b0%d9%8a%201.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%ad%d8%aa%d8%b0%d9%8a%20%d9%84%d8%b4%d9%85%d8%a7%d9%8a%d9%94%d9%84%20%d8%a7%d9%84%d8%aa%d8%b1%d9%85%d8%b0%d9%8a%201.jpg",
      writerName: "للعلامة الشيخ أبي بكر بن الشيخ محمد بن عمر الملا الحنفي الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[4],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "هداية المحتذي لشمائل الترمذي 2",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%ad%d8%aa%d8%b0%d9%8a%20%d9%84%d8%b4%d9%85%d8%a7%d9%8a%d9%94%d9%84%20%d8%a7%d9%84%d8%aa%d8%b1%d9%85%d8%b0%d9%8a%202.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%85%d8%ad%d8%aa%d8%b0%d9%8a%20%d9%84%d8%b4%d9%85%d8%a7%d9%8a%d9%94%d9%84%20%d8%a7%d9%84%d8%aa%d8%b1%d9%85%d8%b0%d9%8a%202.jpg",
      writerName: "للعلامة الشيخ أبي بكر بن الشيخ محمد بن عمر الملا الحنفي الأحسائي المتوفى سنة ١٢٧٠ هـ",
      category: category[4],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "هداية الناسك الى معرفة آداب المناسك",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%86%d8%a7%d8%b3%d9%83%20%d8%a7%d9%84%d9%89%20%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d9%93%d8%af%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d9%87%d8%af%d8%a7%d9%8a%d8%a9%20%d8%a7%d9%84%d9%86%d8%a7%d8%b3%d9%83%20%d8%a7%d9%84%d9%89%20%d9%85%d8%b9%d8%b1%d9%81%d8%a9%20%d8%a7%d9%93%d8%af%d8%a7%d8%a8%20%d8%a7%d9%84%d9%85%d9%86%d8%a7%d8%b3%d9%83.jpg",
      writerName: "شيخ الإسلام الشيخ إبراهيم بن حسن الملا الحنفي الأحسائي الشهير بمفتي الشرق ت ١٠٤٨ هـ",
      category: category[0],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "وسيلة الرضوان لختم القرآن",
      pdfPath:
      "https://mulla.hwzn.sa/pdf/%d9%88%d8%b3%d9%8a%d9%84%d8%a9%20%d8%a7%d9%84%d8%b1%d8%b6%d9%88%d8%a7%d9%86%20%d9%84%d8%ae%d8%aa%d9%85%20%d8%a7%d9%84%d9%82%d8%b1%d8%a7%d9%93%d9%86.pdf",
      imagePath:
      "https://mulla.hwzn.sa/image/%d9%88%d8%b3%d9%8a%d9%84%d8%a9%20%d8%a7%d9%84%d8%b1%d8%b6%d9%88%d8%a7%d9%86%20%d9%84%d8%ae%d8%aa%d9%85%20%d8%a7%d9%84%d9%82%d8%b1%d8%a7%d9%93%d9%86.jpg",
      writerName: "العالم العلامة الشيخ أبي بكر بن الشيخ محمد بن الشيخ عمر الملا الحنفي الأحسائي المتوفى سنة ١٢٧٠ هـ تغمده الله برحمته الواسعة",
      category: category[3],
      latest: false,
      mostViewed: false),
  BooksModel(
      name: "وسيلة الفلاح في أذكار المساء والصباح",
      pdfPath: "https://mulla.hwzn.sa/pdf/%d9%88%d8%b3%d9%8a%d9%84%d8%a9%20%d8%a7%d9%84%d9%81%d9%84%d8%a7%d8%ad%20%d9%81%d9%8a%20%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d9%85%d8%b3%d8%a7%d8%a1%20%d9%88%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad.pdf",
      imagePath: "https://mulla.hwzn.sa/image/%d9%88%d8%b3%d9%8a%d9%84%d8%a9%20%d8%a7%d9%84%d9%81%d9%84%d8%a7%d8%ad%20%d9%81%d9%8a%20%d8%a7%d9%94%d8%b0%d9%83%d8%a7%d8%b1%20%d8%a7%d9%84%d9%85%d8%b3%d8%a7%d8%a1%20%d9%88%d8%a7%d9%84%d8%b5%d8%a8%d8%a7%d8%ad.jpg",
      writerName: "العلامة الشيخ أبو بكر بن الشيخ محمد الملا  (١١٩٨-١٢٧٠هـ)",
      category: category[3],
      latest: false,
      mostViewed: false),
];