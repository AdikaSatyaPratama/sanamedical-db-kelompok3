USE sanamedical_db;
--melihat identitas pasien
SELECT nama_pasien, no_rekam_medis, jenis_kelamin, tanggal_lahir, no_telepon
FROM pasien;

--melihat data dokter dengan spesialisasi "dokter umum"
SELECT nama_dokter, no_izin_praktik, tarif_jasa_medis 
FROM dokter 
WHERE spesialisasi = 'Dokter Umum';

-- 3. Menampilkan daftar kunjungan pasien yang statusnya masih 'Daftar' atau 'Pemeriksaan'
SELECT 
    k.id_kunjungan,
    p.nama_pasien,
    d.nama_dokter,
    k.tanggal_kunjungan,
    k.keluhan_utama,
    k.status_kunjungan
FROM kunjungan k
JOIN pasien p ON k.id_pasien = p.id_pasien
JOIN dokter d ON k.id_dokter = d.id_dokter
WHERE k.status_kunjungan IN ('Daftar', 'Pemeriksaan');