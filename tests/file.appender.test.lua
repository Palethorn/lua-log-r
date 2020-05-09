Appender = require("lua-log-r.appender.file")
appender = Appender:new("/tmp/lua.log")
appender:append("This line will appear in /tmp/lua.log")