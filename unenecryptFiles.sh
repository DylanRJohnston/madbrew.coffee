#!/bin/bash
set -o pipefail
set -o nounset
set -o errexit

DIR="$(cd "$(dirname "$0")"; pwd)"

# Set word spliting to newlines only, avoids splitting on file paths with spaces.
IFS=$'\n'
for FILE in $(find "${DIR}" -name '*.gpg'); do
    gpg --use-agent --decrypt 1>"${FILE%.gpg}" 2>/dev/null < "$FILE"
done
