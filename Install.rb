#!/usr/bin/env ruby
begin
def load_install_files(file)

		a = Dir.glob("/home/**/")
		a.each_with_index do |value ,index|
		b = File.exists?("#{value}#{file}")

		if b == true
		@dir_path = Dir.new("#{value}")
		@load_path = value + file

		puts "Loading install files: " + @load_path
		sleep(0.3)
		end
	end
end


rubian_file = ['rubiancore.rb'     , 
			   'rubianbinfiles.rb' , 
			   'rubianetcfiles.rb' ,
			   'rubiantmp.rb'      ,
			   'rubianuser.rb'     ,
			                        ]

load_install_files rubian_file[0]
require "#{@load_path}"
load_install_files rubian_file[1]
require "#{@load_path}"
load_install_files rubian_file[2]
require "#{@load_path}"
load_install_files rubian_file[3]
require "#{@load_path}"
load_install_files rubian_file[4]
require "#{@load_path}"

end

def check_rubian_install
check_core_install
sleep(1)
check_bin_install
sleep(1)
check_etc_install
sleep(1)
check_tmp_install
sleep(1)
check_usr_install
sleep(1)
end

#=============================================================================================
#---------------------------------------------------------------------------------------------
#=============================================================================================
puts ''
puts '================================================================================'
puts '--------------------------RUBIAN SHELL INSTALLER--------------------------------'
puts '================================================================================'
puts '                    THANK YOU FOR USING RUBIAN ALPHA 2.5.0                      '	
puts '                            THE RUBIAN PROJECT:                                 '
puts '          Rubian(ruby debian shell) is to give a commandline interface          '
puts '                   for ruby programmers and linux users.                        '
puts '             Powerful enough for the most advanced Ruby programmers,            '
puts '                   Easy to use for beginner linux users.                        ' 
puts ''
puts '================================================================================'
sleep(3)
puts "                         #{Time.now}                                            "
puts '                   Checking to see if Rubian is installed...                    '
sleep(1)
check_rubian_install


=begin
if @bin_installed or @etc_installed or @usr_installed or @usr_installed or @core_installed == false

print "Rubian is not installed on this system.  would you like to install?[Y/n]: " ; a = gets.chomp
		if a =~ /Y|y|N|n/
		puts "Beginning install..." ;sleep(1)
		puts "installing Core files..."  ; sleep(1)
		install_core
		puts "Installing bin Files..."   ; sleep(1)
		install_bin
		puts "installing etc files..."   ;sleep(1)
		install_etc
		puts "creating tmp Directory..." ; sleep(1)
		install_tmp
		puts "creating usr Directory..." ; sleep(1)
		install_usr
		puts "Rubian Install complete!" ; sleep(3)
		exit(0)
		end
=end
	
if @bin_installed || @etc_installed || @usr_installed || @usr_installed || @core_installed == true	
		print "Rubian was found on this system. Would you like to uninstall?[Y/n]: " ; @b = gets.chomp
		if @b =~ /Y|y/
		puts "Uninstalling Rubian..."
		sleep(3)
		uninstall_usr
		uninstall_tmp
		uninstall_etc
		uninstall_bin
	    uninstall_core
	    puts "Rubian has been removed."
	    sleep(3)
	    exit(0)
	    end
	    else
	    print "Rubian is not installed on this system.  would you like to install?[Y/n]: " ; @a = gets.chomp
		if @a =~ /Y|y/
		puts "Beginning install..." ;sleep(1)
		puts "installing Core files..."  ; sleep(1)
		install_core
		puts "Installing bin Files..."   ; sleep(1)
		install_bin
		puts "installing etc files..."   ;sleep(1)
		install_etc
		puts "creating tmp Directory..." ; sleep(1)
		install_tmp
		puts "creating usr Directory..." ; sleep(1)
		install_usr
		puts "Rubian Install complete!" ; sleep(3)
		exit(0)
		end
end



