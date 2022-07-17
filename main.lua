local function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function CreateGui(Type, Properties, Parent)
	print(Properties)
	local NewGui

	local LoweredType = string.lower(Type)
	local Protect

	if LoweredType == "screen" then
		NewGui = Instance.new("ScreenGui", Parent)
	elseif LoweredType == "ball" or LoweredType == "sphere" or LoweredType == "orb" then
		NewGui = Instance.new("Frame", Parent)
		Instance.new("UICorner", NewGui).CornerRadius = UDim.new(1, 0)
	end
	
	if typeof(NewGui) == "Instance" then
	else
		NewGui = Instance.new(Type, Parent)
	end
	
	for i,v in pairs(Properties) do
		if string.lower(i) ~= "protect" then
			NewGui[i] = v
		elseif string.lower(i) == "protect" and v == true then
			Protect = true
		end
	end
	
	if NewGui:IsA("ScreenGui") then
		if Protect == true then
			local SynV3 = syn and DrawingImmediate
			if (not is_sirhurt_closure) and (not SynV3) and (syn and syn.protect_gui) then
				NewGui.Name = randomString()
				syn.protect_gui(Main)
			elseif get_hidden_gui or gethui then
				local hiddenUI = get_hidden_gui or gethui
				NewGui.Name = randomString()
			else
				NewGui.Name = randomString()
			end
			
		end
	end
	return NewGui
end 

local Gui1 = CreateGui("screen", {Name = "test"}, game:GetService("CoreGui"))
local orb = CreateGui("ball", {Size = UDim2.new(0.2, 0, 0.2, 0)}, Gui1)
