class Kontrak {
  String cONTRACTNO;
  Null oVDINSTNO;
  Null oVDDUEDATE;
  String tENOR;
  String oTSAR;

  Kontrak(
      {this.cONTRACTNO,
      this.oVDINSTNO,
      this.oVDDUEDATE,
      this.tENOR,
      this.oTSAR});

  Kontrak.fromJson(Map<String, dynamic> json) {
    cONTRACTNO = json['CONTRACT_NO'];
    oVDINSTNO = json['OVD_INST_NO'];
    oVDDUEDATE = json['OVD_DUE_DATE'];
    tENOR = json['TENOR'];
    oTSAR = json['OTS_AR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CONTRACT_NO'] = this.cONTRACTNO;
    data['OVD_INST_NO'] = this.oVDINSTNO;
    data['OVD_DUE_DATE'] = this.oVDDUEDATE;
    data['TENOR'] = this.tENOR;
    data['OTS_AR'] = this.oTSAR;
    return data;
  }
}
