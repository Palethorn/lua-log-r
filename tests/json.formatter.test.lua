Formatter = require("lua-log-r.formatter.json")
formatter = Formatter:new()
print(formatter:format({message = "test"}))