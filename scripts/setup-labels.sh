#!/bin/bash

# Release Drafter 用の GitHub ラベルをセットアップするスクリプト
# 各ラベルが既に存在してもエラーにならないように制御します。

set -e

# ラベル定義: "名前:カラー:説明"
LABELS=(
  "major:FF5733:主要なバージョンアップ（破壊的変更）"
  "breaking:FF5733:破壊的変更"
  "minor:33FF57:機能追加（マイナーバージョンアップ）"
  "patch:3357FF:不具合修正・改善（パッチバージョンアップ）"
  "feature:a2eeef:新機能"
  "enhancement:a2eeef:機能改善"
  "fix:d73a4a:不具合修正"
  "bug:d73a4a:不具合報告"
  "chore:c5def5:雑務・ビルド関連"
  "documentation:0075ca:ドキュメント更新"
  "maintenance:fbca04:メンテナンス"
  "refactor:1d76db:リファクタリング"
  "style:c2e0c4:コードスタイル"
  "test:006b75:テスト追加・修正"
)

echo "Checking and creating GitHub Labels for Release Drafter..."

for label_info in "${LABELS[@]}"; do
  IFS=':' read -r name color description <<< "$label_info"
  
  if gh label list --search "$name" | grep -q -w "$name"; then
    echo "Label '$name' already exists. Updating..."
    gh label edit "$name" --color "$color" --description "$description"
  else
    echo "Creating label '$name'..."
    gh label create "$name" --color "$color" --description "$description"
  fi
done

echo "Labels setup completed!"
