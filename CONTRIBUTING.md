# 開発・貢献ガイドライン

このプロジェクト（テンプレート）を利用した開発における、バージョン管理とリリースプロセスの運用ルールについて説明します。

## リリースとバージョン管理

本リポジトリでは **Release Drafter** を導入しており、Pull Request (PR) の運用に基づいて自動的にリリースノートの作成とバージョン番号の採番が行われます。

### バージョニングの仕組み

PR に付与された**ラベル**に応じて、次のバージョン番号が自動的に決定されます。
判定ロジックは厳密に以下の設定に基づきます（`release-drafter.yml` 準拠）。

1. **Major Update** (A.x.x → B.0.0)
    - 以下のいずれかのラベルが含まれる場合：
        - `major`
        - `breaking`

2. **Minor Update** (x.B.x → x.C.0)
    - Major 該当ラベルがなく、以下のいずれかのラベルが含まれる場合：
        - `minor`
        - `feature`
        - `enhancement`

3. **Patch Update** (x.x.C → x.x.D)
    - Major/Minor 該当ラベルがいずれも含まれない場合（デフォルト動作）。
    - メンテナンスやバグ修正系のラベルが含まれる場合：
        - `fix`
        - `bug`
        - `chore`
        - `documentation`
        - `maintenance`
        - `refactor`
        - `style`
        - `test`

### リリース手順

1. **Pull Request (PR) の作成**
    - 開発用ブランチから `main` ブランチへ PR を作成します。
    - PR の内容に合わせて適切なラベル（`feature`, `bug` など）を付与します。

2. **マージ (Merge)**
    - PR が `main` にマージされると、GitHub Actions が走り、**Draft Release**（下書き状態のリリース）が作成・更新されます。
    - この時点では `version.properties` はまだ更新されません。

3. **バージョンの更新 (Bump Version)**
    - リリース準備が整ったら、GitHub Actions タブから **"Bump Version"** ワークフローを手動実行します。
    - `increment_type` を `auto` にすると、Draft Release の名前（`vX.Y.Z`）を自動取得して `version.properties` を更新します。
    - ワークフローを実行すると、バージョン更新用の **Pull Request** が作成されます。内容を確認してマージしてください。

4. **リリースの公開 (Publish)**
    - GitHub の "Releases" ページから生成された Draft を開き、"Publish release" をクリックして正式にリリースします。
    - これにより `vX.Y.Z` のタグが Git に打たれます。
