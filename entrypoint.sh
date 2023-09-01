#!/bin/sh

cd /github/workspace

echo "Redocly CLI Version: $(redocly --version)"

redocly $1
