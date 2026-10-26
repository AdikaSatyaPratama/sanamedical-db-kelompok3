-- Insert Data Pasien
INSERT INTO pasien (no_rekam_medis, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_telepon) VALUES
('RM-2026-001', 'Estes Solo Lord', '2005-09-12', 'L', 'Jl. Udayana No. 12, Singaraja', '081234567890'),
('RM-2026-002', 'Made Dewi', '1998-11-20', 'P', 'Jl. Ahmad Yani No. 45, Singaraja', '089876543210'),
('RM-2026-003', 'Kadek Wira', '2000-03-15', 'L', 'Jl. Gajah Mada No. 8, Singaraja', '081322334455');

-- Insert Data Dokter
INSERT INTO dokter (nama_dokter, spesialisasi, no_izin_praktik, tarif_jasa_medis) VALUES
('dr. Budi Santoso, Sp.PD', 'Penyakit Dalam', 'SIP/001/2024', 150000.00),
('dr. Siti Aminah', 'Dokter Umum', 'SIP/002/2024', 80000.00),
('dr. Anang Jua', 'Dokter Umum', 'SIP/003/2024', 180000.00);

-- Insert Data Kunjungan (status awal, hari ini) -> id_kunjungan 1, 2, 3
INSERT INTO kunjungan (id_pasien, id_dokter, tanggal_kunjungan, keluhan_utama, status_kunjungan) VALUES
(1, 1, NOW(), 'Demam tinggi dan pusing sejak 2 hari', 'Daftar'),
(2, 2, NOW(), 'Batuk berdahak dan flu', 'Pemeriksaan'),
(2, 3, NOW(), 'Sakit kepala', 'Daftar');

-- Kunjungan lama yang sudah selesai -> id_kunjungan 4, 5, 6, 7
INSERT INTO kunjungan (id_pasien, id_dokter, tanggal_kunjungan, keluhan_utama, status_kunjungan) VALUES
(1, 1, '2026-09-20 09:00:00', 'Sakit perut', 'Selesai'),
(2, 1, '2026-09-25 10:30:00', 'Tekanan darah tinggi', 'Selesai'),
(1, 2, '2026-10-01 08:15:00', 'Batuk pilek', 'Selesai'),
(2, 2, '2026-10-02 14:00:00', 'Sakit kepala', 'Batal');

-- Rekam medis -> merujuk id_kunjungan 4, 5, 6 (yang berstatus 'Selesai'), id kunjungan 7 tidak ada karena di kunjungan yang id_pasien nya 2, dan id_dokter nya 2 itu status nya batal
INSERT INTO rekam_medis (id_kunjungan, diagnosa, terapi_obat, biaya_jasa_dokter, biaya_obat) VALUES
(4, 'Gastritis', 'Antasida, Omeprazole', 150000, 45000),
(5, 'Hipertensi', 'Amlodipine', 150000, 60000),
(6, 'ISPA ringan', 'Paracetamol, CTM', 80000, 25000);

-- Cek daftar kunjungan beserta nama pasien dan nama dokternya
SELECT 
    k.id_kunjungan,
    k.tanggal_kunjungan,
    p.nama_pasien,
    d.nama_dokter,
    k.keluhan_utama,
    k.status_kunjungan
FROM kunjungan k
JOIN pasien p ON k.id_pasien = p.id_pasien
JOIN dokter d ON k.id_dokter = d.id_dokter;

SELECT nama_pasien, no_rekam_medis, jenis_kelamin, tanggal_lahir, no_telepon
FROM pasien;

SELECT nama_dokter, no_izin_praktik, tarif_jasa_medis, spesialisasi
FROM dokter
WHERE spesialisasi= 'Dokter Umum';

SELECT k.id_kunjungan, p.nama_pasien, d.nama_dokter, k.tanggal_kunjungan, k.keluhan_utama, k.status_kunjungan
FROM kunjungan k
JOIN pasien p ON k.id_pasien = p.id_pasien
JOIN dokter d ON k.id_dokter = d.id_dokter
WHERE k.status_kunjungan IN ('Daftar', 'Pemeriksaan');

SELECT k.id_kunjungan, k.tanggal_kunjungan, p.nama_pasien, d.nama_dokter, 
       k.keluhan_utama, k.status_kunjungan
FROM kunjungan k
JOIN pasien p ON k.id_pasien = p.id_pasien
JOIN dokter d ON k.id_dokter = d.id_dokter
WHERE d.nama_dokter = 'dr. Siti Aminah';

SELECT k.id_kunjungan, k.keluhan_utama, k.status_kunjungan, r.diagnosa
FROM rekam_medis r
JOIN kunjungan k USING (id_kunjungan);

DELETE FROM pasien WHERE id_pasien = 1;

SELECT * FROM kunjungan;
SELECT * FROM dokter;
