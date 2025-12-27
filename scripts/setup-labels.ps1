# Release Drafter 用の GitHub ラベルをセットアップするスクリプト
# 各ラベルが既に存在してもエラーにならないように制御します。

$ErrorActionPreference = "Stop"

# ラベル定義
$labels = @(
    @{ name = "major"; color = "FF5733"; description = "主要なバージョンアップ（破壊的変更）" }
    @{ name = "breaking"; color = "FF5733"; description = "破壊的変更" }
    @{ name = "minor"; color = "33FF57"; description = "機能追加（マイナーバージョンアップ）" }
    @{ name = "patch"; color = "3357FF"; description = "不具合修正・改善（パッチバージョンアップ）" }
    @{ name = "feature"; color = "a2eeef"; description = "新機能" }
    @{ name = "enhancement"; color = "a2eeef"; description = "機能改善" }
    @{ name = "fix"; color = "d73a4a"; description = "不具合修正" }
    @{ name = "bug"; color = "d73a4a"; description = "不具合報告" }
    @{ name = "chore"; color = "c5def5"; description = "雑務・ビルド関連" }
    @{ name = "documentation"; color = "0075ca"; description = "ドキュメント更新" }
    @{ name = "maintenance"; color = "fbca04"; description = "メンテナンス" }
    @{ name = "refactor"; color = "1d76db"; description = "リファクタリング" }
    @{ name = "style"; color = "c2e0c4"; description = "コードスタイル" }
    @{ name = "test"; color = "006b75"; description = "テスト追加・修正" }
)

Write-Host "Checking and creating GitHub Labels for Release Drafter..." -ForegroundColor Cyan

foreach ($label in $labels) {
    $existing = gh label list --search $label.name | Where-Object { $_ -match "\b$($label.name)\b" }
    
    if ($existing) {
        Write-Host "Label '$($label.name)' already exists. Updating..." -ForegroundColor Yellow
        gh label edit $label.name --color $label.color --description $label.description
    }
    else {
        Write-Host "Creating label '$($label.name)'..." -ForegroundColor Green
        gh label create $label.name --color $label.color --description $label.description
    }
}

Write-Host "Labels setup completed!" -ForegroundColor Cyan
