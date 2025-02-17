-- if you can understand this code and figure out the docs on your own feel free to use i guess

local _New_ = Instance.new;

local AERO = _New_("ScreenGui", game.CoreGui);
AERO.Name = "AERO";
AERO.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
AERO.IgnoreGuiInset = true
_G.Startup = false
local aero = {TabCount = 0}


local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));


local function Drag(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		end
	end)
end


function aero:Int(e)
	e = e or {}
	-- create the global startup function
	_G.Startup = _G.Startup or true
	
	--if e.Startup == true then
		local Startup = _New_("Frame", AERO);
		Startup.AnchorPoint = Vector2.new(0.5, 0.5);
		Startup.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
		Startup.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Startup.BorderSizePixel = 0;
		Startup.Name = "Startup";
		Startup.Position = UDim2.new(0.5, 0, 0.5, 0);
		Startup.Size = UDim2.new(0, 130, 0, 130);
		Startup.Visible = _G.Startup

		local Aero_Logo = _New_("ImageLabel", Startup);
		Aero_Logo.AnchorPoint = Vector2.new(0.5, 0.5);
		Aero_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Aero_Logo.BackgroundTransparency = 1;
		Aero_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Aero_Logo.BorderSizePixel = 0;
		Aero_Logo.Name = "Aero Logo";
		Aero_Logo.Position = UDim2.new(0.5, 0, 0.5, 0);
		Aero_Logo.Size = UDim2.new(0, 100, 0, 100);
		Aero_Logo.Image = "rbxassetid://121173551408751";

		local UICorner = _New_("UICorner", Startup);
		UICorner.CornerRadius = UDim.new(1, 0);
		
		-- create the blur instance
		local blur = Instance.new("BlurEffect")
		blur.Parent = game.Lighting
		blur.Size = 24
		while blur.Size > 0.5 do
			blur.Size = blur.Size - 0.5
			wait(0.01)
	end
	
	-- end blur
	if blur.Size == 0.5 then
		UICorner.CornerRadius = UDim.new(0, 6);
	--	Startup:TweenSize(UDim2.new(0, 650,0, 363))
		Startup:TweenSize(UDim2.new(0, 650,0, 363),
			Enum.EasingDirection.Out,    -- I set it to Default (Out)
			Enum.EasingStyle.Quad,      -- I set it to Elastic
			1                         -- I set it to 5 for a long tween
		)


		wait(1.3)
		_G.Startup = false
		blur:Destroy()
		Startup:Destroy()
	end
	

	local Notifications = _New_("Frame", AERO);
	Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Notifications.BackgroundTransparency = 1;
	Notifications.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Notifications.BorderSizePixel = 0;
	Notifications.Name = "Notifications";
	Notifications.Size = UDim2.new(0, 311, 1, 0);

	local UIListLayout = _New_("UIListLayout", Notifications);
	UIListLayout.Padding = UDim.new(0, 4);
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom;

	local UIPadding = _New_("UIPadding", Notifications);
	UIPadding.PaddingBottom = UDim.new(0, 6);

	local pickers = _New_("Frame", AERO);
	pickers.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	pickers.BackgroundTransparency = 1;
	pickers.BorderColor3 = Color3.fromRGB(0, 0, 0);
	pickers.BorderSizePixel = 0;
	pickers.Name = "pickers";
	pickers.Position = UDim2.new(0.6180450916290283, 0, 0.6046175956726074, 0);
	pickers.Size = UDim2.new(0, 329, 0, 252);
	pickers.ZIndex = 3;
	--end
	-- init the whole ui
	if _G.Startup == false then
		
		

		local BindList = _New_("Frame",AERO);
		BindList.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
		BindList.BorderColor3 = Color3.fromRGB(0, 0, 0);
		BindList.BorderSizePixel = 0;
		BindList.Name = "BindList";
		BindList.Position = UDim2.new(0.7616541385650635, 0, 0.34343433380126953, 0);
		BindList.Size = UDim2.new(0, 234, 0, 254);
		BindList.Visible = true;

		local UICorner = _New_("UICorner", BindList);

		local TextLabel = _New_("TextLabel", BindList);
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		TextLabel.BackgroundTransparency = 1;
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TextLabel.BorderSizePixel = 0;
		TextLabel.Position = UDim2.new(0.03846153989434242, 0, 0, 0);
		TextLabel.Size = UDim2.new(0, 50, 0, 22);
		TextLabel.Font = Enum.Font.SourceSansBold;
		TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		TextLabel.Text = "Binds";
		TextLabel.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
		TextLabel.TextSize = 14;
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left;

		local th = _New_("Frame", BindList);
		th.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		th.BorderColor3 = Color3.fromRGB(0, 0, 0);
		th.BorderSizePixel = 0;
		th.Name = "grad";
		th.Position = UDim2.new(0, 0, 0, 20);
		th.Size = UDim2.new(1, 0, 0, 1);

		local UIGradient = _New_("UIGradient", th);
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

		local Hide = _New_("TextLabel", BindList);
		Hide.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Hide.BackgroundTransparency = 1;
		Hide.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Hide.BorderSizePixel = 0;
		Hide.Name = "Hide";
		Hide.Position = UDim2.new(0.7350427508354187, 0, 0, 0);
		Hide.Size = UDim2.new(0, 50, 0, 22);
		Hide.Font = Enum.Font.SourceSansBold;
		Hide.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Hide.Text = "[DEL] to hide";
		Hide.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
		Hide.TextSize = 14;
		Hide.TextXAlignment = Enum.TextXAlignment.Right;

		local BindList_0 = _New_("Frame", BindList);
		BindList_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BindList_0.BackgroundTransparency = 1;
		BindList_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
		BindList_0.BorderSizePixel = 0;
		BindList_0.Name = "BindList";
		BindList_0.Position = UDim2.new(0, 0, 0.10236220806837082, 0);
		BindList_0.Size = UDim2.new(1, 0, 0, 228);
		

		
		
Drag(BindList,BindList);
		local UIListLayout = _New_("UIListLayout", BindList_0);
		UIListLayout.Padding = UDim.new(0, 3);
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		local show = true
		 game:GetService("UserInputService").InputBegan:Connect(function(imp)
			if imp.UserInputType == Enum.UserInputType.Keyboard then
				if imp.KeyCode == Enum.KeyCode.Delete then
					
					if show == true then
						show = false
						BindList.Visible = false
					else
						show = true
						BindList.Visible = true
					end
					
					
				end
			end
			
		end)
		
		
		local Main = _New_("Frame", AERO);
		Main.AnchorPoint = Vector2.new(0.5, 0.5);
		Main.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
		Main.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Main.BorderSizePixel = 0;
		Main.Name = "Main";
		Main.Position = UDim2.new(0.5, 0, 0.5, 0);
		Main.Size = UDim2.new(0, 650, 0, 363);
Drag(Main,Main)
		local Aero_Logo = _New_("ImageLabel", Main);
		Aero_Logo.AnchorPoint = Vector2.new(0.5, 0.5);
		Aero_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Aero_Logo.BackgroundTransparency = 1;
		Aero_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Aero_Logo.BorderSizePixel = 0;
		Aero_Logo.Name = "Aero Logo";
		Aero_Logo.Position = UDim2.new(0.6230769157409668, 0, 0.5, 0);
		Aero_Logo.Size = UDim2.new(0.4000000059604645, 0, 0.4000000059604645, 0);
		Aero_Logo.Image = "rbxassetid://121173551408751";
		Aero_Logo.ImageColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
		Aero_Logo.ScaleType = Enum.ScaleType.Fit;

		local UICorner = _New_("UICorner", Main);
		UICorner.CornerRadius = UDim.new(0, 6);

		local Sidebar = _New_("Frame", Main);
		Sidebar.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
		Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Sidebar.BorderSizePixel = 0;
		Sidebar.Name = "Sidebar";
		Sidebar.Size = UDim2.new(0.23999999463558197, 0, 1, 0);

		local UICorner_0 = _New_("UICorner", Sidebar);
		UICorner_0.CornerRadius = UDim.new(0, 6);

		local TabList = _New_("Frame", Sidebar);
		TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		TabList.BackgroundTransparency = 1;
		TabList.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TabList.BorderSizePixel = 0;
		TabList.Name = "TabList";
		TabList.Position = UDim2.new(0, 0, 0.022038567811250687, 0);
		TabList.Size = UDim2.new(1, 0, -0.022038567811250687, 300);

		local UIListLayout = _New_("UIListLayout", TabList);
		UIListLayout.Padding = UDim.new(0, 7);
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

		local logo2 = _New_("ImageLabel", Sidebar);
		logo2.AnchorPoint = Vector2.new(0.5, 0.5);
		logo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		logo2.BackgroundTransparency = 1;
		logo2.BorderColor3 = Color3.fromRGB(0, 0, 0);
		logo2.BorderSizePixel = 0;
		logo2.Name = "logo2";
		logo2.Position = UDim2.new(0.15465672314167023, 0, 0.9192838072776794, 0);
		logo2.Size = UDim2.new(0, 54, 0, 55);
		logo2.Image = "rbxassetid://110696405031571";
		logo2.ScaleType = Enum.ScaleType.Fit;

		local Username = _New_("TextLabel", Sidebar);
		Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Username.BackgroundTransparency = 1;
		Username.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Username.BorderSizePixel = 0;
		Username.Name = "Username";
		Username.Position = UDim2.new(0.32692307233810425, 0, 0.9090909361839294, 0);
		Username.Size = UDim2.new(0, 95, 0, 24);
		Username.Font = Enum.Font.SourceSans;
		Username.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Username.Text = game.Players.LocalPlayer.Name;
		Username.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
		Username.TextSize = 14;
		Username.TextXAlignment = Enum.TextXAlignment.Left;

		local Welcome = _New_("TextLabel", Sidebar);
		Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Welcome.BackgroundTransparency = 1;
		Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Welcome.BorderSizePixel = 0;
		Welcome.Name = "Welcome";
		Welcome.Position = UDim2.new(0.28205129504203796, 0, 0.8429751992225647, 0);
		Welcome.Size = UDim2.new(0, 111, 0, 26);
		Welcome.Font = Enum.Font.SourceSansBold;
		Welcome.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Welcome.Text = "Welcome";
		Welcome.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
		Welcome.TextSize = 16;
		Welcome.TextXAlignment = Enum.TextXAlignment.Left;

		local Tab_Container = _New_("Frame", Main);
		Tab_Container.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
		Tab_Container.BackgroundTransparency = 1;
		Tab_Container.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Tab_Container.BorderSizePixel = 0;
		Tab_Container.Name = "Tab_Container";
		Tab_Container.Position = UDim2.new(0.25999999046325684, 0, 0, 0);
		Tab_Container.Size = UDim2.new(0.5861538648605347, 100, 1, 0);
		
		local t={}
		
		function t:Error(e)
			e = e or {}

			local Error = _New_("Frame", Notifications);
			Error.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
			Error.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Error.BorderSizePixel = 0;
			Error.Name = "Error";
			Error.Position = UDim2.new(0.040192924439907074, 0, 0.6303030252456665, 0);
			Error.Size = UDim2.new(0, 286, 0, 100);

			local Aero_Logo = _New_("ImageLabel", Error);
			Aero_Logo.AnchorPoint = Vector2.new(0.5, 0.5);
			Aero_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Aero_Logo.BackgroundTransparency = 1;
			Aero_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Aero_Logo.BorderSizePixel = 0;
			Aero_Logo.Name = "Aero Logo";
			Aero_Logo.Position = UDim2.new(0.4995357394218445, 0, 0.49913787841796875, 0);
			Aero_Logo.Size = UDim2.new(0.6913791298866272, 0, 0.6913791298866272, 0);
			Aero_Logo.Image = "rbxassetid://121173551408751";
			Aero_Logo.ImageColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
			Aero_Logo.ScaleType = Enum.ScaleType.Fit;

			local grad = _New_("Frame", Error);
			grad.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			grad.BorderColor3 = Color3.fromRGB(0, 0, 0);
			grad.BorderSizePixel = 0;
			grad.Name = "grad";
			grad.Position = UDim2.new(0, 0, 0, 30);
			grad.Size = UDim2.new(1, 0, 0, 1);

			local UIGradient = _New_("UIGradient", grad);
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))};
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

			local Header = _New_("TextLabel", Error);
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Header.BackgroundTransparency = 1;
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Header.BorderSizePixel = 0;
			Header.Name = "Header";
			Header.Position = UDim2.new(0.04895104840397835, 0, 0, 0);
			Header.Size = UDim2.new(0, 136, 0, 30);
			Header.Font = Enum.Font.SourceSansBold;
			Header.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Header.Text = "Error";
			Header.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
			Header.TextSize = 14;
			Header.TextXAlignment = Enum.TextXAlignment.Left;

			local UICorner = _New_("UICorner", Error);

			local Text = _New_("TextLabel", Error);
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Text.BackgroundTransparency = 1;
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Text.BorderSizePixel = 0;
			Text.Name = "Text";
			Text.Position = UDim2.new(0.15034964680671692, 0, 0.3100000023841858, 0);
			Text.Size = UDim2.new(0, 200, 0, 52);
			Text.Font = Enum.Font.SourceSansBold;
			Text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Text.RichText = true;
			Text.Text = e.text or "Something is not working with this, try later";
			Text.TextColor3 = Color3.fromRGB(249.0000155568123, 249.0000155568123, 249.0000155568123);
			Text.TextSize = 14;

			wait(e.time or 3)
			Error:Destroy()
		end

		function t:Notify(e)
			e = e or {}
			local Noti = _New_("Frame", Notifications);
			Noti.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
			Noti.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Noti.BorderSizePixel = 0;
			Noti.Name = "Noti";
			Noti.Position = UDim2.new(0.040192924439907074, 0, 0.6303030252456665, 0);
			Noti.Size = UDim2.new(0, 286, 0, 100);

			local Aero_Logo = _New_("ImageLabel", Noti);
			Aero_Logo.AnchorPoint = Vector2.new(0.5, 0.5);
			Aero_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Aero_Logo.BackgroundTransparency = 1;
			Aero_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Aero_Logo.BorderSizePixel = 0;
			Aero_Logo.Name = "Aero Logo";
			Aero_Logo.Position = UDim2.new(0.4995357394218445, 0, 0.49913787841796875, 0);
			Aero_Logo.Size = UDim2.new(0.6913791298866272, 0, 0.6913791298866272, 0);
			Aero_Logo.Image = "rbxassetid://121173551408751";
			Aero_Logo.ImageColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
			Aero_Logo.ScaleType = Enum.ScaleType.Fit;

			local grad = _New_("Frame", Noti);
			grad.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			grad.BorderColor3 = Color3.fromRGB(0, 0, 0);
			grad.BorderSizePixel = 0;
			grad.Name = "grad";
			grad.Position = UDim2.new(0, 0, 0, 30);
			grad.Size = UDim2.new(1, 0, 0, 1);

			local UIGradient = _New_("UIGradient", grad);
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

			local Header = _New_("TextLabel", Noti);
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Header.BackgroundTransparency = 1;
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Header.BorderSizePixel = 0;
			Header.Name = "Header";
			Header.Position = UDim2.new(0.04895104840397835, 0, 0, 0);
			Header.Size = UDim2.new(0, 136, 0, 30);
			Header.Font = Enum.Font.SourceSansBold;
			Header.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Header.Text = "Notification";
			Header.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
			Header.TextSize = 14;
			Header.TextXAlignment = Enum.TextXAlignment.Left;

			local UICorner = _New_("UICorner", Noti);

			local Text = _New_("TextLabel", Noti);
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Text.BackgroundTransparency = 1;
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Text.BorderSizePixel = 0;
			Text.Name = "Text";
			Text.Position = UDim2.new(0.15034964680671692, 0, 0.3100000023841858, 0);
			Text.Size = UDim2.new(0, 200, 0, 52);
			Text.Font = Enum.Font.SourceSansBold;
			Text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Text.RichText = true;
			Text.Text = e.text or "This is just a regular notification";
			Text.TextColor3 = Color3.fromRGB(249.0000155568123, 249.0000155568123, 249.0000155568123);
			Text.TextSize = 14;
			wait(e.time or 3)
			Noti:Destroy()
		end

		function t:Warn(e)
			e = e or {}


			local Warning = _New_("Frame", Notifications);
			Warning.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
			Warning.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Warning.BorderSizePixel = 0;
			Warning.Name = "Warning";
			Warning.Position = UDim2.new(0.040192924439907074, 0, 0.4876273572444916, 0);
			Warning.Size = UDim2.new(0, 286, 0, 100);

			local Aero_Logo = _New_("ImageLabel", Warning);
			Aero_Logo.AnchorPoint = Vector2.new(0.5, 0.5);
			Aero_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Aero_Logo.BackgroundTransparency = 1;
			Aero_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Aero_Logo.BorderSizePixel = 0;
			Aero_Logo.Name = "Aero Logo";
			Aero_Logo.Position = UDim2.new(0.4995357394218445, 0, 0.49913787841796875, 0);
			Aero_Logo.Size = UDim2.new(0.6913791298866272, 0, 0.6913791298866272, 0);
			Aero_Logo.Image = "rbxassetid://121173551408751";
			Aero_Logo.ImageColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
			Aero_Logo.ScaleType = Enum.ScaleType.Fit;

			local grad = _New_("Frame", Warning);
			grad.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			grad.BorderColor3 = Color3.fromRGB(0, 0, 0);
			grad.BorderSizePixel = 0;
			grad.Name = "grad";
			grad.Position = UDim2.new(0, 0, 0, 30);
			grad.Size = UDim2.new(1, 0, 0, 1);

			local UIGradient = _New_("UIGradient", grad);
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 191.00000381469727, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 191.00000381469727, 0))};
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

			local Header = _New_("TextLabel", Warning);
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Header.BackgroundTransparency = 1;
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Header.BorderSizePixel = 0;
			Header.Name = "Header";
			Header.Position = UDim2.new(0.04895104840397835, 0, 0, 0);
			Header.Size = UDim2.new(0, 136, 0, 30);
			Header.Font = Enum.Font.SourceSansBold;
			Header.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Header.Text = "Warning";
			Header.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
			Header.TextSize = 14;
			Header.TextXAlignment = Enum.TextXAlignment.Left;

			local UICorner = _New_("UICorner", Warning);

			local Text = _New_("TextLabel", Warning);
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Text.BackgroundTransparency = 1;
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Text.BorderSizePixel = 0;
			Text.Name = "Text";
			Text.Position = UDim2.new(0.15034964680671692, 0, 0.3100000023841858, 0);
			Text.Size = UDim2.new(0, 200, 0, 52);
			Text.Font = Enum.Font.SourceSansBold;
			Text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Text.RichText = true;
			Text.Text = e.text or "SOME FETURES ARE WIP";
			Text.TextColor3 = Color3.fromRGB(249.0000155568123, 249.0000155568123, 249.0000155568123);
			Text.TextSize = 14;

			wait(e.time or 3)
			Warning:Destroy()
		end
		
		function t:Tab(e)
			e = e or {}

			local TabBtn = _New_("TextButton", TabList);
			TabBtn.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157);
			TabBtn.BackgroundTransparency = 0.30000001192092896;
			TabBtn.BorderColor3 = Color3.fromRGB(0, 0, 0);
			TabBtn.BorderSizePixel = 0;
			TabBtn.Name = "TabBtn";
			TabBtn.Position = UDim2.new(0.06410256773233414, 0, 0, 0);
			TabBtn.Size = UDim2.new(0, 136, 0, 29);
			TabBtn.Font = Enum.Font.SourceSansBold;
			TabBtn.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			TabBtn.Text = e.text;
			TabBtn.TextColor3 = Color3.fromRGB(118.00000056624413, 118.00000056624413, 118.00000056624413);
			TabBtn.TextSize = 14;

			local TabGrad = _New_("Frame", TabBtn);
			TabGrad.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			TabGrad.BorderColor3 = Color3.fromRGB(0, 0, 0);
			TabGrad.BorderSizePixel = 0;
			TabGrad.Name = "grad";
			TabGrad.Position = UDim2.new(0, 0, 1, 0);
			TabGrad.Size = UDim2.new(1, 0, 0, 1);
			TabGrad.Visible = true;
			TabGrad.Transparency = 1

			local UIGradient = _New_("UIGradient", TabGrad);
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

			local UICorner = _New_("UICorner", TabBtn);
			

			local Tab = _New_("Frame", Tab_Container);
			Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Tab.BackgroundTransparency = 1;
			Tab.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Tab.BorderSizePixel = 0;
			Tab.Name = "Tab";
			Tab.Position = UDim2.new(0.008316008374094963, 0, 0.022038567811250687, 0);
			Tab.Size = UDim2.new(0.9916839003562927, 0, 0.9779614210128784, 0);
			Tab.Visible = false;

			local List = _New_("ScrollingFrame", Tab);
			List.Active = true;
			List.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			List.BackgroundTransparency = 1;
			List.BorderColor3 = Color3.fromRGB(0, 0, 0);
			List.BorderSizePixel = 0;
			List.Name = "List";
			List.Size = UDim2.new(1, 0, 1, 0);
			List.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			List.CanvasSize = UDim2.new(0, 0, 1, 0);
			List.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
			List.ScrollingDirection = Enum.ScrollingDirection.Y;

			local UIListLayout = _New_("UIListLayout", List);
			UIListLayout.Padding = UDim.new(0, 7);
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			
			local tweenInfo = TweenInfo.new(0.3) -- just time
			local Active_color = {TextColor3 = Color3.fromRGB(193, 193, 193);}
			local active_Tween = TweenService:Create(TabBtn, tweenInfo, Active_color)
			local Disabled_color = {TextColor3 = Color3.fromRGB(116, 116, 116);}
			aero.TabCount = aero.TabCount + 1
			
			TabBtn.MouseButton1Click:Connect(function()
				for _,v in ipairs(Tab_Container:GetChildren()) do --// panels
					v.Visible = false
				end
				Tab.Visible = true 


				for _,v in ipairs(TabList:GetChildren()) do
					if v.Name == "TabBtn" then
						local disabled_Tween = TweenService:Create(v, tweenInfo, Disabled_color)
						disabled_Tween:Play()
					end

				end


				active_Tween:Play()


			end)

			if aero.TabCount == 1 then
				TabBtn.TextColor3 = Color3.fromRGB(193, 193, 193)
				Tab.Visible = true
			end
			
			-- Elements
			local z = {}
			function z:Header(e)
				e = e or {}

				local Header = _New_("Frame", List);
				Header.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				Header.BackgroundTransparency = 0.20000000298023224;
				Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Header.BorderSizePixel = 0;
				Header.Name = "Header";
				Header.Position = UDim2.new(0.034632034599781036, 0, 0, 0);
				Header.Size = UDim2.new(0, 430, 0, 28);

				local TextLabel = _New_("TextLabel", Header);
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				TextLabel.BackgroundTransparency = 1;
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
				TextLabel.BorderSizePixel = 0;
				TextLabel.Size = UDim2.new(1, 0, 1, 0);
				TextLabel.Font = Enum.Font.SourceSansBold;
				TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				TextLabel.Text = e.text;
				TextLabel.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
				TextLabel.TextSize = 14;

				local grad = _New_("Frame", Header);
				grad.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				grad.BorderColor3 = Color3.fromRGB(0, 0, 0);
				grad.BorderSizePixel = 0;
				grad.Name = "grad";
				grad.Position = UDim2.new(0, 0, 1, 0);
				grad.Size = UDim2.new(1, 0, 0, 1);

				local UIGradient = _New_("UIGradient", grad);
				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.5137157440185547, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)};

				local UICorner = _New_("UICorner", Header);
			end
			
			function z:Button(e)
				e = e or {}
				e.callback = e.callback or function() end
				

				local Button = _New_("Frame", List);
				Button.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				Button.BackgroundTransparency = 0.20000000298023224;
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Button.BorderSizePixel = 0;
				Button.Name = "Button";
				Button.Position = UDim2.new(0.04926624894142151, 0, 0.09859155118465424, 0);
				Button.Size = UDim2.new(0, 430, 0, 39);
				

				local UICorner = _New_("UICorner", Button);

				local Action = _New_("TextButton", Button);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Action.BorderSizePixel = 0;
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSansBold;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Action.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
				Action.TextSize = 14;
				Action.TextXAlignment = Enum.TextXAlignment.Left;
				Action.Text = e.text or "Button!"

				local UIPadding = _New_("UIPadding", Action);
				UIPadding.PaddingLeft = UDim.new(0, 20);

				local ImageLabel = _New_("ImageLabel", Button);
				ImageLabel.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				ImageLabel.BackgroundTransparency = 1;
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
				ImageLabel.BorderSizePixel = 0;
				ImageLabel.Position = UDim2.new(0.8976744413375854, 0, 0.1538461595773697, 0);
				ImageLabel.Size = UDim2.new(0, 26, 0, 26);
				ImageLabel.Image = "rbxassetid://97644658902945";
				
				Action.MouseButton1Down:Connect(function()
					e.callback()
				end)
			end
			
			function z:Toggle(e)
				e = e or {}
				e.callback = e.callback or function()end
				

				local Toggle = _New_("Frame", List);
				Toggle.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				Toggle.BackgroundTransparency = 0.20000000298023224;
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Toggle.BorderSizePixel = 0;
				Toggle.Name = "Toggle";
				Toggle.Position = UDim2.new(0.04926624894142151, 0, 0.09859155118465424, 0);
				Toggle.Size = UDim2.new(0, 430, 0, 39);

				local UICorner = _New_("UICorner", Toggle);

				local Action = _New_("TextButton", Toggle);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Action.BorderSizePixel = 0;
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSansBold;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Action.Text = e.text or "Toggle";
				Action.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
				Action.TextSize = 14;
				Action.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", Action);
				UIPadding.PaddingLeft = UDim.new(0, 20);

				local Clr = _New_("Frame", Toggle);
				Clr.BackgroundColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
				Clr.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Clr.BorderSizePixel = 0;
				Clr.Name = "Clr";
				Clr.Position = UDim2.new(0.8980000019073486, 0, 0.15399999916553497, 0);
				Clr.Size = UDim2.new(0, 26, 0, 26);

				local UICorner_0 = _New_("UICorner", Clr);

				local Inside = _New_("Frame", Clr);
				Inside.AnchorPoint = Vector2.new(0.5, 0.5);
				Inside.BackgroundColor3 = Color3.fromRGB(61.00000396370888, 61.00000396370888, 61.00000396370888);
				Inside.BackgroundTransparency = 1;
				Inside.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Inside.BorderSizePixel = 0;
				Inside.Name = "Inside";
				Inside.Position = UDim2.new(0.5, 0, 0.5, 0);
				Inside.Size = UDim2.new(0, 17, 0, 17);

				local UICorner_1 = _New_("UICorner", Inside);
				UICorner_1.CornerRadius = UDim.new(0, 5);
				
				local TweenSpeed = 0.2
				local inFunc = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
				
				local enabled = e.value or false
				
				-- set the initial value
				if enabled == true then
					Inside.Transparency = 0
				else
					Inside.Transparency = 1
				end
				
				
				Action.MouseButton1Down:Connect(function()
					if enabled == false then
						enabled = true
						TweenService:Create(Inside, inFunc,{Transparency = 0}):Play()
						pcall(e.callback,true)
					else
						enabled = false
						TweenService:Create(Inside, inFunc,{Transparency = 1}):Play()
						pcall(e.callback,false)
					end
				end)
				
				local b = {}
				
				function b:Bind(m)
					m = m or {}
					m.def = m.def

					local oldKey = m.def  -- m.def.Name
					
					


					local BindPannel = _New_("Frame", BindList_0);
					BindPannel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BindPannel.BackgroundTransparency = 1;
					BindPannel.BorderColor3 = Color3.fromRGB(0, 0, 0);
					BindPannel.BorderSizePixel = 0;
					BindPannel.Name = "BindPannel";
					BindPannel.Size = UDim2.new(1, 0, 0, 20);

					local Bind = _New_("TextButton", BindPannel);
					Bind.AutoButtonColor = false;
					Bind.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
					Bind.BorderColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
					Bind.BorderSizePixel = 0;
					Bind.Name = "Bind";
					Bind.Position = UDim2.new(0.04002758488059044, 0, -0.31131744384765625, 6);
					Bind.Size = UDim2.new(0, 48, 0, 21);
					Bind.ZIndex = 45;
					Bind.Font = Enum.Font.Ubuntu;
					Bind.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Bind.Text = m.def.Name;
					Bind.TextColor3 = Color3.fromRGB(255, 255, 255);
					Bind.TextSize = 14;

					local UICorner = _New_("UICorner", Bind);

					local TextLabel = _New_("TextLabel", BindPannel);
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					TextLabel.BackgroundTransparency = 1;
					TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
					TextLabel.BorderSizePixel = 0;
					TextLabel.Position = UDim2.new(0.28205129504203796, 0, 0, 0);
					TextLabel.Size = UDim2.new(0.1367521435022354, 40, 1, 0);
					TextLabel.Font = Enum.Font.SourceSansBold;
					TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					TextLabel.Text = e.text;
					TextLabel.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
					TextLabel.TextSize = 14;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					
					local blacklist = {
						"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"
					}

					Bind.MouseButton1Click:connect(function(e) 
						Bind.Text = "..."
						local a, b = game:GetService('UserInputService').InputBegan:wait();


						if not table.find(blacklist, a.KeyCode.Name) then
							Bind.Text =  a.KeyCode.Name
							oldKey = a.KeyCode.Name;
						else
							Bind.Text =	 "NONE"
							oldKey = Enum.KeyCode.World55
						end



					end)

					game:GetService("UserInputService").InputBegan:connect(function(current, ok) 



						if not ok then 
							if current.KeyCode.Name == oldKey then 
								if enabled == false then
									enabled = true
									TweenService:Create(Inside, inFunc,{Transparency = 0}):Play()
									pcall(e.callback,true)
								else
									enabled = false
									pcall(e.callback,false)
									TweenService:Create(Inside, inFunc,{Transparency = 1}):Play()
								end
							end
						end
					end)

				end
				
				return b;				
			end
			
				function z:Slider(e)
				e = e or {}


				local Slider = _New_("Frame",List);
				Slider.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				Slider.BackgroundTransparency = 0.20000000298023224;
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Slider.BorderSizePixel = 0;
				Slider.Name = "Slider";
				Slider.Position = UDim2.new(0.04926624894142151, 0, 0.48732393980026245, 0);
				Slider.Size = UDim2.new(0, 430, 0, 50);

				local UICorner = _New_("UICorner", Slider);

				local SliderBack = _New_("TextButton", Slider);
				SliderBack.AutoButtonColor = false;
				SliderBack.BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354);
				SliderBack.BorderColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
				SliderBack.Name = "SliderBack";
				SliderBack.Position = UDim2.new(0.0273428987711668, 0, 0.3449999988079071, 15);
				SliderBack.Size = UDim2.new(0, 400, 0, 10);
				SliderBack.Font = Enum.Font.SourceSans;
				SliderBack.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				SliderBack.Text = "";
				SliderBack.TextColor3 = Color3.fromRGB(0, 0, 0);
				SliderBack.TextSize = 14;

				local SliderFill = _New_("Frame", SliderBack);
				SliderFill.BackgroundColor3 = Color3.fromRGB(48.000000938773155, 48.000000938773155, 48.000000938773155);
				SliderFill.BorderColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
				SliderFill.Name = "SliderFill";
				SliderFill.Position = UDim2.new(-0.00389113649725914, 0, 0, 0);
				SliderFill.Size = UDim2.new(0, 0, 1, 0);

				local UICorner_0 = _New_("UICorner", SliderFill);

				local UICorner_1 = _New_("UICorner", SliderBack);

				local SliderValue = _New_("TextLabel", Slider);
				SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				SliderValue.BackgroundTransparency = 1;
				SliderValue.Name = "SliderValue";
				SliderValue.Position = UDim2.new(0.8622201085090637, 8, -0.029999999329447746, 8);
				SliderValue.Size = UDim2.new(0.0653742253780365, 0, 0.5, 0);
				SliderValue.Font = Enum.Font.SourceSansBold;
				SliderValue.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SliderValue.Text = "0";
				SliderValue.TextColor3 = Color3.fromRGB(193.00000369548798, 193.00000369548798, 193.00000369548798);
				SliderValue.TextSize = 14;
				SliderValue.TextTransparency = 1;
				SliderValue.TextXAlignment = Enum.TextXAlignment.Right;

				local UIPadding = _New_("UIPadding", SliderValue);
				UIPadding.PaddingLeft = UDim.new(0, 9);

				local Title = _New_("TextLabel", Slider);
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Title.BackgroundTransparency = 1;
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Title.BorderSizePixel = 0;
				Title.Name = "Title";
				Title.Position = UDim2.new(0.02734275721013546, 0, 0.13429565727710724, 0);
				Title.Size = UDim2.new(0, 162, 0, 25);
				Title.Font = Enum.Font.SourceSansBold;
				Title.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Title.Text = e.text or "slider";
				Title.TextColor3 = Color3.fromRGB(193.00000369548798, 193.00000369548798, 193.00000369548798);
				Title.TextSize = 14;
				Title.TextXAlignment = Enum.TextXAlignment.Left;
				
				

				local Hover = _New_("Frame", Slider);
				Hover.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Hover.BackgroundTransparency = 1;
				Hover.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Hover.BorderSizePixel = 0;
				Hover.Name = "Hover";
				Hover.Position = UDim2.new(0, 0, 0.47999998927116394, 0);
				Hover.Size = UDim2.new(0, 419, 0, 24);
				
				-----Values-----
				e.min = e.min or 0
				e.max = e.max or 100


				-----Callback-----
				e.callback = e.callback or function() end


				-----Variables-----
				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
				local Value;
				local length = SliderBack.Size.X.Offset
				local height = SliderBack.Size.Y.Offset
				local Info = TweenInfo.new(0.6)
				local In = TweenService:Create(SliderValue,Info,{TextTransparency=0.6})
				local Out = TweenService:Create(SliderValue,Info,{TextTransparency=1})
			

				Hover.MouseEnter:Connect(function()
					In:Play()
				end)
				Hover.MouseLeave:Connect(function()
					Out:Play()
				end)


				SliderBack.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min)) or 0
					-- Value = e.Value

					pcall(function()
						e.callback(Value)
					end)
					SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
					moveconnection = mouse.Move:Connect(function()
						SliderValue.Text = Value
						Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
						pcall(function()
							e.callback(Value)
						end)

						SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
							pcall(function()
								e.callback(Value)
							end)
							SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
				-- touch fix

				SliderBack.MouseButton1Down:Connect(function()
					SliderValue.Text = Value
					Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
					pcall(function()
						e.callback(Value)
					end)

					SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
				end)
				
			end
			
			function z:ColorPicker(e)
				e = e or {}
				e.callback = e.callback or function()end

				local ColorPicker = _New_("Frame", List);
				ColorPicker.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				ColorPicker.BackgroundTransparency = 0.20000000298023224;
				ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0);
				ColorPicker.BorderSizePixel = 0;
				ColorPicker.Name = "ColorPicker";
				ColorPicker.Position = UDim2.new(0.04926624894142151, 0, 0.09859155118465424, 0);
				ColorPicker.Size = UDim2.new(0, 430, 0, 39);

				local UICorner = _New_("UICorner", ColorPicker);

				local Action = _New_("TextButton", ColorPicker);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Action.BorderSizePixel = 0;
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSansBold;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Action.Text = e.text or "ColorPicker";
				Action.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
				Action.TextSize = 14;
				Action.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", Action);
				UIPadding.PaddingLeft = UDim.new(0, 20);

				local Color = _New_("Frame", ColorPicker);
				Color.BackgroundColor3 = e.begin or Color3.fromRGB(255,0,0);
				Color.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Color.BorderSizePixel = 0;
				Color.Name = "Color";
				Color.Position = UDim2.new(0.870093047618866, 0, 0.2309233844280243, 0);
				Color.Size = UDim2.new(0, 38, 0, 19);

				local UICorner_0 = _New_("UICorner", Color);
				
				local Pallete = _New_("Frame", pickers);
				Pallete.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				Pallete.BorderColor3 = Color3.fromRGB(31.000000052154064, 31.000000052154064, 31.000000052154064);
				Pallete.Name = "Pallete";
				Pallete.Position = UDim2.new(0.05683282017707825, 0, -0.00930071622133255, 0);
				Pallete.Size = UDim2.new(0.5237143635749817, 0, 0.6600942015647888, 0);
				Pallete.Visible = false;
				Pallete.ZIndex = 4;
				Drag(Pallete,Pallete)
				local Gradient = _New_("UIGradient", Pallete);
				Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(110.00000104308128, 118.00000056624413, 250.00000029802322))};
				Gradient.Rotation = -137;
				Gradient.Name = "Gradient";

				local ColorSlider = _New_("TextButton", Pallete);
				ColorSlider.AnchorPoint = Vector2.new(0.5, 0.5);
				ColorSlider.AutoButtonColor = false;
				ColorSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				ColorSlider.BorderColor3 = Color3.fromRGB(0, 0, 0);
				ColorSlider.BorderSizePixel = 0;
				ColorSlider.Name = "ColorSlider";
				ColorSlider.Position = UDim2.new(0.4954770505428314, 0, 0.36987248063087463, 45);
				ColorSlider.Size = UDim2.new(0.11317335814237595, 140, -0.005797365680336952, 7);
				ColorSlider.ZIndex = 4;
				ColorSlider.Font = Enum.Font.SourceSans;
				ColorSlider.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				ColorSlider.Text = "";
				ColorSlider.TextColor3 = Color3.fromRGB(0, 0, 0);
				ColorSlider.TextSize = 14;

				local Gradient_0 = _New_("UIGradient", ColorSlider);
				Gradient_0.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4.000000236555934)), ColorSequenceKeypoint.new(0.20000000298023224, Color3.fromRGB(255, 0, 251.00000023841858)), ColorSequenceKeypoint.new(0.4000000059604645, Color3.fromRGB(0, 17.00000088661909, 255)), ColorSequenceKeypoint.new(0.6000000238418579, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.800000011920929, Color3.fromRGB(21.000000648200512, 255, 0)), ColorSequenceKeypoint.new(0.8999999761581421, Color3.fromRGB(234.00000125169754, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4.000000236555934))};
				Gradient_0.Name = "Gradient";

				local UICorner = _New_("UICorner", ColorSlider);
				UICorner.CornerRadius = UDim.new(0, 4);

				local GradientPallete = _New_("ImageButton", Pallete);
				GradientPallete.AutoButtonColor = false;
				GradientPallete.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				GradientPallete.BorderColor3 = Color3.fromRGB(0, 0, 0);
				GradientPallete.BorderSizePixel = 0;
				GradientPallete.Name = "GradientPallete";
				GradientPallete.Position = UDim2.new(0.032627031207084656, 0, 0.03945932909846306, 0);
				GradientPallete.Size = UDim2.new(0, 161, 0, 89);
				GradientPallete.ZIndex = 4;
				GradientPallete.Image = "rbxassetid://4155801252";

				local Dot = _New_("Frame", GradientPallete);
				Dot.AnchorPoint = Vector2.new(0.5, 0.5);
				Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Dot.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Dot.BorderSizePixel = 2;
				Dot.Name = "Dot";
				Dot.Position = UDim2.new(1, 0, 0, 0);
				Dot.Rotation = 45;
				Dot.Size = UDim2.new(0, 3, 0, 3);
				Dot.ZIndex = 5;

				local UICorner_0 = _New_("UICorner", GradientPallete);
				UICorner_0.CornerRadius = UDim.new(0, 4);

				local Input = _New_("Frame", Pallete);
				Input.BackgroundColor3 = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909);
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Input.BorderSizePixel = 0;
				Input.Name = "Input";
				Input.Position = UDim2.new(0.032628096640110016, 0, 0.6788716912269592, 4);
				Input.Size = UDim2.new(0.11317265033721924, 140, 0, 12);
				Input.ZIndex = 4;

				local InputBox = _New_("TextBox", Input);
				InputBox.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933);
				InputBox.BackgroundTransparency = 1;
				InputBox.BorderColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933);
				InputBox.BorderSizePixel = 0;
				InputBox.Name = "InputBox";
				InputBox.Size = UDim2.new(1, 0, 1, 0);
				InputBox.ZIndex = 5;
				InputBox.Font = Enum.Font.SourceSans;
				InputBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				InputBox.PlaceholderColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
				InputBox.PlaceholderText = "RGB: 255, 0, 0";
				InputBox.Text = "";
				InputBox.TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
				InputBox.TextSize = 15;
				InputBox.TextStrokeTransparency = 0.75;
				InputBox.TextWrapped = true;

				local Gradient_1 = _New_("UIGradient", Input);
				Gradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(180.00000447034836, 180.00000447034836, 180.00000447034836))};
				Gradient_1.Rotation = 90;
				Gradient_1.Name = "Gradient";

				local UICorner_1 = _New_("UICorner", Input);
				UICorner_1.CornerRadius = UDim.new(0, 4);

				local Done = _New_("TextButton", Pallete);
				Done.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Done.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Done.BorderSizePixel = 0;
				Done.Name = "Done";
				Done.Position = UDim2.new(0.10227111726999283, 0, 0.832711398601532, 0);
				Done.Size = UDim2.new(0, 136, 0, 20);
				Done.ZIndex = 4;
				Done.Font = Enum.Font.SourceSans;
				Done.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Done.Text = "Done";
				Done.TextColor3 = Color3.fromRGB(255, 255, 255);
				Done.TextSize = 14;

				local UICorner_2 = _New_("UICorner", Done);
				UICorner_2.CornerRadius = UDim.new(0, 4);

				local UIGradient = _New_("UIGradient", Done);
				UIGradient.Rotation = -83;
				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0.29374998807907104, 0), NumberSequenceKeypoint.new(1, 0.793749988079071, 0)};

				local UIStroke = _New_("UIStroke", Done);
				UIStroke.Color = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485);

				local UICorner_3 = _New_("UICorner", Pallete);
				UICorner_3.CornerRadius = UDim.new(0, 4);
				
				local ColorpickerInit = {}
				local o = false
				Done.MouseButton1Down:Connect(function()
					o = false
					Pallete.Visible = false
				end)
				Action.MouseButton1Down:Connect(function()
					if o == false then
						o = true
						Pallete.Visible = o
					else
						o = false
						Pallete.Visible = o
					end
				end)



				local ColorTable = {
					Hue = 1,
					Saturation = 0,
					Value = 0
				}
				local ColorRender = nil
				local HueRender = nil
				local ColorpickerToggle = false

				local function UpdateColor()
					Color.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,ColorTable.Saturation,ColorTable.Value)
					Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,1,1)
					Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Color.BackgroundColor3.R* 255) .. "," .. math.round(Color.BackgroundColor3.G * 255) .. "," .. math.round(Color.BackgroundColor3.B * 255)
					e.callback(Color.BackgroundColor3)
				end


				Pallete.GradientPallete.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorRender then
							ColorRender:Disconnect()
						end
						ColorRender = RunService.RenderStepped:Connect(function()
							local Mouse = UserInputService:GetMouseLocation()
							local ColorX = math.clamp(Mouse.X - Pallete.GradientPallete.AbsolutePosition.X, 0, Pallete.GradientPallete.AbsoluteSize.X) / Pallete.GradientPallete.AbsoluteSize.X
							local ColorY = math.clamp((Mouse.Y - 37) - Pallete.GradientPallete.AbsolutePosition.Y, 0, Pallete.GradientPallete.AbsoluteSize.Y) / Pallete.GradientPallete.AbsoluteSize.Y
							Pallete.GradientPallete.Dot.Position = UDim2.new(ColorX,0,ColorY,0)
							ColorTable.Saturation = ColorX
							ColorTable.Value = 1 - ColorY
							UpdateColor()
						end)
					end
				end)

				Pallete.GradientPallete.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorRender then
							ColorRender:Disconnect()
						end
					end
				end)

				Pallete.ColorSlider.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueRender then
							HueRender:Disconnect()
						end
						HueRender = RunService.RenderStepped:Connect(function()
							local Mouse = UserInputService:GetMouseLocation()
							local HueX = math.clamp(Mouse.X - Pallete.ColorSlider.AbsolutePosition.X, 0, Pallete.ColorSlider.AbsoluteSize.X) / Pallete.ColorSlider.AbsoluteSize.X
							ColorTable.Hue = 1 - HueX
							UpdateColor()
						end)
					end
				end)

				Pallete.ColorSlider.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueRender then
							HueRender:Disconnect()
						end
					end
				end)

				function ColorpickerInit:UpdateColor(Color)
					local Hue, Saturation, Value = Color:ToHSV()
					Color.BackgroundColor3 = Color3.fromHSV(Hue,Saturation,Value)
					Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(Hue,1,1)
					Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Color.BackgroundColor3.R* 255) .. "," .. math.round(Color.BackgroundColor3.G * 255) .. "," .. math.round(Color.BackgroundColor3.B * 255)
					ColorTable = {
						Hue = Hue,
						Saturation = Saturation,
						Value = Value
					}
					e.callback(Color)
				end

				Pallete.Input.InputBox.FocusLost:Connect(function(Enter)
					if Enter then
						local ColorString = string.split(string.gsub(Pallete.Input.InputBox.Text," ", ""), ",")
						ColorpickerInit:UpdateColor(Color3.fromRGB(ColorString[1],ColorString[2],ColorString[3]))
						Pallete.Input.InputBox.Text = ""
					end
				end)

				return ColorpickerInit
				
			end
			
			function z:DropDown(e)
				e =  e or {}
				e.list = e.list or {}
				e.callback = e.callback or function()end

				local DropDown = _New_("Frame", List);
				DropDown.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				DropDown.BackgroundTransparency = 0.20000000298023224;
				DropDown.BorderColor3 = Color3.fromRGB(0, 0, 0);
				DropDown.BorderSizePixel = 0;
				DropDown.Name = "DropDown";
				DropDown.Position = UDim2.new(0.04926624894142151, 0, 0.09859155118465424, 0);
				DropDown.Size = UDim2.new(0, 430, 0, 39);

				local UICorner = _New_("UICorner", DropDown);

				local Action = _New_("TextButton", DropDown);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Action.BorderSizePixel = 0;
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSansBold;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Action.Text = e.text or "DropDown";
				Action.TextColor3 = Color3.fromRGB(175.00000476837158, 175.00000476837158, 175.00000476837158);
				Action.TextSize = 14;
				Action.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", Action);
				UIPadding.PaddingLeft = UDim.new(0, 20);

				local back = _New_("Frame", DropDown);
				back.BackgroundColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
				back.BorderColor3 = Color3.fromRGB(0, 0, 0);
				back.BorderSizePixel = 0;
				back.Name = "back";
				back.Position = UDim2.new(0.8062803745269775, 0, 0.2309233844280243, 0);
				back.Size = UDim2.new(0, 65, 0, 19);

				local UICorner_0 = _New_("UICorner", back);

				local Container = _New_("Frame", DropDown);
				Container.BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354);
				Container.BackgroundTransparency = 1;
				Container.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Container.BorderSizePixel = 0;
				Container.Name = "Container";
				Container.Position = UDim2.new(0.4667454957962036, 0, 0.9343574643135071, 0);
				Container.Size = UDim2.new(0.5180000066757202, 0, 0, 0);

				local ScrollingFrame = _New_("ScrollingFrame", Container);
				ScrollingFrame.Active = true;
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(14.000000115484, 14.000000115484, 14.000000115484);
				ScrollingFrame.BorderSizePixel = 0;
				ScrollingFrame.Size = UDim2.new(1, 0, 1, 0);
				ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y;
				ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0);
				ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
				ScrollingFrame.ScrollBarThickness = 0;



				local UIPadding_0 = _New_("UIPadding", ScrollingFrame);
				UIPadding_0.PaddingTop = UDim.new(0, 3);

				local UIListLayout = _New_("UIListLayout", ScrollingFrame);
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

				local UICorner_2 = _New_("UICorner", ScrollingFrame);

				local SelectedOption = _New_("TextLabel", DropDown);
				SelectedOption.BackgroundColor3 = Color3.fromRGB(5.000000176951289, 5.000000176951289, 15.000000055879354);
				SelectedOption.BackgroundTransparency = 1;
				SelectedOption.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				SelectedOption.BorderSizePixel = 0;
				SelectedOption.Name = "SelectedOption";
				SelectedOption.Position = UDim2.new(0.8062803745269775, 0, 0.2425638884305954, 0);
				SelectedOption.Size = UDim2.new(0, 65, 0, 18);
				SelectedOption.Font = Enum.Font.SourceSansBold;
				SelectedOption.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SelectedOption.Text = "nil";
				SelectedOption.TextColor3 = Color3.fromRGB(255, 255, 255);
				SelectedOption.TextSize = 14;
				
				local f = false
				Action.MouseButton1Down:Connect(function()
					if f == false then
						f = true
						TweenService:Create(
							Container,
							TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0.518, 0,0, 144)}
						):Play()
						ScrollingFrame.Transparency = 0
					else
						f = false
						TweenService:Create(
							Container,
							TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0.518, 0,0, 0)}
						):Play()

						ScrollingFrame.Transparency = 1

					end
				end)

				for i,v in next,	e.list do


					local DropItem = _New_("TextButton", ScrollingFrame);
					DropItem.BackgroundColor3 = Color3.fromRGB(27.000000290572643, 27.000000290572643, 27.000000290572643);
					DropItem.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
					DropItem.Name = "DropItem";
					DropItem.Size = UDim2.new(0.9472928047180176, 0, -0.0736376941204071, 23);
					DropItem.Font = Enum.Font.SourceSans;
					DropItem.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					DropItem.Text = v;
					DropItem.TextColor3 = Color3.fromRGB(255, 255, 255);
					DropItem.TextSize = 14;

					local UICorner_1 = _New_("UICorner", DropItem);

					DropItem.MouseButton1Down:Connect(function()
						SelectedOption.Text = ""..v
						e.callback(v)

						TweenService:Create(
							Container,
							TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(1.015, 0,0.04, 0)}
						):Play()

						ScrollingFrame.Transparency = 1
						f = false
					end)
				end
				
				
			end
			
			
return z;
		end
		

		

		
		return t;
		
	end
end

return aero;
