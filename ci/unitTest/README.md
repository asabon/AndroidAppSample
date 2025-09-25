# unitTest

## 概要

- main ブランチへのプルリクエスト作成時に、ユニットテスト (./gradlew test) を実行します。
- ユニットテストの成否をチェックし、失敗した場合はプルリクエストのコメントとして表示します。
- ユニットテストのレポートを GitHub Actions のアーティファクトとして保存します。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/
    + unitTest.yml      # Unit Test を実行する GitHub Actions ワークフロー定義。
+ ci/
  + unitTest/
    + Dangerfile        # Danger を使ったコードレビュー支援の設定ファイル。
    + Gemfile           # Danger の依存関係を管理するファイル。
+ app/
  + build.gradle.kts    # Android アプリのビルド設定ファイル。
+ buld.gradle.kts       # プロジェクト全体のビルド設定ファイル。
```

## 使い方

1. 上記ディレクトリ構成を維持したまま、ファイル(unitTest.yml, Dangerfile, Gemfile)をコピーして利用してください。
