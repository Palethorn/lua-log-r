local Logger = { 
    level = 3, 
    appender = {}, 
    formatter = {}, 
    levels = { "DEBUG", "INFO", "WARN", "ERROR", "FATAL" },
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
    FATAL = 5
}

Logger.__index = Logger

setmetatable(Logger, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function Logger:new(level, appender, formatter)
    local self = setmetatable({}, Logger)
    self.level = level
    self.appender = appender
    self.formatter = formatter
    return self
end

function Logger:log(level, message, context, extra)
    if level < self.level then
        return
    end

    local record = {}
    record.extra = extra
    record.context = context
    record.level = tostring(Logger.levels[level])
    record['@timestamp'] = os.date('%Y-%m-%d %H:%M:%S')
    record.message = message
    
    self.appender:append(
        self.formatter:format(record)
    )
end

function Logger:debug(message, context, extra)
    self:log(Logger.DEBUG, message, context, extra)
end

function Logger:info(message, context, extra)
    self:log(Logger.INFO, message, context, extra)
end

function Logger:warn(message, context, extra)
    self:log(Logger.WARN, message, context, extra)
end

function Logger:error(message, context, extra)
    self:log(Logger.ERROR, message, context, extra)
end

function Logger:fatal(message, context, extra)
    self:log(Logger.FATAL, message, context, extra)
end

return Logger