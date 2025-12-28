---
trigger: always_on
---

# Git 操作ルール

## ブランチ命名規則
- **形式**: [Issue番号]-kebab-case-description (例: 86-update-git-rules)
- **禁止事項**: 日本語（全角文字）の使用は禁止。半角英数字とハイフンのみを使用すること。

## バージョン管理 (Git)
- **禁止事項 (許可が必要)**:
  - 基本的にコミット、プッシュ、プル、ブランチ削除は、ユーザーの明示的な許可を得てください。
    - `git commit`
    - `git push`
    - `git pull`
    - `git branch -d / -D`
- **許可事項 (SafeToAutoRun: true)**:
  - 以下の読み取り専用および非破壊的な同期コマンドは、ユーザーの承認なしに実行できます：
    - `git status` / `git status --porcelain`
    - `git log`
    - `git diff`
    - `git show`
    - `git branch` (一覧表示)
    - `git fetch origin`
    - `git remote prune origin`
    - `git remote -v`
  - その他、リポジトリの状態を確認するための読み取り専用コマンドは自由に使用して構いません。

