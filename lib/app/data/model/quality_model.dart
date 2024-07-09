class Quality {
  String? no;
  String? tanggal;
  String? jamWaktu;
  String? temperature;
  String? kualitasTemperatur;
  String? kekeruhan;
  String? kualitasKekeruhan;
  String? ph;
  String? kualitasPh;
  String? kualitasAir;

  Quality(
      {this.no,
      this.tanggal,
      this.jamWaktu,
      this.temperature,
      this.kualitasTemperatur,
      this.kekeruhan,
      this.kualitasKekeruhan,
      this.ph,
      this.kualitasPh,
      this.kualitasAir});

  Quality.fromJson(Map<String, dynamic> json) {
    no = json['No'];
    tanggal = json['Tanggal'];
    jamWaktu = json['Jam/Waktu'];
    temperature = json['Temperature'];
    kualitasTemperatur = json['KualitasTemperatur'];
    kekeruhan = json['Kekeruhan'];
    kualitasKekeruhan = json['KualitasKekeruhan'];
    ph = json['Ph'];
    kualitasPh = json['KualitasPh'];
    kualitasAir = json['KualitasAir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['No'] = this.no;
    data['Tanggal'] = this.tanggal;
    data['Jam/Waktu'] = this.jamWaktu;
    data['Temperature'] = this.temperature;
    data['KualitasTemperatur'] = this.kualitasTemperatur;
    data['Kekeruhan'] = this.kekeruhan;
    data['KualitasKekeruhan'] = this.kualitasKekeruhan;
    data['Ph'] = this.ph;
    data['KualitasPh'] = this.kualitasPh;
    data['KualitasAir'] = this.kualitasAir;
    return data;
  }
}
