Branch[#Branch+1] = function AfterSelectMusic()
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return SelectFirstOptionsScreen()
		else
			return "ScreenGameplay"
		end
	end