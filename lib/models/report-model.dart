
class Report {
  String totalPatientSubmitted;
  String actualPatients;
  String amountTobeReceived;
  String amountReceived;
  String additionalAmountTobeReceived;
  String bonusAmountReceived;
  String remainAmount;

  Report({
    required this.totalPatientSubmitted,
    required this.actualPatients,
    required this.amountTobeReceived,
    required this.amountReceived,
    required this.remainAmount,
    required this.additionalAmountTobeReceived,
    required this.bonusAmountReceived,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      totalPatientSubmitted: json['data']['total_patients_submitted'],
      actualPatients: json['data']['total_actual_patients'],
      amountTobeReceived: json['data']['amount_tobe_received'],      // total amount
      amountReceived: json['data']['amount_received'],
      remainAmount: json['data']['remain_balance'],
      additionalAmountTobeReceived: json['data']['additional_amount_to_be_received'],
      bonusAmountReceived: json['data']['bonus_amount_received'],
    );
  }
}


