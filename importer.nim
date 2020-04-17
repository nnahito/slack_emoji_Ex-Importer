import webdriver
import options
import os
import src/constant as constant

# OSの種類でファイルパスのデリミタが変わる
var delimiter = "/"
when defined windows:
    delimiter = "\\"
else:
    delimiter = "/"

# 現在のディレクトリ
let currentDir = getCurrentDir()

# WebDriver
var wDriver = newWebDriver()
var session = wDriver.createSession()

# 絵文字登録ページへアクセス
session.navigate(constant.SLACK_EMOJI_PAGE_URL)

# ログインフォームの要素取得
let email = session.findElement("#email")
let password = session.findElement("#password")
let submitButton = session.findElement("#signin_btn")

# emailの入力
email.get().sendKeys(constant.SLACK_LOGIN_MAILADDRESS)

# パスワードの入力
password.get().sendKeys(constant.SLACK_LOGIN_PASSWORD)

# ページのレンダリングが遅れることがあるので待ってみる。いい方法あったら教えて
sleep(2000)

# ログインボタン押下
submitButton.get().click()

# ページのレンダリングが遅れることがあるので待ってみる。いい方法あったら教えて
sleep(5000)

for f in walkDirRec("./img/"):
    # 画像ファイルまでの相対パスを取得し、ディレクトリ、ファイル名、拡張子に分ける
    let (dir, name, ext) = splitFile(f)  

    # 絵文字追加ボタン押下
    let addEmojiButton = session.findElement("button[data-qa=customize_emoji_add_button]")
    addEmojiButton.get().click()

    # 絵文字の追加
    let addEmojiFile = session.findElement("#emojiimg")
    let emojiPath = currentDir & delimiter & dir & delimiter & name & ext       # 絵文字ファイル（画像ファイル）のフルパスを作成
    addEmojiFile.get().sendKeys(emojiPath)

    # 絵文字名の追加
    let addEmojiName = session.findElement("#emojiname")
    addEmojiName.get().sendKeys(name)

    # 絵文字の追加ボタンを押下
    let addEmojiGoButton = session.findElement("button[data-qa=customize_emoji_add_dialog_go]")
    addEmojiGoButton.get().click()

    # 絵文字登録処理に時間がかかる時があるので待ってみる。いい方法あったら教えて
    sleep(3000)
