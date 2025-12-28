---
trigger: always_on
---

# GitHub 操作ルール (gh CLI)

## 許可事項 (SafeToAutoRun: true)
以下の読み取り専用および非破壊的な情報追記コマンドは、ユーザーの承認なしに実行できます：
- `gh issue view` / `gh issue list`
- `gh pr view` / `gh pr list`
- `gh label list`
- `gh repo view`
- `gh issue comment` (進捗報告や栞の自動投稿など)
- `gh --version`
- `gh auth status`

## 許可が必要な事項 (SafeToAutoRun: false)
- `gh issue create` / `gh pr create` (新規申請)
- `gh issue edit` / `gh pr merge` (状態変更)
- `gh label create / edit` (リポジトリ設定変更)
