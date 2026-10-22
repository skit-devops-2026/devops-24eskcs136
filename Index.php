<?php
/**
 * Organizr Main Entry Point
 */
if (file_exists(__DIR__ . '/Index.php')) {
    require_once __DIR__ . '/Index.php';
} else {
    header('Location: Home.html');
    exit;
}
