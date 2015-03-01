return Def.ActorFrame{
	BeginCommand=function(self) GAMESTATE:LoadProfiles() end,
	Def.Quad{
		OnCommand=function(self)
			self:xy(_screen.cx,40):setsize(_screen.w,100):diffuse(color("#0088CC")):zoomx(0):bounceend(0.3):zoomx(1)
		end,
		OffCommand=function(self) self:bounceend(0.15):zoomx(0) end
	},
	Font("_star","avenue")..{
		Text=ScreenString("Header"),
		OnCommand=cmd(xy,_screen.cx,50;zoomx,0;bounceend,0.3;zoomx,1),
		OffCommand=function(self) self:bounceend(0.15):zoomx(0) end,
	},
}