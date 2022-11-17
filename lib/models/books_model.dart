class BooksModel {
  String? name, pdfPath, imagePath, category,writerName;
  bool? latest, mostViewed;
  BooksModel(
      {this.name,
        this.pdfPath,
        this.imagePath,
        this.writerName,
        this.category,
        this.latest,
        this.mostViewed});
}