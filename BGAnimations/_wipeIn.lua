local time = ...
assert(time)

return Def.Quad{
	OnCommand=function(self)
		self:xy(_screen.cx,_screen.cy):setsize(_screen.w,_screen.h):diffuse(color("#0099CC"))
		self:cropbottom(0):fadebottom(0):linear(time):cropbottom(1):fadebottom(1)
	end
}