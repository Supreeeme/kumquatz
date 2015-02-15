local gc = Var "GameCommand"

return Def.ActorFrame{ -- Because of BitmapText color glitch
	Font("_geosanslight","24px")..{
		Text = Screen.String(gc:GetName().."Text"),
		GainFocusCommand=cmd(linear,0.1;diffuse,color("#FFFFFF");zoom,1.5),
		LoseFocusCommand=cmd(stoptweening;linear,0.1;diffuse,color("#444444");zoom,1),
	}
}