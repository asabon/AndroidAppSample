[![build](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml)

# AndroidAppTemplate

## 概要

このリポジトリは、Android アプリ開発を開始する際の **GitHub リポジトリテンプレート** です。
あらかじめ最適な CI/CD 環境が組み込まれており、さらに AI アシスタント（Antigravity）を利用している開発者向けの便利な設定も統合されています。

## 主な特徴

- **CI/CD 標準装備**: Lint チェック、ユニットテスト、ビルドチェックが設定済み。
- **品質管理**: Ktlint, Android Lint によるコード品質の維持が容易です。
- **AI アシスタント対応**: Antigravity 向けの設定が同梱されており、利用する場合は AI とスムーズに連携して開発を進められます。

---

## クイックスタート

### 1. リポジトリの作成
GitHub の **"Use this template"** ボタンをクリックし、新しいリポジトリを作成します。

### 2. 初期セットアップ
ローカルにクローンした後、付属のスクリプトを使用してプロジェクト名とパッケージ名を一括置換します。

**Windows (PowerShell):**
```powershell
./scripts/rename-project.ps1 -NewProjectName "MyNewApp" -NewPackageName "com.myself.myapp"
```

**Mac / Linux / Git Bash:**
```bash
chmod +x scripts/rename-project.sh
./scripts/rename-project.sh "MyNewApp" "com.myself.myapp"
```

実行後、Android Studio で Gradle Sync を行ってください。

### 3. ビルド確認
```bash
./gradlew assembleDebug
```

### 4. アシスタントとの開発サイクル（推奨）
Antigravity を使用している場合は、以下のフローで役割を分担しながら開発を進めることを推奨します。

| ステップ | アクション | 担当 | 備考 |
| :--- | :--- | :--- | :--- |
| **1. 開始** | `/init` または `/resume` を実行 | **ユーザー** | 初回は `/init`、2回目以降は `/resume` |
| **2. 計画** | 要望を伝えて `task.md` と Issue を作成 | ユーザー / **AI** | `/issue_new` 相当 |
| **3. 準備** | 作業用ブランチ（`[Issue番号]-名前`）を作成しチェックアウト | **AI** | `gh issue develop` |
| **4. 実装** | 実装と検証（ビルド・Lint）を行う | **AI** | `coding.md` 遵守 |
| **5. 報告** | `/save` して進捗を保存し、完了を報告 | **AI** | |
| **6. 確認** | 内容を確認し **コミット・プッシュ** | **ユーザー** | |
| **7. 完了** | **AI** が PR を作成。承認後に **main** へマージ | AI / **ユーザー** | |

- **ユーザーが直接使用するコマンド**:
  - `/init`: プロジェクトルールの初回読み込み。
  - `/resume`: 前回の続きから作業を再開。
- **アシスタントが管理するワークフロー**:
  - `/save`: 進捗の保存（完了報告時などに AI が自動実行しますが、ユーザーが手動で保存を指示することも可能です）。
  - `/issue_new` / `/issue_comment`: GitHub Issue の起票や更新。
  - その他 `gh` コマンド等、タスク遂行に必要な操作は AI が自動で判断・実行します。

---

## ディレクトリ構成

```text
+ .agent/
  + rules/          # 開発、Git、GitHub、タスク管理の詳細ルール
  + workflows/      # AI アシスタント用コマンド（/init, /save 等）
+ .github/
  + workflows/      # CI/CD ワークフロー定義 (GitHub Actions)
+ app/              # Android アプリ本体
+ ci/               # CI/CD 各種ツールの詳細設定・ドキュメント
+ docs/
  + progress/
    + task.md       # 進捗管理（唯一の真実：Source of Truth）
```

---

## CI/CD ワークフロー詳細

以下のワークフローが自動で実行され、プロジェクトの品質維持とリリースフローを支えます。

### 品質管理・検証（Pull Request / Push 時）
- **[Build](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build.yml)**: `assembleRelease` のビルド確認。PR 時には Danger による自動報告を行います。
- **[Unit Test](https://github.com/asabon/AndroidAppTemplate/actions/workflows/unitTest.yml)**: ユニットテストの実行。テストレポートとカバレッジ（Kover）を生成します。
- **[Ktlint](https://github.com/asabon/AndroidAppTemplate/actions/workflows/ktlint.yml)**: Kotlin のコーディング規約（Ktlint）のチェックを行います。
- **[Android Lint](https://github.com/asabon/AndroidAppTemplate/actions/workflows/androidLint.yml)**: Android 特有のコード品質や潜在的なバグ（Android Lint）をチェックします。

### リリースプロセス
- **[Release Drafter](https://github.com/asabon/AndroidAppTemplate/actions/workflows/release-drafter.yml)**: マージされた PR のラベルに基づき、リリースノートのドラフトを自動生成します。
- **[Bump Version](https://github.com/asabon/AndroidAppTemplate/actions/workflows/bump-version.yml)**: ドラフトされたバージョンを `version.properties` に反映するための PR を作成します。
- **[Build Signed AAB](https://github.com/asabon/AndroidAppTemplate/actions/workflows/build-aab.yml)**: `v*` タグの Push 時に、署名済み AAB をビルドし、GitHub Release へ自動アップロードします。

---

## 開発・リリース運用について

詳細なバージョン管理ルールやリリースの手順については [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。

---

## カスタマイズ方法

### パッケージ名の変更
`app/build.gradle.kts` の `namespace` および `applicationId` を変更し、ソースコードのディレクトリ構造をそれに合わせて移動してください。

### GitHub Secrets の設定
自動配信（AAB生成など）を行う場合は、GitHub リポジトリの Secrets に必要なキーを登録してください。
