USE sanamedical_db;

-- 1. Rekap jumlah kunjungan per dokter
SELECT 
    d.nama_dokter,
    d.spesialisasi,
    COUNT(k.id_kunjungan) AS total_kunjungan
FROM dokter d
LEFT JOIN kunjungan k ON d.id_dokter = k.id_dokter
GROUP BY d.id_dokter, d.nama_dokter, d.spesialisasi;

-- 2. Rekap total tagihan pelayanan medis yang sudah selesai diolah
SELECT 
    COUNT(id_rekam_medis) AS total_pasien_diperiksa,
    SUM(biaya_jasa_dokter) AS total_jasa_dokter,
    SUM(biaya_obat) AS total_biaya_obat,
    SUM(total_tagihan) AS grand_total_pendapatan
FROM rekam_medis;

-- 3. Filter dokter yang memiliki total kunjungan lebih dari 150.000 (Contoh klausal HAVING)
SELECT 
    d.nama_dokter,
    COUNT(rm.id_rekam_medis) AS jumlah_pemeriksaan,
    SUM(rm.total_tagihan) AS total_tagihan
FROM dokter d
JOIN kunjungan k ON d.id_dokter = k.id_dokter
JOIN rekam_medis rm ON k.id_kunjungan = rm.id_kunjungan
GROUP BY d.id_dokter, d.nama_dokter
HAVING SUM(rm.total_tagihan) > 150000;

