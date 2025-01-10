class CustomMultipartFile {
  final String filePath;
  final String fileName;

  CustomMultipartFile({required this.filePath, required this.fileName});

  Map<String, dynamic> toJson() {
    return {
      'filePath': filePath,
      'fileName': fileName,
    };
  }
}