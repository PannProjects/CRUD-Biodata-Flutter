<?php
header('content-type: application/json');
include 'konekdb.php';

$stmt = $db->prepare("SELECT id, nis,nama,tmplahir,tglahir,kelamin,agama,alamat FROM siswa");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
?>