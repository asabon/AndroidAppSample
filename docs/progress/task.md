# プロジェクト進捗管理

## フェーズ 1: 基盤整備 [x]
- [x] 現状のワークフローとリポジトリ構造の調査
- [x] 実施計画の作成 (implementation_plan.md)
- [x] 進捗管理用ファイルの作成 (docs/progress/task.md)
- [x] Antigravity 基本ワークフローの作成 (`/init`, `/save`, `/resume`)
- [x] README.md の更新 (リポジトリテンプレートおよび AI 連携の説明)
- [x] AGENT.md のモジュール化と日本語化 (.agent/rules/ への分割)
- [x] 検証ルールの詳細化 (ビルド確認と ktlintFormat の義務化)

## フェーズ 2: CI/CD ワークフローの改善 [x]
- [x] 不要なキャッシュ操作の削除（重複の整理）
- [x] トリガー条件の個別最適化 (paths の詳細設定)
- [x] GitHub Actions の共通処理を Composite Action へ集約 (Checkout 位置のエラー修正を含む)
- [x] 各 Action の `actions/cache` バージョンを v4 へアップデート (Composite Action 内で対応)
- [x] (削除) 自動リリースワークフロー (`release.yml`) の追加
- [x] (削除) Lint 自動修正またはチェック強化の検討

## 決定事項・メモ
- **トークン節約**: `AGENT.md` をインデックス化し、必要なときのみ `rules/*.md` を読み込む構成を採用。
- **検証フロー**: エージェントは完了報告前に `./gradlew assembleDebug` と `./gradlew ktlintFormat` を実行することを必須ルールとした。
- **Git 操作**: 破壊的操作（commit, push）はエージェントには禁止し、読み取り操作のみを許可。
- **CI/CD トリガー**: 
    - `paths` によるホワイトリスト形式を採用。
    - パス指定を（1.ワークフロー 2.ソースコード 3.Gradle関連）の順で論理的にグループ化。
    - `ktlint` のトリガーには実在する `.editorconfig` を含め、`androidLint` からは存在しない `lint.xml` を除外。

## フェーズ 3: 仕上げと検証 [x]
- [x] 全ワークフローの動作確認（ユーザーによる最終検証完了）
- [x] Release Drafter の導入
- [x] バージョン同期 (version.properties) の導入
- [x] テンプレートとしての最終調整

## フェーズ 4: カスタマイズ性の向上 [x]
- [x] パッケージ名を標準プレースホルダー (com.example) へ変更
- [x] プロジェクト名・パッケージ名一括置換スクリプトの作成 (.sh, .ps1)
- [x] README.md へのカスタマイズ手順の追記
