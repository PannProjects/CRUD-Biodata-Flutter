<?php
header('content-type: application/json');
include 'konekdb.php';

$nama = $_POST['nama'];
$nis = $_POST['nis'];
$alamat = $_POST['alamat'];
$kelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$tmplahir = $_POST['tmplahir'];
$tglahir = $_POST['tglahir'];

$stmt = $db->prepare("INSERT INTO siswa (nama, nis, alamat, kelamin, agama, tmplahir, tglahir) VALUES (?, ?, ?, ?, ?, ?, ?)");
$result = $stmt->execute([$nama, $nis, $alamat, $kelamin, $agama, $tmplahir, $tglahir]);

echo json_encode([
    'status' => $result,
    'message' => $result ? 'Data berhasil disimpan' : 'Gagal menyimpan data'
]);