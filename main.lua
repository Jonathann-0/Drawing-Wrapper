if not Drawing or Drawing.__CONTAINER or getmetatable(Drawing) ~= nil then 
    return
end

Drawing = setmetatable(Drawing, {
    __index = function(self, i)
        if i:lower() == 'clear' then
            return function()
                for i, shape in pairs(self.__CONTAINER) do
                    if shape.__OBJECT_EXISTS == true then
                        shape:Remove()
                    else
                        table.remove(self.__CONTAINER, i)
                    end
                end
                if self.Length > 0 then
                    self:Clear()
                end
                return self;
            end
        elseif i:lower() == 'length' then
            return #self.__CONTAINER
        end
        return nil
    end
})

Drawing.__CONTAINER = {}

local pseudoLine = Drawing.new("Line")
local metadata = getmetatable(pseudoLine)
local oldIndex = metadata.__index
pseudoLine:Remove()

metadata.__index = function(self, i)
    if i:lower() == 'remove' or i:lower() == 'delete' or i:lower() == 'destroy' then
        local index = table.find(Drawing.__CONTAINER, self)
        if index ~= nil then
            table.remove(Drawing.__CONTAINER, index)
        end
        i = 'Remove'
    elseif i:lower() == 'set' then
        return function(s, key, value)
            if s ~= self then
                return error("You called method 'set' incorrectly.")
            end
            return rawset(self, key, value)
        end
    elseif i:lower() == 'has' then
        return function(s, key)
            if s ~= self then
                return error("You called method 'has' incorrectly.")
            end
            return not (rawget(self, key) == nil)
        end
    end
    return oldIndex(self, i)
end

local func;
func = hookfunction(Drawing.new, function(str)
    local shape = func(str);
    table.insert(Drawing.__CONTAINER, shape)
    return shape
end)
