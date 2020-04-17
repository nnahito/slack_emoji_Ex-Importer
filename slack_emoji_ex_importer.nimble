# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["exporter", "importer"]
binDir        = "bin"


# Dependencies

requires "nim >= 1.2.0"
requires "webdriver#429933a3d44d8be86d4b3986cf6b9632ca1d4cb8"
