# タスク・Issue管理ルール

## プロジェクトの「唯一の真実（Source of Truth）」
- **docs/progress/task.md** を現在のプロジェクトステータスと常に一致させてください。

## タスクの追加と開始
1. **タスクの特定**: 要望受領後、直ちに **docs/progress/task.md** に追加。
2. **Issue起票**: 実装前に GitHub Issue を起票（`/issue_new`）。
3. **作業用ブランチの作成**:
   - `gh issue develop` で Issue 紐付けブランチを作成。
   - **命名規則**: 先頭に Issue 番号を付与（例: `82-optimize-flow`）。

## 作業中の進捗・反映
- 進捗時は `/issue_comment` や `/save` を使用して、Issue と `task.md` を最新に保つ。

## 完了・PR・クリーンアップフロー
AI がナビゲーターとして以下のステップを主導します。

### Step 5. 完了報告（AI主導）
- AI が `task.md` のタスクを「完了 `[x]`」に更新し、GitHub Issue のチェックリストも全て埋める。
- AI から「完了しました。この変更と一緒に task.md の完了状態も push されます」と報告。

### Step 6. 内容確認とプッシュ（User）
- ユーザーが変更内容を確認し、ローカルで **コミット・プッシュ** を実行。

### Step 7. プルリクエスト作成（AI主導）
- プッシュ報告を受け、AI が `/complete` ワークフロー（前半）を使用して `gh pr create` を実行。

### Step 8. マージ（User）
- ユーザーが PR を **マージ**。

### Step 9. クリーンアップ（AI主導）
- マージ後、AI が `/complete` ワークフロー（後半）を使用して、以下の処理をユーザーに提案・代行する。
  1. `git checkout main`
  2. `git pull origin main`
  3. `git branch -d [branch-name]`
  4. `git remote prune origin`
