local FileAppender = { file = {} }

FileAppender.__index = FileAppender

setmetatable(FileAppender, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function FileAppender:new(log_file)
    local self = setmetatable({}, FileAppender)
    self.file = io.open(log_file, "a")

    if self.file then
        self.file:setvbuf('line')
    end

    return self
end

function FileAppender:append(string)
    self.file:write(string.format("%s\n", string))
end

return FileAppender