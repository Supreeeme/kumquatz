local c;
local player = Var "Player";

local JudgeNames = {
	TapNoteScore_W1 = "Flawless!",
	TapNoteScore_W2 = "Perfect!",
	TapNoteScore_W3 = "Great",
	TapNoteScore_W4 = "Decent",
	TapNoteScore_W5 = "Wayoff",
	TapNoteScore_Miss = "Miss",
}

local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "JudgmentMissCommand" );
};

return Def.ActorFrame{
	Def.BitmapText{ Name="Judgment", Font="_star avenue", Text="PLACEHOLDER YO",
	ResetCommand=cmd(stoptweening;stopeffect;visible,false),
	OnCommand=THEME:GetMetric( "Judgment","JudgmentOnCommand" ),
	JudgmentMessageCommand = function(self, params)
		if params.Player ~= player then return end
		if params.HoldNoteScore then return end
		local score = params.TapNoteScore
		if tostring(score) == "TapNoteScore_AvoidMine" then return end
		
		self:playcommand("Reset")
		if score == "TapNoteScore_HitMine" then --4 teh lolz
			self:visible(true):diffuse( JudgmentLineToColor("JudgmentLine_Miss") ):settext("OH GOD"):zoom(1.5):vibrate():effectmagnitude(8,8,8)
			return
		end
		
		self:visible(true):settext(JudgeNames[score])
		JudgeCmds[score](self)
		self:sleep(0.8):linear(0.1):zoomy(0):zoomx(2) --ending commands
	end
	}
}