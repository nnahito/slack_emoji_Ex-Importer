import constant
import slack_request
import json
import os

proc getEmojiList*(): JsonNode =
    ##
    ## Slackから絵文字リストを取得します
    ##
    ## @return JsonNode SlackからのレスポンスJSONをNimのJsonNodeに変換したものが返ります

    return parseJson(slack_request.get(constant.GET_SLACK_EMOJI_API_URL & "?token=" & constant.SLACK_TOKEN))
