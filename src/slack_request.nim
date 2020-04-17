import httpClient

proc get*(url: string): string =
    ##
    ## GETアクセスを行います
    ##
    ## @param url string アクセスしたいエンドポイント
    ## @return string 取得結果

    var client = newHttpClient()
    client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded"})

    return client.getContent(url)