local Ansi       = require('ansi')
local UI         = require('ui')

local colors     = _G.colors
local device     = _G.device

--[[ Configuration Screen ]]
local template =
[[%sInput Chest%s

Any items placed in this chest will be imported into storage.
]]

local inputChestWizardPage = UI.Window {
  title = 'Input Chest',
  index = 2,
  backgroundColor = colors.cyan,
  [1] = UI.TextArea {
    x = 2, ex = -2, y = 2, ey = -2,
    value = string.format(template, Ansi.yellow, Ansi.reset),
  },
}

function inputChestWizardPage:isValidType(node)
  local m = device[node.name]
  return m and m.pullItems and {
    name = 'Input Chest',
    value = 'input',
    help = 'Sends all items to storage',
  }
end

function inputChestWizardPage:isValidFor(node)
  return node.mtype == 'input'
end

UI:getPage('nodeWizard').wizard:add({ inputChest = inputChestWizardPage })
