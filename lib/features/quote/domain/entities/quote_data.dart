class QuoteData {
  final int id;
  final String name;
  final String subject;
  final String phoneNo;
  final String? email;
  final String quotePdfUrl;
  final String salaryPdfUrl;

  QuoteData({
    required this.id,
    required this.name,
    required this.subject,
    required this.phoneNo,
    this.email,
    required this.quotePdfUrl,
    required this.salaryPdfUrl,
  });

  factory QuoteData.fromJson(Map<String, dynamic> json) {
    return QuoteData(
      id: json['id'],
      name: json['name']??'',
      subject: json['subject']??'',
      phoneNo: json['phone_no'],
      email: json['email'],
      quotePdfUrl: json['quote_pdf_url']??'',
      salaryPdfUrl: json['salary_pdf_url']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subject': subject,
      'phone_no': phoneNo,
      'email': email,
      'quote_pdf_url': quotePdfUrl,
      'salary_pdf_url': salaryPdfUrl,
    };
  }
}