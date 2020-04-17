#
# SLackのトークン。公開注意！！
# @See https://qiita.com/ykhirao/items/3b19ee6a1458cfb4ba21
#
const SLACK_TOKEN* = "xxxxxxxxxxxxxxxxxxxxxxx"


#
# 絵文字一括登録先のSlackログイン情報
# Slackの絵文字登録APIはエンタープライズ版しか利用できないので、WebDriverで無理やり登録する
#
const SLACK_EMOJI_PAGE_URL* = "https://XXXXXXXXXXXXX.slack.com/customize/emoji"         # 絵文字登録ページのURL
const SLACK_LOGIN_MAILADDRESS* = "mail@example.com"         # Slackにログインするメールアドレス
const SLACK_LOGIN_PASSWORD* = "password"        # Slackにログインするパスワード


#
# SlackのAPIの定義
#
const GET_SLACK_EMOJI_API_URL* = "https://slack.com/api/emoji.list"          # @see https://api.slack.com/methods/emoji.list
const ADD_SLACK_EMOJI_API_URL* = "https://slack.com/api/admin.emoji.add"     # @see https://api.slack.com/methods/admin.emoji.add