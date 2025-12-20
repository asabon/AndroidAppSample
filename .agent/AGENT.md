# Agent Rules (Index)

## Core Rules
- **Language**:
  - You MUST strictly use **Japanese** for all responses (thoughts, messages, artifacts).

## Rule Modules
状況に応じて、以下の詳細ファイルを `view_file` で読み込み、内容を遵守してください。

- **[Git](rules/git.md)**:
  - Git 操作の制限（コミット禁止、読み取り専用操作の許可）。
- **[Progress](rules/progress.md)**:
  - `docs/progress/task.md` による進捗管理ルール。
- **[Coding](rules/coding.md)**:
  - Kotlin/Android のコーディング規約、Jetpack Compose の利用方針。
- **[Verification](rules/verification.md)**:
  - 自動実行許可コマンド（SafeToAutoRun）、ビルド・Lint 等の必須検証プロセス。

---
## Guidelines
1. 常に `docs/progress/task.md` を確認し、進捗を同期させてください。
2. コードを変更する際は、必ず `verification.md` に記載の検証手順を実行してください。
3. トークン節約のため、現在のタスクに関係のないルールファイルは無理に読み込む必要はありませんが、必要になったら即座に参照してください。
