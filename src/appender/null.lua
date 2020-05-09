local NullAppender = {}

NullAppender.__index = NullAppender

setmetatable(NullAppender, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function NullAppender:new()
    local self = setmetatable({}, NullAppender)
    return self
end

function NullAppender:append(string)

end

return NullAppender