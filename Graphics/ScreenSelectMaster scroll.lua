local gc = Var "GameCommand"

return Def.ActorFrame{
	Font("_geosanslight","24px")..{
		Text=gc:GetText(),
		OnCommand=function(self) MESSAGEMAN:Broadcast(gc:GetText()) end,
		GainFocusCommand=cmd(diffuse,Color.Red),
		LoseFocusCommand=cmd(diffuse,Color.White)
	}
}