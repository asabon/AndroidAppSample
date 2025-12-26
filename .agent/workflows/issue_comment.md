---
description: 既存の GitHub Issue にコメントを追加する
---

1. コメントする対象の Issue 番号を確認する。
2. // turbo
   もし Issue 本文にチェックリストがある場合は、`gh issue edit <Issue番号> --body "更新後の本文"` を実行して進捗を反映（チェックを入れる等）させる。
3. 作業結果や報告内容を日本語で作成する。
4. // turbo
   `gh issue comment <Issue番号> --body "コメント本文"` を実行してコメントを追加する。
