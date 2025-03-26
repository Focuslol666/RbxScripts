-- 示例脚本由 https://github.com/mstudio45/LinoriaLib/blob/main/Example.lua 修改而来，由 deivid 修改
-- 您可以通过 Pull Request 等方式提交修改建议

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false -- 强制将 AddToggle 转为 AddCheckbox
Library.ShowToggleFrameInKeybinds = true -- 让切换键位在键位界面内生效（即在界面中添加切换控件），对移动端用户友好（默认值 = true）

local Window = Library:CreateWindow({
	-- 设置为 true 使菜单居中显示
	-- 设置为 true 使创建时自动显示菜单
	-- 设置为 true 允许在游戏中调整窗口大小
	-- 设置为 "Left" 或 "Right" 控制 UI 切换和锁定按钮的位置
	-- 设置为 false 禁用自定义光标
	-- NotifySide = 设置通知位置（左/右）（默认值 = 左）
	-- 也可以在此定义 Position 和 Size 参数，但不需要主动设置

	Title = "Obsidian UI",
	Footer = "版本: 示例",
	Icon = 4483362458,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

-- 回调说明：
-- 通过初始参数传递回调函数（即 Callback = function(Value)...）是可行的
-- 但推荐使用 Toggles/Options.INDEX:OnChanged(function(Value) ... ) 的方式
-- 建议将 UI 代码与逻辑代码解耦。即先创建 UI 元素，再设置 :OnChanged 函数

-- 以下方式仅为组织标签和分组的示例，非强制要求
-- 图标资源：https://lucide.dev/
local Tabs = {
	-- 创建名为 Main 的标签页
	Main = Window:AddTab("Main", "user"),
	Key = Window:AddKeyTab("密钥系统"),
	["UI Settings"] = Window:AddTab("UI 设置", "settings"),
}


--[[
为标签页添加警告框的示例（标题和文本支持富文本格式）：

local WarningTab = Tabs["UI Settings"]:AddTab("警告框", "user")

WarningTab:UpdateWarningBox({
	Visible = true,
	Title = "警告",
	Text = "这是一个警告框！",
})

]]

-- Groupbox 和 Tabbox 继承相同方法
-- Tabbox 需要在标签页上调用方法（Tabbox:AddTab(name)）
local LeftGroupBox = Tabs.Main:AddLeftGroupbox("分组框")

-- 也可以通过以下代码获取 Main 标签页：
-- local LeftGroupBox = Window.Tabs.Main:AddLeftGroupbox('分组框')

-- Tabbox 基本示例：
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- 在左侧添加 Tabbox

local Tab1 = TabBox:AddTab('标签页 1')
local Tab2 = TabBox:AddTab('标签页 2')

-- 可在标签页上调用 AddToggle 等方法
]]

-- Groupbox:AddToggle
-- 参数：索引, 选项
LeftGroupBox:AddToggle("MyToggle", {
	Text = "这是一个切换开关",
	Tooltip = "悬停提示", -- 悬停时显示的提示信息
	DisabledTooltip = "我已禁用！", -- 禁用状态下的提示信息

	Default = true, -- 默认值（true / false）
	Disabled = false, -- 禁用开关（true / false）
	Visible = true, -- 隐藏开关（true / false）
	Risky = false, -- 文字显示为红色（可通过 Library.Scheme.Red 修改颜色）（默认值 = false）

	Callback = function(Value)
		print("[cb] MyToggle 已修改为:", Value)
	end,
})
	:AddColorPicker("ColorPicker1", {
		Default = Color3.new(1, 0, 0),
		Title = "颜色选择器1", -- 可选，颜色选择器标题
		Transparency = 0, -- 可选，启用透明度调整（设为 nil 禁用）

		Callback = function(Value)
			print("[cb] 颜色已修改！", Value)
		end,
	})
	:AddColorPicker("ColorPicker2", {
		Default = Color3.new(0, 1, 0),
		Title = "颜色选择器2",

		Callback = function(Value)
			print("[cb] 颜色已修改！", Value)
		end,
	})

-- 获取切换开关对象供后续使用：
-- Toggles.MyToggle.Value

-- Toggles 是通过库注入到全局环境的表
-- 通过指定索引（如 'MyToggle'）获取对象
-- 获取状态使用 toggle.Value

-- 当切换开关状态变化时触发回调
Toggles.MyToggle:OnChanged(function()
	print("MyToggle 已修改为:", Toggles.MyToggle.Value)
end)

-- 控制台应输出："My toggle state changed! New value: false"
Toggles.MyToggle:SetValue(false)

LeftGroupBox:AddCheckbox("MyCheckbox", {
	Text = "这是一个复选框",
	Tooltip = "悬停提示", -- 悬停时显示的提示信息
	DisabledTooltip = "我已禁用！", -- 禁用状态下的提示信息

	Default = true, -- 默认值（true / false）
	Disabled = false, -- 禁用复选框（true / false）
	Visible = true, -- 隐藏复选框（true / false）
	Risky = false, -- 文字显示为红色（默认值 = false）

	Callback = function(Value)
		print("[cb] MyCheckbox 已修改为:", Value)
	end,
})

Toggles.MyCheckbox:OnChanged(function()
	print("MyCheckbox 已修改为:", Toggles.MyCheckbox.Value)
end)

-- 2023年1月15日更新
-- 弃用旧版按钮创建方式，改用表结构
-- 新增双击按钮功能

--[[
	Groupbox:AddButton
	参数：{
		Text = 文本,
		Func = 函数,
		DoubleClick = 是否双击
		Tooltip = 提示,
	}

	可通过 :AddButton 添加子按钮
]]

local MyButton = LeftGroupBox:AddButton({
	Text = "按钮",
	Func = function()
		print("你点击了按钮！")
	end,
	DoubleClick = false,

	Tooltip = "主按钮提示",
	DisabledTooltip = "我已禁用！",

	Disabled = false, -- 禁用按钮（true / false）
	Visible = true, -- 隐藏按钮（true / false）
	Risky = false, -- 文字显示为红色（默认值 = false）
})

local MyButton2 = MyButton:AddButton({
	Text = "子按钮",
	Func = function()
		print("你点击了子按钮！")
	end,
	DoubleClick = true, -- 需双击触发回调
	Tooltip = "子按钮提示",
	DisabledTooltip = "我已禁用！",
})

local MyDisabledButton = LeftGroupBox:AddButton({
	Text = "禁用按钮",
	Func = function()
		print("你竟然点击了禁用按钮！")
	end,
	DoubleClick = false,
	Tooltip = "禁用按钮提示",
	DisabledTooltip = "我已禁用！", -- 禁用状态提示
	Disabled = true,
})

--[[
	注：可链式调用按钮方法！
	示例：

	LeftGroupBox:AddButton({ Text = '杀死全部', Func = Functions.KillAll, Tooltip = '杀死游戏中所有玩家！' })
		:AddButton({ Text = '踢出全部', Func = Functions.KickAll, Tooltip = '踢出游戏中所有玩家！' })
]]

-- Groupbox:AddLabel
-- 参数：文本, 是否换行, 索引
-- 或使用表结构：索引, 选项
LeftGroupBox:AddLabel("这是一个标签")
LeftGroupBox:AddLabel("这是一个自动换行的标签！\n\n支持多行文本！", true)
LeftGroupBox:AddLabel("暴露给 Labels 的标签", true, "TestLabel")
LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "使用表结构并指定索引的标签",
	DoesWrap = true, -- 默认 false
})

LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "不换行的标签",
	DoesWrap = false, -- 默认 false
})

-- Options 是通过库注入到全局环境的表
-- 通过索引（如 'SecondTestLabel' 和 'TestLabel'）访问标签对象
-- 设置标签文本：label:SetText

-- Options.TestLabel:SetText("第一次修改！")
-- Options.SecondTestLabel:SetText("第二次修改！")

-- Groupbox:AddDivider
-- 无参数
LeftGroupBox:AddDivider()

--[[
	Groupbox:AddSlider
	参数：索引, 滑块选项

	滑块选项：{
		Text = 文本,
		Default = 默认值,
		Min = 最小值,
		Max = 最大值,
		Suffix = 单位后缀,
		Rounding = 小数位数,
		Compact = 紧凑模式,
		HideMax = 隐藏最大值,
	}

	Text, Default, Min, Max, Rounding 必须指定
	Suffix 可选
	Rounding 控制小数点精度

	Compact 隐藏滑块标题
	HideMax 仅显示当前值
]]
LeftGroupBox:AddSlider("MySlider", {
	Text = "这是一个滑块！",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
		print("[cb] MySlider 已修改！新值:", Value)
	end,

	Tooltip = "滑块提示", -- 悬停提示
	DisabledTooltip = "我已禁用！", -- 禁用提示

	Disabled = false, -- 禁用滑块（true / false）
	Visible = true, -- 隐藏滑块（true / false）
})

-- 通过 Options 表访问滑块对象
-- 获取值：slider.Value

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
	print("MySlider 已修改！新值:", Options.MySlider.Value)
end)

-- 控制台应输出："MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)

-- Groupbox:AddInput
-- 参数：索引, 信息
LeftGroupBox:AddInput("MyTextbox", {
	Default = "我的文本框！",
	Numeric = false, -- 仅允许数字输入
	Finished = false, -- 仅在按下回车时触发回调
	ClearTextOnFocus = true, -- 聚焦时清空文本

	Text = "文本框标题",
	Tooltip = "文本框提示", -- 悬停提示

	Placeholder = "占位文本", -- 空内容时的提示文本
	-- MaxLength 可限制最大长度

	Callback = function(Value)
		print("[cb] 文本已更新。新内容:", Value)
	end,
})

Options.MyTextbox:OnChanged(function()
	print("文本已更新。新内容:", Options.MyTextbox.Value)
end)

-- Groupbox:AddDropdown
-- 参数：索引, 信息

local DropdownGroupBox = Tabs.Main:AddRightGroupbox("下拉菜单")

DropdownGroupBox:AddDropdown("MyDropdown", {
	Values = { "选项1", "选项2", "选项3", "选项4" },
	Default = 1, -- 默认索引或字符串值
	Multi = false, -- 是否允许多选

	Text = "下拉菜单标题",
	Tooltip = "下拉菜单提示", -- 悬停提示
	DisabledTooltip = "我已禁用！", -- 禁用提示

	Searchable = false, -- 是否可搜索（长列表时推荐）

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = false, -- 禁用下拉菜单（true / false）
	Visible = true, -- 隐藏下拉菜单（true / false）
})

Options.MyDropdown:OnChanged(function()
	print("下拉菜单已修改。新值:", Options.MyDropdown.Value)
end)

Options.MyDropdown:SetValue("This")

DropdownGroupBox:AddDropdown("MySearchableDropdown", {
	Values = { "可搜索", "下拉", "菜单", "示例" },
	Default = 1, 
	Multi = false, 

	Text = "可搜索下拉菜单",
	Tooltip = "下拉菜单提示", 
	DisabledTooltip = "我已禁用！", 

	Searchable = true, 

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = false, 
	Visible = true, 
})

DropdownGroupBox:AddDropdown("MyDisplayFormattedDropdown", {
	Values = { "格式化", "显示", "示例" },
	Default = 1, 

	Text = "自定义显示格式的下拉菜单",
	Tooltip = "下拉菜单提示", 

	FormatDisplayValue = function(Value) -- 自定义显示值（实际值不变）
		if Value == "格式化" then
			return "显示格式化" -- 显示为"显示格式化"，实际值仍为"格式化"
		end
		return Value
	end,

	Searchable = false, 

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = false, 
	Visible = true, 
})

-- 多选下拉菜单
DropdownGroupBox:AddDropdown("MyMultiDropdown", {
	Values = { "多选1", "多选2", "多选3" },
	Default = 1,
	Multi = true, -- 允许多选

	Text = "多选下拉菜单",
	Tooltip = "下拉菜单提示", 

	Callback = function(Value)
		print("[cb] 多选下拉修改:")
		for key, value in next, Options.MyMultiDropdown.Value do
			print(key, value) -- 输出类似 多选1, true
		end
	end,
})

Options.MyMultiDropdown:SetValue({
	This = true,
	is = true,
})

DropdownGroupBox:AddDropdown("MyDisabledDropdown", {
	Values = { "禁用选项", "示例" },
	Default = 1, 
	Multi = false, 

	Text = "禁用的下拉菜单",
	Tooltip = "下拉菜单提示", 
	DisabledTooltip = "我已禁用！", 

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = true, -- 禁用
	Visible = true, 
})

DropdownGroupBox:AddDropdown("MyDisabledValueDropdown", {
	Values = { "正常选项", "禁用选项" },
	DisabledValues = { "禁用选项" }, -- 禁用特定选项
	Default = 1, 

	Text = "含禁用值的下拉菜单",
	Tooltip = "下拉菜单提示", 

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = false, 
	Visible = true, 
})

DropdownGroupBox:AddDropdown("MyVeryLongDropdown", {
	Values = {
		"很长", "的", "下拉菜单", "选项", 
		"超过", "8", "个", "示例", "需要", "滚动条"
	},
	Default = 1, 

	MaxVisibleDropdownItems = 12, -- 默认显示 8 项，可调整

	Text = "长列表下拉菜单",
	Tooltip = "下拉菜单提示", 

	Searchable = false, 

	Callback = function(Value)
		print("[cb] 下拉菜单已修改。新值:", Value)
	end,

	Disabled = false, 
	Visible = true, 
})

DropdownGroupBox:AddDropdown("MyPlayerDropdown", {
	SpecialType = "Player", -- 特殊类型：玩家列表
	ExcludeLocalPlayer = true, -- 排除本地玩家
	Text = "玩家下拉菜单",
	Tooltip = "下拉菜单提示", 

	Callback = function(Value)
		print("[cb] 玩家下拉修改:", Value)
	end,
})

DropdownGroupBox:AddDropdown("MyTeamDropdown", {
	SpecialType = "Team", -- 特殊类型：队伍列表
	Text = "队伍下拉菜单",
	Tooltip = "下拉菜单提示", 

	Callback = function(Value)
		print("[cb] 队伍下拉修改:", Value)
	end,
})

-- Label:AddColorPicker
-- 参数：索引, 信息

LeftGroupBox:AddLabel("颜色选择器"):AddColorPicker("ColorPicker", {
	Default = Color3.new(0, 1, 0), -- 亮绿色
	Title = "颜色选择器标题", -- 可选标题
	Transparency = 0, -- 允许调整透明度

	Callback = function(Value)
		print("[cb] 颜色已修改！", Value)
	end,
})

Options.ColorPicker:OnChanged(function()
	print("颜色已修改:", Options.ColorPicker.Value)
	print("透明度已修改:", Options.ColorPicker.Transparency)
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

-- Label:AddKeyPicker
-- 参数：索引, 信息

LeftGroupBox:AddLabel("快捷键"):AddKeyPicker("KeyPicker", {
	Default = "MB2", -- 默认键位（MB1/MB2 为鼠标按键）
	SyncToggleState = false, -- 是否与切换开关状态同步

	Mode = "Toggle", -- 模式：Always（始终触发）、Toggle（切换）、Hold（按住）

	Text = "自动解锁保险箱", -- 键位菜单显示文本
	NoUI = false, -- 是否在键位菜单隐藏

	Callback = function(Value)
		print("[cb] 快捷键点击！", Value)
	end,

	ChangedCallback = function(New)
		print("[cb] 快捷键修改！", New)
	end,
})

-- OnClick 仅在 Toggle 模式下点击时触发
Options.KeyPicker:OnClick(function()
	print("快捷键点击！当前状态:", Options.KeyPicker:GetState())
end)

Options.KeyPicker:OnChanged(function()
	print("快捷键修改！新键位:", Options.KeyPicker.Value)
end)

task.spawn(function()
	while true do
		wait(1)

		-- 检查快捷键是否被按住
		local state = Options.KeyPicker:GetState()
		if state then
			print("快捷键正被按住")
		end

		if Library.Unloaded then
			break
		end
	end
end)

Options.KeyPicker:SetValue({ "MB2", "Hold" }) -- 设置为 MB2 键，Hold 模式

-- 长文本标签演示滚动效果
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox("分组框 #2")
LeftGroupBox2:AddLabel(
	"这是一个跨多行的标签！即将超出界面范围...\n开玩笑的！向下滚动吧！\n\n\n下面的内容你好呀！",
	true
)

local TabBox = Tabs.Main:AddRightTabbox() -- 右侧添加 Tabbox

-- Tabbox 标签页支持 Groupbox 的所有方法（AddToggle、AddSlider 等）
local Tab1 = TabBox:AddTab("标签页 1")
Tab1:AddToggle("Tab1Toggle", { Text = "标签页1切换" })

local Tab2 = TabBox:AddTab("标签页 2")
Tab2:AddToggle("Tab2Toggle", { Text = "标签页2切换" })

Library:OnUnload(function()
	print("已卸载！")
end)

-- 密钥标签页支持添加元素
Tabs.Key:AddLabel({
	Text = "密钥: Banana",
	DoesWrap = true,
	Size = 16,
})

Tabs.Key:AddKeyBox("Banana", function(Success, ReceivedKey)
	print("预期密钥: Banana - 收到密钥:", ReceivedKey, "| 成功:", Success)
	Library:Notify({
		Title = "预期密钥: Banana",
		Description = "收到密钥: " .. ReceivedKey .. "\n成功: " .. tostring(Success),
		Time = 4,
	})
end)

Tabs.Key:AddLabel({
	Text = "无密钥",
	DoesWrap = true,
	Size = 16,
})

Tabs.Key:AddKeyBox(function(Success, ReceivedKey)
	print("预期密钥: 无 | 成功:", Success) -- true
	Library:Notify("成功: " .. tostring(Success), 4)
end)

-- UI 设置
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("菜单设置")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "打开键位菜单",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "自定义光标",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "通知位置",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI 缩放",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("菜单快捷键")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "菜单快捷键" })

MenuGroup:AddButton("卸载", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- 自定义菜单快捷键

-- 插件：
-- SaveManager（配置系统）
-- ThemeManager（主题系统）

-- 将库传递给管理器
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- 忽略 ThemeManager 使用的键（配置不保存主题）
SaveManager:IgnoreThemeSettings()

-- 将 MenuKeybind 加入忽略列表（不同配置不需要不同快捷键）
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- 使用场景：
-- 脚本中心可全局保存主题
-- 游戏配置按游戏分开保存
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") -- 针对游戏内不同位置（例如：DOORS 的不同房间）
-- 路径示例：MyScriptHub/specific-game/settings/specific-place

-- 在标签页右侧构建配置菜单
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- 在标签页左侧构建主题菜单（含内置主题）
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- 加载自动加载的配置
SaveManager:LoadAutoloadConfig()