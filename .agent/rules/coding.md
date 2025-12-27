# コーディング規約

## Kotlin & Android
- UI 実装には Jetpack Compose を使用してください。
- Kotlin の標準的なコーディング規約に従ってください。
- 依存関係の管理には Gradle を使用してください。

## 実装後の検証と報告ルール
コーディング作業を完了し、ユーザーに報告（または `/save` 等でタスクを完了）する前に、必ず以下のチェックをパスさせてください。

### 必須の検証チェック項目
1. **ビルド確認**: `./gradlew assembleDebug` を実行し、ビルドエラーが起きないことを確認する。
2. **静的解析・整形**: `./gradlew ktlintFormat` を実行し、ktlint による警告のうち自動修正できるものをすべて修正する。

いずれかのコマンドが失敗、または警告が残る場合は、問題を解決してから再確認し、すべてパスするまで繰り返してください。
全ての検証をパスしてから、ユーザーに進捗や完了を報告してください。

### 検証に使用するコマンド（SafeToAutoRun）
以下のコマンドは、検証のためにユーザーの承認なしに実行できます（SafeToAutoRun: true）:
- `./gradlew assembleDebug`
- `./gradlew ktlintFormat`
- `./gradlew ktlintCheck`
- `./gradlew koverXmlReport`
