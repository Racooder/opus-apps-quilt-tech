local Lora = require('lora')
local Util = require('util')

local Autocraft = {
  priority = 100,
}

function Autocraft:cycle(context)
  local list = { }

  for _,res in pairs(context.resources) do
    if res.auto then
      res = Util.shallowCopy(res)
      res.count = 256
      list[Lora:uniqueKey(res)] = res
    end
  end

  if not Util.empty(list) then
    Lora:craftItems(list)
  end
end

Lora:registerTask(Autocraft)
