# build

## 概要

- main ブランチへのプルリクエスト作成時に、プロジェクトのビルド (assembleRelease) を実行します。
- ビルドの成否をチェックし、失敗した場合はプルリクエストのコメントとして表示します。
- ビルドのログを GitHub Actions のアーティファクトとして保存します。
- ビルドのログから warning を抽出し、プルリクエストのコメントとして表示します。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/
    + build.yml         # ビルドチェックを実行する GitHub Actions ワークフロー定義。
+ ci/
  + build/
    + Dangerfile        # Danger を使ったコードレビュー支援の設定ファイル。
    + Gemfile           # Danger の依存関係を管理するファイル。
    + ignore.txt        # ビルド時の警告のうち、無視するものを定義するファイル。
+ app/
  + build.gradle.kts    # Android アプリのビルド設定ファイル。
+ buld.gradle.kts       # プロジェクト全体のビルド設定ファイル。
```

## 設定方法

1. 上記ディレクトリ構成を維持したまま、ファイル(build.yml, Dangerfile, Gemfile, ignore.txt)をコピーしてください。
  - ignore.txt は、いったん空のままにしておき、ビルドログに表示される警告のうち無視したいものを追加していくとよいでしょう。

## 使い方

1. main ブランチへのプルリクエストを作成すると、ビルドチェックが自動的に実行されます。
