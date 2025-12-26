---
trigger: always_on
---

# Git 操作ルール

## バージョン管理 (Git)
- **禁止事項**:
  - 基本的にコミットおよびプッシュ操作は、ユーザーが手動で行います。
  - 以下のコマンドは、ユーザーの許可なく実行しないでください。
    - git commit
    - git push
- **許可事項**:
  - 以下のコマンドは、ユーザーの承認なしに実行できます（SafeToAutoRun: true）:
    - git status
    - git log
    - git diff
    - git branch
    - git branch -a
    - git show
    - git remote -v
  - その他、レポジトリの状態を確認するための読み取り専用コマンドは自由に使用して構いません。
