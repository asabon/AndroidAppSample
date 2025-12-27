# Agent Rules (Index)

## Core Rules
- **Language**:
  - You MUST strictly use **Japanese** for all responses (thoughts, messages, artifacts).

## Rule Modules
必要に応じて、以下の詳細ファイルを `view_file` で読み込み、内容を遵守してください。

- Git 操作に関するルール
  - パス: `rules/git.md`
- GitHub 操作に関するルール
  - パス: `rules/github.md`
- タスク・Issue管理に関するルール (`docs/progress/task.md` と GitHub Issue)
  - パス: `rules/task_management.md`
- コーディングに関するルール (Kotlin/Android, Jetpack Compose, 検証プロセス)
  - パス: `rules/coding.md`

---
## Guidelines
1. 常に `docs/progress/task.md` を確認し、進捗を同期させてください。
2. コードを変更する際は、必ず `coding.md` に記載の検証手順を実行してください。
3. トークン節約のため、現在のタスクに関係のないルールファイルは無理に読み込む必要はありませんが、必要になったら即座に参照してください。
