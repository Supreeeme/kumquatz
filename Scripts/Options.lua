function ParticlesTM()
	local t = {
		Name = "TM",
		OneChoiceForAllPlayers=true,
		ExportOnChange=false,
		LayoutType="ShowAllInRow",
		SelectType="SelectOne",
		Choices={"0","25","50","75","100","125","150","175","200"},
		LoadSelections=function(self, list, pn) 
			list[1] = true
		end,
		SaveSelections=function(self, list, pn)
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					write_to_file("TitleMenuParticles.cfg",choice)
				end
			end
		end
	}
	return t
end

function ParticlesPOS()
	return {
		Name = "OS",
		OneChoiceForAllPlayers=true,
		ExportOnChange=false,
		LayoutType="ShowAllInRow",
		SelectType="SelectOne",
		Choices={"0","25","50"},
		LoadSelections=function(self,list,pn)
			list[1] = true
		end,
		SaveSelections=function(self,list,pn)
			for i, choice in ipairs(self.Choices) do
				if list[i] then
					write_to_file("OptionsServiceParticles.cfg",choice)
				end
			end
		end
	}
end
		
