# build-aab

## 概要

- "v1.0.0" のように "v" で始まるタグを付けると、そのバージョンの AAB がビルドされて GitHub のリリースページにアップロードされます。

## ディレクトリ・ファイル構成

```text
+ .github/
  + workflows/
    + build-aab.yml     # AAB ビルドとリリースを実行する GitHub Actions ワークフロー定義。
+ app/
  + build.gradle.kts    # Android アプリのビルド設定ファイル。
+ buld.gradle.kts       # プロジェクト全体のビルド設定ファイル。
```

## 使い方

1. 上記ディレクトリ構成を維持したまま、ファイル(build-aab.yml)をコピーする。
2. GitHub のリポジトリに対する設定で、Secrets に以下を追加する。
   - `KEYSTORE_BASE64`
     - キーストアファイルを Base64 エンコードした文字列
   - `KEYSTORE_PROPERTIES`
       ```text
       storeFile=keystore.jks
       storePassword=キーストアのパスワード
       keyAlias=キーペアのエイリアス
       keyPassword=キーペアのパスワード
       ```
3. アプリの `build.gradle.kts` に以下を追加する。

   ```kotlin
   android {
     // ... 省略
     signingConfigs {
       create("release") {
         val propsFile = rootProject.file("keystore.properties")
         if (propsFile.exists()) {
           val props =
             Properties().apply {
               load(FileInputStream(propsFile))
             }
           storeFile = rootProject.file(props["storeFile"] as String)
           storePassword = props["storePassword"] as String
           keyAlias = props["keyAlias"] as String
           keyPassword = props["keyPassword"] as String
         } else {
           println("⚠️ keystore.properties not found, skipping signingConfig setup")
         }
       }
     }
     // ... 省略
     buildTypes {
       // ... 省略
       release {
         val propsFile = rootProject.file("keystore.properties")
         if (propsFile.exists()) {
           signingConfig = signingConfigs.getByName("release")
         } else {
           println("⚠️ keystore.properties not found, skipping signingConfig assignment")
         }
         // ... 省略
       }
     }
   }
   ```

4. ローカルでビルドできるように、プロジェクトルートに、 'keystore.jks' と 'keystore.properties' を配置する。
   - (重要)ただし、これらのファイルは Git 管理下に置かないように、`.gitignore` に追加しておくこと。
   - キーストアファイルは Base64 エンコードする前のものを keystore.jks として配置する。
   - keystore.properties の中身は、上記 `KEYSTORE_PROPERTIES` と同じものを配置する。
