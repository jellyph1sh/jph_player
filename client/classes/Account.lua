Account = {balance = 0}

function Account:new(balance)
    local account = {}
    setmetatable(account, self)
    self.__index = self
    self.balance = balance
    return account
end

function Account:widthraw(amount)
    self.balance = self.balance - amount
end

function Account:deposit(amount)
    self.balance = self.balance + amount
end

function Account:transfer(targetAccount, amount)
    self:widthraw(amount)
    targetAccount:deposit(amount)
end