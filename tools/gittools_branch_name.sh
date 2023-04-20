#!/bin/bash

find . -type d -name ".git" | while read repo; do
    cd "${repo%/.git}" || continue
    echo "$(pwd):"
    git branch 
    cd - >/dev/null || continue
done
