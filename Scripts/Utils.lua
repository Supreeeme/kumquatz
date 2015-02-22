function Font(name, fam)
	return Def.BitmapText{ Font=name.." "..fam }
end

function LoadBGA(file,args,folder)
	if folder then
		return LoadActor(THEME:GetPathB(folder,file))
	elseif args then
		return LoadActor(THEME:GetPathB("",file),args)
	elseif folder and args then
		return LoadActor(THEME:GetPathB(folder,flie),args)
	else
		return LoadActor(THEME:GetPathB("",file))
	end
end

function LoadG(file, folder)
	if folder then
		return LoadActor(THEME:GetPathG(folder, file))
	end
	
	return LoadActor(THEME:GetPathG("",file))
end

--for ScreenSelectMusic
function die(self) return MESSAGEMAN:Broadcast("Die") end

function msg(m)
	SCREENMAN:SystemMessage(m)
end

function Def.RoundedBox(Width, Height, Color,ye)
	-- code adapted from shakesoda's optical
	-- then re-adapted into it, thanks AJ.
	-- then stolen by YungDaVinci, thanks shake
	assert(Width)
	assert(Height)
	local corner = THEME:GetPathG("","_corner") -- graphic file
	local DefaultColor = color("#FFFFFF")
	-- Color is optional.
	if not Color then Color = DefaultColor end

	--[[
	How it's drawn:
	  c----c
	  OOOOOO
	  c----c

	---- is 8px tall and Width-8 wide. y = (Height/2), flip the bit.
	OOOO is Height-8px tall and Width wide.
	c's x position is Width - 4, flip the bit if needed.
	--]]
	local EdgeWidth = Width-8
	local EdgePosY = (Height/2)
	local CornerPosX = ((Width/2)-4)

	return Def.ActorFrame {
		BeginCommand=function(self)
			if ye then
				self:RunCommandsOnChildren(cmd(diffuse,Color;effectclock,"beat";glowshift))
			else
				self:runcommandsonleaves(cmd(diffuse,Color))
			end
		end,

		-- top
		Def.Quad { InitCommand=cmd(zoomto,EdgeWidth-8,8;y,-EdgePosY) },

		-- middle
		Def.Quad { InitCommand=cmd(zoomto,Width,Height-8) },

		-- bottom
		Def.Quad { InitCommand=cmd(zoomto,EdgeWidth-8,8;y,EdgePosY) },

		 -- top left
		LoadActor(corner)..{ InitCommand=cmd(x,-CornerPosX;y,-EdgePosY) },

		 -- top right
		LoadActor(corner)..{ InitCommand=cmd(x,CornerPosX;y,-EdgePosY;rotationz,90) },

		 -- bottom left
		LoadActor(corner)..{ InitCommand=cmd(x,-CornerPosX;y,EdgePosY;rotationz,-90) },

		 -- bottom right
		LoadActor(corner)..{ InitCommand=cmd(x,CornerPosX;y,EdgePosY;rotationz,180) },
	}
end
