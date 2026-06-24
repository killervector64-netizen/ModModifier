local Bridge = GameMain:GetMod("Jai_HotkeyAdapter")
...
...
if Bridge ~= nil then
	Bridge:register("Mod Name", "Function Name",
		function()
			-- This is executed when the user taps on this feature
		end
	)
end
