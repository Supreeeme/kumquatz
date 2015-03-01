local c
local player = Var "Player"

local no = {}
local function addtono(key,val)
	local wake_up_time = GetTimeSinceStart()+1
	no[key] = val
	if GetTimeSinceStart() < wake_up_time then return end
	no[key] = nil
end

local Pulse = THEME:GetMetric("Combo","PulseCommand")
local PulseLabel = THEME:GetMetric("Combo","PulseLabelCommand")

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom")
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom")
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt")

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom")
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom")

return Def.ActorFrame{
	InitCommand=cmd(vertalign,bottom),
	--flashy stuff
	LoadG("100milestone","Combo")..{ Name="HundredMilestone", },
	LoadG("1000milestone","Combo")..{ Name="ThousandMilestone", },
	
	Font("Common","Numbers")..{
		Name="Number",
		OnCommand=THEME:GetMetric("Combo","NumberOnCommand"),
		ResetCommand=cmd(stoptweening;stopeffect;visible,false)
	},
	Font("Common","Numbers")..{
		Name="Label",
		OnCommand=THEME:GetMetric("Combo","LabelOnCommand"),
		ResetCommand=cmd(stoptweening;stopeffect;visible,false)
	},
	
	InitCommand=function(self)
		c=self:GetChildren()
		c.Number:visible(false)
		c.Label:visible(false)
	end,
	
	ComboMessageCommand=function(self,param)		
		local iCombo = param.Combo or param.Misses
		if not iCombo then return end
		
		c.Number:playcommand('Reset')
		c.Label:playcommand('Reset')
		
		if param.Combo then
			if param.Combo < 2 then return end
			c.Number:visible(true):settext(param.Combo)
			c.Label:visible(true):settext("Combo")
		elseif param.Misses then
			if param.Misses < 2 then return end
			c.Number:visible(true):settext(param.Misses)
			c.Label:visible(true):settext("Misses")
		else return end
		
		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );
		
		param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, LabelMaxZoom );
		
		Pulse(c.Number,param)
		PulseLabel(c.Label,param)
		
		if param.FullComboW1 then
			c.Number:diffuse( JudgmentLineToColor("JudgmentLine_W1") ):glowshift()
		elseif param.FullComboW2 then
			c.Number:diffuse( JudgmentLineToColor("JudgmentLine_W2") ):glowshift()
		elseif param.FullComboW3 then
			c.Number:diffuse( JudgmentLineToColor("JudgmentLine_W3") )
		elseif param.Combo then
			c.Number:diffuse(Color.White)
		else
			c.Number:diffuse(Color.Red)
		end
		
		-- Milestones: 100 - 1000
		--[[if param.Combo % 5 == 0 then
			c.ThousandMilestone:playcommand('Milestone')
		elseif param.Combo % 100 == 0  then
			c.HundredMilestone:playcommand('Milestone')
		end
		]]
	end
}