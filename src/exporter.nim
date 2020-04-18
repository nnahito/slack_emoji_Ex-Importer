import json
import nre
import os
import httpclient
import streams
import slack_emoji_ex_importer/emoji

# 絵文字リストを取得
var emojiListJson = emoji.getEmojiList()


# CSVに吐き出す
block:
    var f : File = open("emoji.csv" ,FileMode.fmWrite)
    defer :
        close(f)

    for item in emojiListJson["emoji"].pairs:
        let emojiName = item.key
        let emojiUrl = item.val.to(string)

        # http or httpsから始まっていなければ無視する
        if (emojiUrl.match(re"https?://[\w/:%#\$&\?\(\)~\.=\+\-]+").isNone == true):
            continue

        f.write(emojiName & "," & emojiUrl & "\n")

        # 拡張子の取得
        let (_, _, ext) = emojiUrl.splitFile

        # 画像データの保存
        discard existsOrCreateDir("./img")

        var client = newHttpClient()
        var response = client.get(emojiUrl)
        var f = newFileStream("./img/" & emojiName & ext, fmWrite)
        f.write(response.body)
        f.flush()

