# プロジェクト進捗管理

## フェーズ 1: 基盤整備 [/]
- [x] 現状のワークフローとリポジトリ構造の調査
- [x] 実施計画の作成 (implementation_plan.md)
- [x] 進捗管理用ファイルの作成 (docs/progress/task.md)
- [x] Antigravity 基本ワークフローの作成 (`/init`, `/save`, `/resume`)
- [x] README.md の更新（Antigravity 設定についての追記）

## フェーズ 2: CI/CD ワークフローの改善 [ ]
- [ ] GitHub Actions の共通処理を Composite Action へ集約
- [ ] 各 Action の `actions/cache` バージョンを v4 へアップデート
- [ ] 自動リリースワークフロー (`release.yml`) の追加
- [ ] Lint 自動修正またはチェック強化の検討

## フェーズ 3: 仕上げと検証 [ ]
- [ ] 全ワークフローの動作確認
- [ ] テンプレートとしての最終調整
