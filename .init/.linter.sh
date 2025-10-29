#!/bin/bash
cd /home/kavia/workspace/code-generation/sales-and-inventory-management-system-182200-182209/mobile_frontend
./gradlew lint
LINT_EXIT_CODE=$?
if [ $LINT_EXIT_CODE -ne 0 ]; then
   exit 1
fi

