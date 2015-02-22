-- Set default stuff
local save_path = "Save/kumquatz/"
if not FILEMAN:DoesFileExist(save_path.."TitleMenuParticles.cfg") then
	write_to_file("TitleMenuParticles.cfg","125")
end
