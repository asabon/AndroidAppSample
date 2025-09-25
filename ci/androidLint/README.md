# androidLint

## 概要

- main ブランチへのプルリクエスト作成時に、Android Lint を実行してコード品質をチェックします。
- Android Lint の結果を Danger を使ってプルリクエストのコメントとして表示します。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/
    + androidLint.yml   # Android Lint を実行する GitHub Actions ワークフロー定義。
+ ci/
  + androidLint/
    + Dangerfile        # Danger を使ったコードレビュー支援の設定ファイル。
    + Gemfile           # Danger の依存関係を管理するファイル。
+ app/
  + build.gradle.kts    # Android アプリのビルド設定ファイル。
+ buld.gradle.kts       # プロジェクト全体のビルド設定ファイル。
```

## 設定方法

1. 上記ディレクトリ構成を維持したまま、ファイル(androidLint.yml, Dangerfile, Gemfile)をコピーしてください。

## 使い方

1. main ブランチへのプルリクエストを作成すると、Android Lint が自動的に実行されます。
