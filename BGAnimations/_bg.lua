local color = ...

if not color then color = color("#FFFFFF") end

return Def.Quad{
	OnCommand=function(self)
		self:diffuse(color):setsize(_screen.w,_screen.h):Center()
	end
}