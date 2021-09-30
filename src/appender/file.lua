local FileAppender = { file = {} }

FileAppender.__index = FileAppender

setmetatable(FileAppender, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function FileAppender:new(log_file)
    local self = setmetatable({}, FileAppender)
    assert(nil ~= log_file, 'Log filename not provided')
    assert('string' == type(log_file), 'log_file argument is not a string')
    self.file = io.open(log_file, "a")
    assert(self.file ~= nil and self.file.setvbuf ~= nil, 'Unable to open log file ' .. log_file)
    self.file:setvbuf('line')
    return self
end

function FileAppender:append(string)
    self.file:write(string.format("%s\n", string))
end

return FileAppender