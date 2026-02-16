<?php
header('content-type: application/json');
include 'konekdb.php';

$id = $_POST['id'];

$stmt = $db->prepare("DELETE FROM siswa WHERE id = ?");
$result = $stmt->execute([$id]);

if ($result) {
    echo json_encode([
        'id' => $id,
        'status' => true,
        'message' => 'Data berhasil dihapus'
    ]);
} else {
    echo json_encode([
        'id' => $id,
        'status' => false,
        'message' => 'Gagal menghapus data'
    ]);
}