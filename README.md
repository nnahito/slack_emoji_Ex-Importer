## これは？

SlackのAPIをNimで叩いてみたかったやつ。


## 必要なもの
- Nimが動く環境
- SlackのToken（read:emoji）
- webdriver .... https://github.com/dom96/webdriver/
- gecko（firefoxのレンダリングエンジン） ... https://github.com/mozilla/geckodriver/releases


## 必要情報の登録
`src/constant.example.nim`

　↓↓リネーム

`src/constant.nim`

あとはそのファイルを開いてそこに書いて。


## 実行

### Slackから絵文字を出力する

```
nim c -d:ssl -r exporter.nim
```

### Slackに絵文字を登録する

ちょっとややこい。

絵文字として登録したい画像ファイルを、imgフォルダに突っ込んでいく。

このときファイル名がslackの登録名になるので、登録できない文字列は含まないように注意する。

geckodriver.exe（Windows）を起動し、Nimのコードを実行する。

入れていなければWebdriverプラグインも入れる。

```
nimble install webdriver
```

↓　実行

```
nim c -r importer.nim
```

するとFirefoxが立ち上がり、絵文字の登録処理をし始めるので待つ。

以上