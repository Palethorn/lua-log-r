local ConsoleAppender = {}

ConsoleAppender.__index = ConsoleAppender

setmetatable(ConsoleAppender, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function ConsoleAppender:new()
    local self = setmetatable({}, ConsoleAppender)
    return self
end

function ConsoleAppender:append(string)
    print(string)
end

return ConsoleAppender