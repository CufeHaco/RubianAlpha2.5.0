begin


def check_usr_install
check_usr_dir =Dir.exists?("#{Dir.home}/Rubian/usr")
if check_usr_dir == false
	    puts "Rubian usr Directory not found"
	    @usr_installed = false
		else
		puts "Rubian usr Directory found"
		@usr_installed = true
		end
	end
end

def uninstall_usr
Dir.rmdir("#{Dir.home}/Rubian/usr")

end

def install_usr

Dir.mkdir("#{Dir.home}/Rubian/usr")
end
