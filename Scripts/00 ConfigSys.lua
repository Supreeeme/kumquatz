-- I can't lua like kyz :(
-- A derpy config system. I would use Kyzentun's, but I'm only saving like 4 things, so...
local save_path = "Save/kumquatz/"

function write_to_file(fname,stuff)
	local handle = RageFileUtil.CreateRageFile()
	if handle:Open(save_path..fname,2) then
		Trace("[ScreenOptionsConfig] Writing to file "..fname.."...")
		handle:Write(stuff)
		handle:Close()
		handle:destroy()
		Trace("[ScreenOptionsConfig] Sucessfully wrote to file "..fname..".")
	else
		local y = handle:GetError()
		Trace("[ScreenOptionsConfig] Couldn't write to file "..fname.." because "..y)
		handle:ClearError()
		handle:Close()
		return false
	end
end

function read_from_file(fname)
	local handle = RageFileUtil.CreateRageFile()
	if handle:Open(save_path..fname,1) then
		local results = handle:Read()
		handle:Close()
		handle:destroy()
		return results
	else
		local y = handle:GetError()
		Trace("Couldn't write to file "..fname.." because "..y)
		handle:ClearError()
		handle:Close()
		return false
	end
end

