USE sanamedical_db;

-- kueri untuk uji constrait
DELETE FROM pasien WHERE id_pasien = 1;
DELETE FROM dokter WHERE id_dokter = 1;
INSERT INTO kunjungan (id_pasien, id_dokter, keluhan_utama) VALUES (99, 1, 'tes');
INSERT INTO kunjungan (id_pasien, id_dokter, keluhan_utama) VALUES (99, 1, 'tes');


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