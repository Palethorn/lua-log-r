json = require "json"
local JsonFormatter = {}

JsonFormatter.__index = JsonFormatter

setmetatable(JsonFormatter, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function JsonFormatter:new()
    local self = setmetatable({}, JsonFormatter)
    return self
end

function JsonFormatter:format(object)
    return json.encode(object)
end

return JsonFormatter