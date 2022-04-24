#!/bin/bash

FLUTTER_RUN="flutter run lib/main.dart"

if [ -n "$1" ]; then
  SUPPLIED_ENV_FILE="$1"
  while IFS= read -r line; do
    FLUTTER_RUN="$FLUTTER_RUN --dart-define=$line"

  done <"$SUPPLIED_ENV_FILE"
fi

echo "$FLUTTER_RUN"

eval "$FLUTTER_RUN"

# 1. Set env file as:
#
# KEY=value
#
# 2. Pass `.env` file as argument and run:
# $ ./flutter_run.sh .env
