-- F*CK DA METRICS
local p1stats = false
local p2stats = false
if GAMESTATE:IsHumanPlayer(PLAYER_1) then p1stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1) end
if GAMESTATE:IsHumanPlayer(PLAYER_2) then p2stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2) end

local flawless = "TapNoteScore_W1"
local perfect = "TapNoteScore_W2"
local great = "TapNoteScore_W3"
local decent = "TapNoteScore_W4"
local wayoff = "TapNoteScore_W5"
local miss = "TapNoteScore_Miss"
local held = "HoldNoteScore_Held"

local numba = Def.RollingNumbers{
	Font="_star avenue",
	OnCommand=cmd(Load,"RollingNumbersEval";maxheight,20)
}
local starav = Font("_star","avenue")

local t = Def.ActorFrame{	
	Def.Quad{
		Name="header",
		OnCommand=cmd(setsize,_screen.w,100;xy,_screen.cx,0;diffuse,Color.Black;diffusealpha,0.5)
	},
	starav..{ Name="headertext", Text="Results", OnCommand=cmd(xy,_screen.cx,30) },
	-- Judgment texts
	Def.ActorFrame{
		OnCommand=cmd(xy,_screen.cx,-15),
		starav..{ Text="Max Combo", OnCommand=cmd(y,_screen.cy+200;diffuse,JudgmentLineToColor('JudgmentLine_MaxCombo')) },
		starav..{ Text="Held", OnCommand=cmd(y,_screen.cy+170;diffuse,JudgmentLineToColor('JudgmentLine_Held')) },
		starav..{ Text="Miss", OnCommand=cmd(y,_screen.cy+135;diffuse,JudgmentLineToColor('JudgmentLine_Miss')) },
		starav..{ Text="Wayoff", OnCommand=cmd(y,_screen.cy+105;diffuse,JudgmentLineToColor('JudgmentLine_W5')) },
		starav..{ Text="Decent", OnCommand=cmd(y,_screen.cy+76;diffuse,JudgmentLineToColor('JudgmentLine_W4')) },
		starav..{ Text="Great", OnCommand=cmd(y,_screen.cy+42;diffuse,JudgmentLineToColor('JudgmentLine_W3')) },
		starav..{ Text="Perfect", OnCommand=cmd(y,_screen.cy+13;diffuse,JudgmentLineToColor('JudgmentLine_W2')) },
		starav..{ Text="Flawless", OnCommand=cmd(y,_screen.cy-15;diffuse,JudgmentLineToColor('JudgmentLine_W1')) },
	},
}

if GAMESTATE:GetCurrentSong():GetBannerPath() then
	t[#t+1] = Def.Quad{ OnCommand=cmd(setsize,330,110;xy,_screen.cx,125;diffusealpha,0.7;) }
	t[#t+1] = LoadActor(GAMESTATE:GetCurrentSong():GetBannerPath())..{ OnCommand=cmd(xy,_screen.cx,125;zoomto,320,100) }
end

if p1stats then
	t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(y,-15),
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(flawless);xy,_screen.cx-160,_screen.cy-13) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(perfect);xy,_screen.cx-160,_screen.cy+17) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(great);xy,_screen.cx-160,_screen.cy+47) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(decent);xy,_screen.cx-160,_screen.cy+78) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(wayoff);xy,_screen.cx-160,_screen.cy+107) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetTapNoteScores(miss);xy,_screen.cx-160,_screen.cy+137) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:GetHoldNoteScores(held);xy,_screen.cx-160,_screen.cy+170) },
		numba..{ OnCommand=cmd(targetnumber,p1stats:MaxCombo();xy,_screen.cx-160,_screen.cy+200) },
	}
end

return t
