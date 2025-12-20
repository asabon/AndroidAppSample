# 検証ルール

## 自動検証（SafeToAutoRun）
- 以下のコマンドは、ユーザーの承認なしに実行できます（SafeToAutoRun: true）:
  - ./gradlew assembleDebug
  - ./gradlew ktlintFormat
  - ./gradlew ktlintCheck
  - ./gradlew koverXmlReport

## 必須の検証手順
- コーディング作業を完了し、ユーザーに報告する前に、必ず以下のチェックをパスさせてください:
  1. ./gradlew assembleDebug を実行し、ビルドエラーが起きないことを確認する。
  2. ./gradlew ktlintFormat を実行し、ktlint による警告のうち自動修正できるものをすべて修正する。
- いずれかのコマンドが失敗、または警告が残る場合は、問題を解決してから再確認し、すべてパスするまで繰り返してください。
