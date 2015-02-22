dofile(THEME:GetPathB("","_particlesys.lua"))
local num = tonumber(read_from_file("TitleMenuParticles.cfg"))
local t = Def.ActorFrame{
	Def.ActorFrame( create_actors(num, svals) ),
	LoadActor("kumquatz")..{ OnCommand=cmd(xy,_screen.cx,200) },
}
return t
