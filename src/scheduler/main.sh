#!/bin/sh
set -eu
curl -fsS "$API_URL/version"
echo
