# ktlint

## 概要

- main ブランチへのプルリクエスト作成時に、Ktlint を実行してコードスタイルをチェックします。
- Ktlint の結果を Danger を使ってプルリクエストのコメントとして表示します。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/
    + ktlint.yml        # Ktlint を実行する GitHub Actions ワークフロー定義。
+ ci/
  + ktlint/
    + Dangerfile        # Danger を使ったコードレビュー支援の設定ファイル。
    + Gemfile           # Danger の依存関係を管理するファイル。
+ app/
  + build.gradle.kts    # Android アプリのビルド設定ファイル。
+ buld.gradle.kts       # プロジェクト全体のビルド設定ファイル。
```

## 設定方法

1. 上記ディレクトリ構成を維持したまま、ファイル(ktlint.yml, Dangerfile, Gemfile)をコピーしてください。
2. `/build.gradle.kts` に以下を追加します。
   ```kotlin
   plugins {
     // ... 省略
     id("org.jlleitschuh.gradle.ktlint") apply false
   }
   ```
3. `/app/build.gradle.kts` に以下を追加します。
   ```kotlin
   plugins {
     // ... 省略
     id("org.jlleitschuh.gradle.ktlint") version "13.1.0"
   }
   // ... 省略
   android {
     // ... 省略
     lint {
       xmlReport = true
       htmlReport = true
       checkReleaseBuilds = false
       abortOnError = false
     }
   }
   // ... 省略
   ktlint { 
     android = true
     outputToConsole = true
     verbose = true
     debug = true
     ignoreFailures = true
     reporters { 
       reporter(ReporterType.CHECKSTYLE)
     }
     filter {
       include("app/src/main/java/**")
     }
   }
   ```
4. .editorconfig ファイルに以下を追記します。
   ```text
   [*.{kt, kts}]
   indent_size = 4
   max_line_length = 100
   insert_final_newline = true
   ktlint_code_style = android_studio
   ktlint_function_naming_ignore_when_annotated_with = Composable
   ```

## 使い方

1. main ブランチへのプルリクエストを作成すると、Ktlint が自動的に実行されます。 
   - ローカルで実行する場合は、以下のコマンドで実行します。
     ```bash
     ./gradlew ktlintCheck
     ```
   - また、チェックだけでなく、自動修正も行いたい場合は以下のコマンドを実行します。
     ```bash
     ./gradlew ktlintFormat
     ```
