begin


def check_tmp_install
check_tmp_dir =Dir.exists?("#{Dir.home}/Desktop/Rubian/tmp")
if check_tmp_dir == false
	    puts "Rubian tmp Directory not found"
	    @tmp_installed = false
		else
		@tmp_installed = true
		puts "Rubian tmp Directory found"
		end
	end
end


def uninstall_tmp
Dir.rmdir("#{Dir.home}/Desktop/Rubian/tmp")
end

def install_tmp
Dir.mkdir("#{Dir.home}/Desktop/Rubian/tmp")
end

