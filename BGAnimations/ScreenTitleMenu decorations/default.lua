dofile(THEME:GetPathB("","_particlesys.lua"))
return Def.ActorFrame{
	Def.ActorFrame(create_actors(125, svals)),
	LoadActor("kumquatz")..{ OnCommand=cmd(xy,_screen.cx,200) },
}
	