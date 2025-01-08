# ktlint

## ファイル構成

```text
+ /
  + .github/
    + workflows/
      + ktlint.yml
  + ci/
    + ktlint/
      + Dangerfile
      + Gemfile
```

## 必要な設定

* GitHub Actions で実行する Danger が Pull request コメントを書き込むために権限が必要。

```text
+ Settings
  + Code and automation
    + General
      + Workflow permissions
        + Read and write permissions にチェックを入れる
```
