# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["exporter", "importer"]
binDir        "bin"


# Dependencies

requires "nim >= 1.2.0"
