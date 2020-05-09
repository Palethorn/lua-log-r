local logger = require('lua-log-r.logger')
local appender = require('lua-log-r.appender.file')
local formatter = require('lua-log-r.formatter.json')

logr = logger:new(logger.DEBUG, appender:new('/tmp/test.json'), formatter:new())

logr:debug('Test')
