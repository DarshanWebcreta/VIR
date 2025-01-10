class CompanyData {
  final int id;
  final String companyName;
  final String registrationNo;
  final String providentFundNo;
  final String rjPoliceNo;
  final String gujPoliceNo;
  final String panNo;
  final String serviceTaxNo;
  final String gstNo;
  final String profTaxNo;
  final String? policeNo;
  final String? logo;

  CompanyData({
    required this.id,
    required this.rjPoliceNo,
    required this.gujPoliceNo,
    required this.panNo,
    required this.companyName,
    required this.registrationNo,
    required this.providentFundNo,
    required this.serviceTaxNo,
    required this.logo,
    required this.gstNo,
    required this.profTaxNo,
    this.policeNo,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      gujPoliceNo: json['gujarat_police_no'] as String,
      rjPoliceNo: json['rajasthan_police_no'] as String,
      panNo: json['pan_no'] as String,
      id: json['id'] as int,
      companyName: json['company_name'] as String,
      logo: json['company_logo'] as String,
      registrationNo: json['registration_no'] as String,
      providentFundNo: json['provident_fund_no'] as String,
      serviceTaxNo: json['service_tax_no'] as String,
      gstNo: json['gst_no'] as String,
      profTaxNo: json['prof_tax_no'] as String,
      policeNo: json['police_no'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': companyName,
      'registration_no': registrationNo,
      'provident_fund_no': providentFundNo,
      'service_tax_no': serviceTaxNo,
      'gst_no': gstNo,
      'prof_tax_no': profTaxNo,
      'police_no': policeNo,
    };
  }
}