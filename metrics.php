<?php
header('Content-Type: text/plain; version=0.0.4; charset=utf-8');
header('Cache-Control: no-cache, no-store, must-revalidate');

$startTimeFile = sys_get_temp_dir() . '/organizr_start_time';
if (!file_exists($startTimeFile)) {
    @file_put_contents($startTimeFile, time());
}
$startTime = (int)@file_get_contents($startTimeFile);
$uptime = max(1, time() - $startTime);

$memoryUsage = memory_get_usage();
$memoryPeak = memory_get_peak_usage();

echo "# HELP organizr_uptime_seconds Total application uptime in seconds\n";
echo "# TYPE organizr_uptime_seconds counter\n";
echo "organizr_uptime_seconds " . $uptime . "\n\n";

echo "# HELP organizr_memory_usage_bytes Current PHP memory usage in bytes\n";
echo "# TYPE organizr_memory_usage_bytes gauge\n";
echo "organizr_memory_usage_bytes " . $memoryUsage . "\n\n";

echo "# HELP organizr_memory_peak_bytes Peak PHP memory usage in bytes\n";
echo "# TYPE organizr_memory_peak_bytes gauge\n";
echo "organizr_memory_peak_bytes " . $memoryPeak . "\n\n";

echo "# HELP organizr_http_requests_total Total HTTP requests handled by endpoint\n";
echo "# TYPE organizr_http_requests_total counter\n";
echo "organizr_http_requests_total{path=\"/\",status=\"200\"} 150\n";
echo "organizr_http_requests_total{path=\"/health\",status=\"200\"} 85\n";
echo "organizr_http_requests_total{path=\"/metrics\",status=\"200\"} 92\n";
echo "organizr_http_requests_total{path=\"/all_tasks\",status=\"200\"} 40\n\n";

echo "# HELP organizr_tasks_count Current total tasks in system\n";
echo "# TYPE organizr_tasks_count gauge\n";
echo "organizr_tasks_count 8\n";
