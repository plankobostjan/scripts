#!/bin/bash

FILES=$(find . -type f \( -name "*.sh" -o -perm /100 \) ! -path "./.git/*" ! -name "checksums.txt")
while IFS= read -r FILE
do
    sha256sum $FILE >> tmp-checksums.txt
    echo "Generated checksum for: $FILE"
done < <(printf '%s\n' "$FILES")
mv tmp-checksums.txt checksums.txt
