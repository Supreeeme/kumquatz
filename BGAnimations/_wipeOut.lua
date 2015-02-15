local time = ...
assert(time)

return Def.Quad{
	OnCommand=function(self)
		self:xy(_screen.cx,_screen.cy):setsize(_screen.w,_screen.h):diffuse(color("#0099CC"))
		self:croptop(1):fadetop(1):linear(time):croptop(0):fadetop(0)
	end
}