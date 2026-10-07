USE sanamedical_db;
CREATE TABLE pasien (
    id_pasien INT AUTO_INCREMENT PRIMARY KEY,
    no_rekam_medis VARCHAR(20) NOT NULL UNIQUE,
    nama_pasien VARCHAR(50) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin ENUM ('L', 'P') NOT NULL,
    alamat TEXT,
    no_telepon VARCHAR (15)
);

CREATE TABLE dokter (
    id_dokter INT AUTO_INCREMENT PRIMARY KEY,
    nama_dokter VARCHAR(100) NOT NULL,
    spesialisasi VARCHAR(50) NOT NULL,
    no_izin_praktik VARCHAR(20) NOT NULL UNIQUE,
    tarif_jasa_medis DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

CREATE TABLE kunjungan(
    id_kunjungan INT AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT NOT NULL,
    id_dokter INT NOT NULL,
    tanggal_kunjungan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    keluhan_utama TEXT NOT NULL,
    status_kunjungan ENUM('Daftar', 'Pemeriksaan', 'Selesai', 'Batal') NOT NULL DEFAULT 'Daftar',
    CONSTRAINT fk_kunjungan_pasien FOREIGN KEY (id_pasien) 
        REFERENCES pasien(id_pasien) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_kunjungan_dokter FOREIGN KEY (id_dokter) 
        REFERENCES dokter(id_dokter) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE rekam_medis (
    id_rekam_medis INT AUTO_INCREMENT PRIMARY KEY,
    id_kunjungan INT NOT NULL UNIQUE,
    diagnosa TEXT NOT NULL,
    terapi_obat TEXT,
    biaya_jasa_dokter DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    biaya_obat DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    total_tagihan DECIMAL(10, 2) GENERATED ALWAYS AS (biaya_jasa_dokter + biaya_obat) STORED,
    CONSTRAINT fk_rekam_medis_kunjungan FOREIGN KEY (id_kunjungan) 
        REFERENCES kunjungan(id_kunjungan) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TRIGGER TR_AuditPendaftaran
AFTER INSERT ON pendaftaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pendaftaran (id_siswa, id_kursus, aktivitas, tanggal_log)
    VALUES (NEW.id_siswa, NEW.id_kursus, 'Siswa terdaftar baru', NOW());
END