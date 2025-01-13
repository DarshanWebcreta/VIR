
class MasterData {
  final int id;
  final String name;
  final int sortOrder;
  final String title;
  final String pfValue;
  final String status;
  final String bonusValue;
  final String cGstValue;
  final String sGstValue;
  final String iGstValue;
  final String createdAt;
  final String updatedAt;
  final String leaveValue;
  final String effectiveDate;
  final String esicPolicyValue;

  MasterData({
    required this.id,
    required this.iGstValue,
    required this.sGstValue,
    required this.cGstValue,
    required this.sortOrder,
    required this.title,
    required this.bonusValue,
    required this.pfValue,
    required this.name,
    required this.status,
    required this.leaveValue,
    required this.effectiveDate,
    required this.esicPolicyValue,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON to Category object
  factory MasterData.fromJson(Map<String, dynamic> json) {
    return MasterData(
      id: json['id'],
      cGstValue: json['cgst_value']??'',
      sGstValue: json['sgst_value']??'',
      iGstValue: json['igst_value']??'',
      bonusValue: json['bonus_value']??'',
      sortOrder: json['sort_order']??0,
      title: json['title']??'',
      pfValue: json['pro_fund_value']??'',
      esicPolicyValue: json['esic_policy_value']??'',

      leaveValue: json['leave_value']??'',
      effectiveDate: json['effective_date']??'',
      name: json['name']??'',
      status: json['status']??'',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Convert Category object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}