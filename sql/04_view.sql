USE sanamedical_db;
CREATE OR REPLACE VIEW V_AntreanKlinikHariIni AS
SELECT
    k.id_kunjungan,
    p.no_rekam_medis,
    p.nama_pasien,
    d.nama_dokter,
    d.spesialisasi,
    k.tanggal_kunjungan,
    k.keluhan_utama,
    k.status_kunjungan
FROM kunjungan k
JOIN pasien p ON k.id_pasien = p.id_pasien
JOIN dokter d ON k.id_dokter = d.id_dokter
WHERE DATE(k.tanggal_kunjungan) = CURDATE()
  AND k.status_kunjungan IN ('Daftar', 'Pemeriksaan')
ORDER BY k.tanggal_kunjungan ASC;

SELECT * FROM V_AntreanKlinikHariIni;