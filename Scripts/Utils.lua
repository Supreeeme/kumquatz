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

function die(self) return MESSAGEMAN:Broadcast("Die") end