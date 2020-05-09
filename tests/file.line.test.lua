local logger = require('lua-log-r.logger')
local appender = require('lua-log-r.appender.file')
local formatter = require('lua-log-r.formatter.line')

logr = logger:new(logger.DEBUG, appender:new('/tmp/test.log'), formatter:new())

logr:debug('Test')
