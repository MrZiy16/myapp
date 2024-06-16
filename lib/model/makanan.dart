// model/makanan.dart
class Makanan {
  final int id;
  final String nama;
  final String deskripsi;
  final String resep;
  final String gambar;

  Makanan({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.resep,
    required this.gambar,
  });

  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      resep: json['resep'],
      gambar: json['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'resep': resep,
      'gambar': gambar,
    };
  }
}
