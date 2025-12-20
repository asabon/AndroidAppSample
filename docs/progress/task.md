# プロジェクト進捗管理

## フェーズ 1: 基盤整備 [x]
- [x] 現状のワークフローとリポジトリ構造の調査
- [x] 実施計画の作成 (implementation_plan.md)
- [x] 進捗管理用ファイルの作成 (docs/progress/task.md)
- [x] Antigravity 基本ワークフローの作成 (`/init`, `/save`, `/resume`)
- [x] README.md の更新 (リポジトリテンプレートおよび AI 連携の説明)
- [x] AGENT.md のモジュール化と日本語化 (.agent/rules/ への分割)
- [x] 検証ルールの詳細化 (ビルド確認と ktlintFormat の義務化)

## フェーズ 2: CI/CD ワークフローの改善 [/]
- [/] GitHub Actions の共通処理を Composite Action へ集約
- [ ] 各 Action の `actions/cache` バージョンを v4 へアップデート
- [ ] 自動リリースワークフロー (`release.yml`) の追加
- [ ] Lint 自動修正またはチェック強化の検討

## 決定事項・メモ
- **トークン節約**: `AGENT.md` をインデックス化し、必要なときのみ `rules/*.md` を読み込む構成を採用。
- **検証フロー**: エージェントは完了報告前に `./gradlew assembleDebug` と `./gradlew ktlintFormat` を実行することを必須ルールとした。
- **Git 操作**: 破壊的操作（commit, push）はエージェントには禁止し、読み取り操作のみを許可。

## フェーズ 3: 仕上げと検証 [ ]
- [ ] 全ワークフローの動作確認
- [ ] テンプレートとしての最終調整
