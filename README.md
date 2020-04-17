## これは何？

Slackの絵文字（スタンプ）をいっぱい追加したいけど、  
手動で追加するのめちゃくちゃ面倒だなー。  
あーNim書きたいなー。  
ってときに作ってみたやつ。

Slackのカスタムスタンプの出力と、  
カスタムスタンプの一括登録ができます。


## 必要なもの

- Nimが動作する環境
    - 公式では[Choosenim](https://github.com/dom96/choosenim/releases)を推奨している。
    - が、Macでは`brew install nim`で入れることもできる
    - Windowsでは、`scoop install nim`で入れることができる。
    - Linuxではそれぞれのパッケージツールで入れることができる。アーチリナックスではchoosenimも配布されていた。すげえわ。
- SlackのToken（read:emoji）
- gecko（firefoxのレンダリングエンジン）
    - これは自分で落としてください
    - https://github.com/mozilla/geckodriver/releases


## 事前準備

### 上記「必要なもの」に書いたもの

- Nim本体
- gecko（ https://github.com/mozilla/geckodriver/releases ）


### Slackのアクセス情報

- src/slack_emoji_ex_importerフォルダ配下の「constant.example.nim」を「constant.nim」にリネーム
- constant.nimの中の情報を書き換える


## Slackに登録済みの絵文字を全部引っ張り出す

```
nimble run exporter
# あるいは
nimble build && ./bin/exporter
```

imgフォルダが作られそこに全部収納されます。  
「emoji.csv」というファイルに、絵文字の登録名とSlackのアップロード先URLのリストも出力されます。


## Slackに絵文字を一括登録する

### 事前準備

1. imgフォルダをなければ作る
1. imgフォルダの中に登録したい絵文字ファイルを、ファイル名にSlackの絵文字登録名をつけて追加していく
1. geckodriverを起動。Windowsだとexeのダブルクリックで起動する。起動したらコンソールが立ち上がるだけで、特に何も起きない


### 実行

```
nimble run importer
# あるいは
nimble build && ./bin/importer
```

するとFirefoxが立ち上がり、絵文字の登録処理をし始めるので待つ。

以上

## 参考

- webdriver .... https://github.com/dom96/webdriver/
    - Nimインストール後、nimのパッケージ管理ツール（Pythonのpipみたいなの）で入れれる
    - `nimble install webdriver`
