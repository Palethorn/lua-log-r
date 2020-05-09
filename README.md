# INSTALL #

```
luarocks install lua-log-r
```

or

```
git clone https://github.com/Palethorn/lua-log-r.git
cd lua-log-r
luarocks make
```

# Arguments #

```
logr = new logger(level, appender, formatter)
```

level - Log level, range 1-5 (DEBUG, INFO, WARN, ERROR, FATAL)
appender - Handles output
formatter - Formats output

# Example #

```
Logger = require("lua-log-r.logger")
Appender = require("lua-log-r.appender.console")
Formatter = require("lua-log-r.formatter.json")

logr = Logger:new(logger.DEBUG, Appender:new(), Formatter:new())
```

# Supported Appenders #

lua-log-r.appender.null - Redirects output to void
lua-log-r.appender.file - Appends output to file
lua-log-r.appender.console - Appends output to stdout

## Null Appender ##

```
Appender = require("lua-log-r.appender.null")
appender = Appender:new()
appender:append("this will not appear anywhere")
```

## File Appender ##

```
Appender = require("lua-log-r.appender.file")
appender = Appender:new("/tmp/lua.log")
appender:append("This line will appear in /tmp/lua.log")
```

## Console Appender ##

```
Appender = require("lua-log-r.appender.console")
appender = Appender:new()
appender:append("This line will be printed in console")
```

## Supported Formatters ##

## Json Formatter ##

```
Formatter = require("lua-log-r.formatter.json")
formatter = Formatter:new()
print(formatter:format({message = "test"}))
-- Output: {"message":"test"}
```

## Line Formatter ##

```
Formatter = require("lua-log-r.formatter.line")
formatter = Formatter:new()
print(formatter:format({message = "test"}))
-- Output: message: test
```
