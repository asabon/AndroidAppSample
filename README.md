[![build](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml)

# AndroidAppTemplate

## 概要

このリポジトリは、Android アプリ開発を開始する際の **GitHub リポジトリテンプレート** です。
あらかじめ最適な CI/CD 環境と AI アシスタント（Antigravity）の設定が組み込まれており、新しいプロジェクトを爆速で立ち上げることができます。

## 主な特徴

- **CI/CD 標準装備**: Lint チェック、ユニットテスト、ビルドチェックが設定済み。
- **AI 連携**: Antigravity 向けの設定が統合されており、AI と協力して開発を進められます。
- **品質管理**: Ktlint, Android Lint によるコード品質の維持が容易です。

---

## クイックスタート

### 1. リポジトリの作成
GitHub の **"Use this template"** ボタンをクリックし、新しいリポジトリを作成します。

### 2. 初期セットアップ
ローカルにクローンした後、初期設定を行います。

```bash
# プロジェクト名の置換（必要に応じて）
# app/src/main/java/ のパッケージ名などをリネーム
./gradlew assembleDebug
```

### 3. AI アシスタントの起動
Antigravity を使用している場合は、以下のコマンドでコンテキストをロードします。

- `/init`: プロジェクトルールの読み込み。
- `/resume`: 前回の進捗から再開。

---

## ディレクトリ構成

```text
+ .agent/           # Antigravity (AI アシスタント) 用の設定
+ .github/
  + workflows/      # CI/CD ワークフロー定義 (GitHub Actions)
+ app/              # Android アプリ本体
+ ci/               # CI/CD 各種ツールの詳細設定・ドキュメント
+ docs/
  + progress/
    + task.md       # 進捗管理（AI との共有用）
```

---

## CI/CD ワークフロー詳細

以下のチェックが自動で実行されます。詳細は `ci/` ディレクトリ内のドキュメントを参照してください。

- **[Build](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml)**: リリースビルドの成否。
- **[Ktlint](https://github.com/asabon/AndroidAppTemplate/actions/workflows/ktlint.yml)**: Kotlin のスタイルチェック。
- **[Android Lint](https://github.com/asabon/AndroidAppTemplate/actions/workflows/androidLint.yml)**: 潜在的なバグやパフォーマンスのチェック。
- **[Unit Test](https://github.com/asabon/AndroidAppTemplate/actions/workflows/unitTest.yml)**: ユニットテストの実行。

---

## カスタマイズ方法

### パッケージ名の変更
`app/build.gradle.kts` の `namespace` および `applicationId` を変更し、ソースコードのディレクトリ構造をそれに合わせて移動してください。

### GitHub Secrets の設定
自動配信（AAB生成など）を行う場合は、GitHub リポジトリの Secrets に必要なキーを登録してください。
