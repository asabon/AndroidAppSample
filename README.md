[![build](https://github.com/asabon/AndroidAppSample/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/asabon/AndroidAppSample/actions/workflows/build.yml)

# AndroidAppSample

## 概要

- Android アプリ開発時の参考になる情報を集めようとしています。
- 主に GitHub Actions を使った Android アプリ向けの CI/CD のサンプルを掲載しています。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/      # GitHub Actions のワークフロー定義。CI/CD の設定が含まれます。
+ app/              # Android アプリのソースコード。
+ ci/               # 各 CI/CD 機能ごとのディレクトリを集めた親ディレクトリ
  + androidLint/    # Android Lint を使ったコード品質チェック
  + build/          # プロジェクトのビルドチェック
  + ktlint/         # Ktlint を使ったコードスタイルチェック
  + unitTest/       # ユニットテストの実行
```

## 使い方

- 各 CI/CD 機能ごとのディレクトリ (ci/***/) 以下にある README.md を参照してください。
