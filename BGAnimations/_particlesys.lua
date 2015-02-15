--Hey look, a particle system
function create_actors(num, sr)
	local cur = 0
	local t = {}
	--num is the number to create, sr is the starting ranges (table)
	--cur is the number of current created actors
	while cur < num do
		local da, zoom = math.random(1, 5), math.random(1, 4)
		if da > 1 then
			da = da/6
		end
		if zoom then
			zoom = zoom/10
			if zoom > 0.75 then
				zoom = zoom/1.3
			end
		end
		t[#t+1] = LoadG("thing")..{
			InitCommand=cmd(zoom,0),
			OnCommand=function(self)
				self:queuecommand('Update')
			end,
			UpdateCommand=function(self)
				local function movement()
					self:xy(sr[math.random(#sr)], math.random(500,950)):zoom(zoom):diffuse(color("#0FF00F")):diffusealpha(da)
					self:linear(math.random(1, 7))
					self:y(-100)
				end
				
				movement()
				
				if self:GetY() == -100 then
					movement()
				end
				
				self:queuecommand("On")
			end,
			DieMessageCommand=cmd(stoptweening)
		}
		cur = cur + 1
	end
	
	return t
end

svals, s= {}, 0
 while s <= 50 do 
	svals[#svals+1] = math.random(900)
	s = s+1
end