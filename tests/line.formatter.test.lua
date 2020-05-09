Formatter = require("lua-log-r.formatter.line")
formatter = Formatter:new()
print(formatter:format({message = "test"}))