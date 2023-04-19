Item = {}

function Item:new(name, model)
    local item = {}
    setmetatable(item, self)
    self.__index = self
    self.name = name
    self.model = model
    return item
end