<?php
header('content-type: application/json');
include 'konekdb.php';

$id = $_POST['id'];
$nama = $_POST['nama'];
$nis = $_POST['nis'];
$alamat = $_POST['alamat'];
$kelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$tmplahir = $_POST['tmplahir'];
$tglahir = $_POST['tglahir'];

$stmt = $db->prepare("UPDATE siswa SET nama = ?, nis = ?, alamat = ?, kelamin = ?, agama = ?, tmplahir = ?, tglahir = ? WHERE id = ?");
$result = $stmt->execute([$nama, $nis, $alamat, $kelamin, $agama, $tmplahir, $tglahir, $id]);

echo json_encode([
    'status' => $result,
    'message' => $result ? 'Data berhasil diupdate' : 'Gagal mengupdate data'
]);