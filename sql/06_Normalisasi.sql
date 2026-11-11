-- HANYA UNTUK ANALISIS NORMALISASI (jangan di run)
tabel_universal_cacat (
    id_pasien, no_rekam_medis, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_telp,
    id_dokter, nama_dokter, spesialisasi, no_izin_praktik, tarif_jasa_medis, hari_praktik,
    id_kunjungan, tanggal_kunjungan, keluhan_utama, status_kunjungan,
    id_rekam_medis, diagnosa, terapi_obat, biaya_jasa_dokter, biaya_obat, total_tagihan
)
-- atribut yang diperlukan untuk tabel pasien
id_pasien -> no_rekam_medis, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_telp

-- Pisahkan atribut yang cuma bergantung pada id_pasien
CREATE TABLE pasien (
    id_pasien INT AUTO_INCREMENT PRIMARY KEY,
    no_rekam_medis VARCHAR(20) UNIQUE NOT NULL,
    nama_pasien VARCHAR(100) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin ENUM('L','P') NOT NULL,
    alamat VARCHAR(255),
    no_telp VARCHAR(20)
);

