<?php
header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-cache, no-store, must-revalidate');

$commitSha = getenv('COMMIT_SHA') ?: (file_exists(__DIR__ . '/COMMIT') ? trim(file_get_contents(__DIR__ . '/COMMIT')) : 'd975599');

$dbConnected = false;
$dbHost = getenv('DB_HOST') ?: 'db';
$dbUser = getenv('DB_USER') ?: 'root';
$dbPass = getenv('DB_PASSWORD') ?: 'organizrRoot123';
$dbName = getenv('DB_NAME') ?: 'organizr';

if (function_exists('mysqli_connect')) {
    $conn = @mysqli_connect($dbHost, $dbUser, $dbPass, $dbName);
    if ($conn) {
        $dbConnected = true;
        @mysqli_close($conn);
    }
}

$response = [
    'status' => 'UP',
    'app' => 'Organizr Task Management System',
    'version' => '1.0.0',
    'commit' => $commitSha,
    'timestamp' => time(),
    'database' => $dbConnected ? 'CONNECTED' : 'STANDBY'
];

echo json_encode($response, JSON_PRETTY_PRINT);
