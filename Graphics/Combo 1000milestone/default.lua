return Def.ActorFrame {
	LoadActor(THEME:GetPathG("Combo","100Milestone"))..{
		OnCommand=function(self)
			local children = self:GetChildren()
			for _,c in ipairs(children) do
				c:glow(Color.Orange)
			end
		end
	}
};
