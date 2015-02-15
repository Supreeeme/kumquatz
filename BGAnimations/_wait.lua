local time = ...
assert(time, "No wait time specified!")

return Def.Actor{ OnCommand=cmd(sleep,time) }