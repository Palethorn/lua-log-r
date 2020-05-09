local LineFormatter = {}

LineFormatter.__index = LineFormatter

setmetatable(LineFormatter, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function LineFormatter:new()
    local self = setmetatable({}, LineFormatter)
    return self
end

function LineFormatter:format(object)
    local line = ''

    if object == nil then
        return nil
    end

    if type(object) == 'string' then
        return object
    end

    if type(object) == 'number' then
        return tostring(object)
    end

    for k, v in pairs(object) do
        
        if type(v) == 'table' then
            formatted_v = self:format(v)
            line = string.format('%s{ %s: { %s } } ', line, k, formatted_v)
        else
            line = string.format('%s%s: %s ', line, k, tostring(v))
        end
    end

    return line:sub(1, -2)
end

return LineFormatter