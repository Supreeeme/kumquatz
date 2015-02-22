if GAMESTATE:GetCurrentSong():GetBackgroundPath() then
	return LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{ OnCommand=cmd(Center;zoomto,_screen.w,_screen.h;diffusealpha,0.5) }
else
	return LoadBGA("_bg",color("#0099CA"))
end
