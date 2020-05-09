local logger = require('lua-log-r.logger')
local appender = require('lua-log-r.appender.console')
local formatter = require('lua-log-r.formatter.line')

logr = logger:new(logger.DEBUG, appender:new(), formatter:new())

logr:debug('Test')
