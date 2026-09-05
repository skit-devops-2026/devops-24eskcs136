#!/usr/bin/env bash
set -euo pipefail

echo "Running Task Management System tests..."

test -f Home.html
test -f Delete.html
test -f Update.html
test -f Script/sidebar.js

grep -q '<form' Delete.html
grep -q 'name="id"' Delete.html
grep -q 'required' Delete.html

grep -q 'toggle-btn' Home.html
grep -q 'sidebar' Home.html

echo "All tests passed."
grep -q 'Task' Home.html
grep -q '<form' Update.html
grep -q 'confirm' Delete.html
