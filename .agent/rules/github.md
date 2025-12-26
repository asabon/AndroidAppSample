---
trigger: always_on
---

# GitHub 操作ルール (gh CLI)

## 許可事項 (SafeToAutoRun: true)
以下の読み取り専用コマンドは、ユーザーの承認なしに実行できます：
- `gh issue view`
- `gh issue list`
- `gh pr view`
- `gh pr list`
- `gh repo view`
- `gh --version`
- `gh auth status`
