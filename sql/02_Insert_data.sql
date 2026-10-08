--insert data pasien
INSERT INTO pasien (no_rekam_medis, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_telepon) VALUES
('RM-2026-001', 'Estes Solo Lord', '2005-09-12', 'L', 'Jl. Udayana No. 12, Singaraja', '081234567890'),
('RM-2026-002', 'Made Dewi', '1998-11-20', 'P', 'Jl. Ahmad Yani No. 45, Singaraja', '089876543210');

--Insert Data Dokter
INSERT INTO dokter (nama_dokter, spesialisasi, no_izin_praktik, tarif_jasa_medis) VALUES
('dr. Budi Santoso, Sp.PD', 'Penyakit Dalam', 'SIP/001/2024', 150000.00),
('dr. Siti Aminah', 'Dokter Umum', 'SIP/002/2024', 80000.00);

-- Insert Data Kunjungan (Status awal)
INSERT INTO kunjungan (id_pasien, id_dokter, tanggal_kunjungan, keluhan_utama, status_kunjungan) VALUES
(1, 1, NOW(), 'Demam tinggi dan pusing sejak 2 hari', 'Daftar'),
(2, 2, NOW(), 'Batuk berdahak dan flu', 'Pemeriksaan');

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