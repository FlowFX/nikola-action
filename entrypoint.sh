#!/bin/bash

: "${INPUT_DRY_RUN:=false}"

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

echo "==> Installing requirements..."
pip install -r requirements.txt

echo "==> Building site..."
nikola build

echo "==> Publishing..."
if ! $INPUT_DRY_RUN; then
    nikola deploy
else
    echo "Dry-run, skipping..."
fi

echo "==> Done!"
