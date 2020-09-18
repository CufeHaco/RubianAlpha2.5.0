begin

@bin_file = [           'about_cmd.rb'          , #0
			'bash_shell_cmd.rb'     , #1
			'cd_cmd.rb'             , #2
			'clear_cmd.rb'          , #3
			'command_list_cmd.rb'   , #4
			'directory.rb'          , #5
			'gem_install_cmd.rb'    , #6
			'install_cmd.rb'        , #7
			'ls_cmd.rb'             , #8
			'nano_cmd.rb'           , #9
			'patch_notes_cmd.rb'    , #10
			'ru_bin.rb'             , #11
			'rubian_help.rb'        , #12
			'rubian_irb.rb'         , #13
			'rusb_cli_cmd.rb'       , #14
			'sudosu_cmd.rb'         , #15
			'sys_update_cmd.rb'     , #16
			'usr_id_cmd.rb'         , #17
			'version_cmd.rb'        , #18
							         ]
							         
def check_bin_install
check_bin_dir =Dir.exists?("#{Dir.home}/Rubian/bin")
if check_bin_dir == false
	    puts "rubian bin directory not found"
	    @bin_installed = false
		else
		@bin_installed = true
		puts "Rubian bin directory found"
		
@file1  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[0]}")
@file2  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[1]}")
@file3  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[2]}")
@file4  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[3]}")
@file5  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[4]}")
@file6  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[5]}")
@file7  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[6]}")
@file8  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[7]}")
@file9  = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[8]}")
@file10 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[9]}")
@file11 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[10]}")
@file12 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[11]}")
@file13 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[12]}")
@file14 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[13]}")
@file15 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[14]}")
@file16 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[15]}")
@file17 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[16]}")
@file18 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[17]}")
@file19 = File.exists?("#{Dir.home}/Rubian/bin/#{@bin_file[18]}")
if @file1||@file2||file3||file4||file5||@file6||@file7||@file8||@file9||@file10||@file11||@file12||@file13||@file14||@file15||file16||@file17||@file18||@file19 == true
		puts "Rubian bin files found"
		@bin_files_installed = true
		end
	end
end							         

def uninstall_bin

File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[0]}" )# if @file1 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[1]}" )# if @file2 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[2]}" )# if @file3 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[3]}" )# if @file4 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[4]}" )# if @file5 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[5]}" )# if @file6 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[6]}" )# if @file7 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[7]}" )# if @file8 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[8]}" )# if @file9 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[9]}" )# if @file10 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[10]}")# if @file11 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[11]}")# if @file12 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[12]}")# if @file13 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[13]}")# if @file14 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[14]}")# if @file15 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[15]}")# if @file16 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[16]}")# if @file17 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[17]}")# if @file18 ==true
File.delete("#{Dir.home}/Rubian/bin/#{@bin_file[18]}")# if @file19 ==true
Dir.rmdir("#{Dir.home}/Rubian/bin") if @bin_installed == true
end
		
		
def install_bin	

Dir.mkdir("#{Dir.home}/Rubian/bin")
	
Dir.chdir("#{Dir.home}/Rubian/bin")

puts "Making #{@bin_file[0]}" ;sleep(1)
file = File.new("#{@bin_file[0]}" , 'w')
file.puts(%q^ #!/usr/bin/env ruby


def about_rubian
	Dir.glob("/home/**/").each_with_index do |value, index|
	a = File.exists?("#{value}about_rubian.rb")
	 if a == true
	 load "#{value}about_rubian.rb"
	  end

	end
end  
				^) ; file.close
				


puts "Making #{@bin_file[1]}" ;sleep(1)
file = File.new("#{@bin_file[1]}" , 'w')
file.puts(%q^ #!/usr/bin/env ruby
require 'io/console'
def bash_shell
	system"gnome-terminal"
	end

  
				^) ; file.close
				


puts "Making #{@bin_file[2]}" ;sleep(1)
file = File.new("#{@bin_file[2]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def cd(dir_path)
		check_dir = Dir.exists?(dir_path)
			if check_dir == true
				Dir.chdir(dir_path)
				system "cd #{dir_path}"
				else
					puts "Directory does not exist or file path is incorrect!"
					end
	end
   
				^) ; file.close
				


puts "Making #{@bin_file[3]}" ;sleep(1)
file = File.new("#{@bin_file[3]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def clear
print `clear`
	end
  
				^) ; file.close
				
puts "Making #{@bin_file[4]}" ;sleep(1)
file = File.new("#{@bin_file[4]}" , 'w')
file.puts(%q^ #!/usr/bin/env ruby

def cmd_list
puts 'about_rubian '.yellow + 'opens about file'.green
puts "bash_shell ".yellow + "enters Bash CLI ".green
puts "cd('argument') ".yellow + "change directory ".green
puts "example:".green
puts 'cd("..") , cd("/home/$USER/Desktop")'.green
puts "clear ".yellow + "clears CLI screen ".green
puts "cmd_list ".yellow + "list all Rubian command methods ".green
puts "find_file('filename') ".yellow + "locate files in $USER directories".green
puts "gem_install('gem name') ".yellow + "install new ruby gems ".green
puts "install('package name') ".yellow + "install new linux software ".green
puts "irb ".yellow + "starts IRB ".green
puts "ls ".yellow + "list files in directory ".green
puts "nano('file name') ".yellow + "starts nano. (if $sudo is active starts as sudo nano) ".green
puts "example:".green
puts "nano('my_file.txt') , nano('/home/$USER/Documents/my_file.txt') ".green
puts "patch_notes ".yellow + "Opens Rubian version patch notes.".green 
puts "update ".yellow + "updates Linux system ".green
puts "user_id ".yellow + "displays logged in user ".green
puts "exit ".yellow + "exits Rubian. ".green
puts "rubian_help ".yellow + "runs help file ".green
puts "rusb ".yellow + "start rusb format and image writer utility".green
puts "start_sudo".yellow + "starts sudo mode".green
puts "stop_sudo".yellow  + "stops sudo mode".green
puts "version ".yellow + "displays Rubian and ruby versions. ".green 

	end  
				^) ; file.close
				

puts "Making #{@bin_file[5]}" ;sleep(1)
file = File.new("#{@bin_file[5]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def boot
@boot = Dir.new("/boot")
end
def bin
@bin = Dir.new("/bin")
end
def cdrom
@cdrom = Dir.new('/cdrom')
end

def dev
@dev = Dir.new('/dev')
end

def etc
@etc = Dir.new('/etc')
end

def media
@media = Dir.new('/media')
end

def mnt
@mnt = Dir.new('/mnt')
end

def opt
@opt = Dir.new('/opt')
end

def sys
@sys = Dir.new('/sys')
end 

def tmp
@tmp = Dir.new('/tmp')
end

def usr
@usr = Dir.new('/usr')
end

def root
 @root = Dir.new("/")
 end

def home
 Dir.home 
 end

def desktop
 @desktop = Dir.new("#{home}/Desktop")
 end

def documents
@documents = Dir.new("#{home}/Documents")
end

def downloads
@downloads = Dir.new("#{home}/Downloads")
end

def music
@music = Dir.new("#{home}/Music")
end

def pictures 
@pictures = Dir.new("#{home}/Pictures")
end

def home_pub
@usr_pub = Dir.new("#{home}/Public")
end

def templates 
@templates = Dir.new("#{home}/Templates")
end

def videos
@videos = Dir.new("#{home}/Videos")
end
 
   
				^) ; file.close
				

puts "Making #{@bin_file[6]}" ;sleep(1)
file = File.new("#{@bin_file[6]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'sudo'


def gem_install(gem_name)
	sudo = Sudo::Wrapper.new
	sudo.start!
	sudo[Kernel].system "gem install #{gem_name}"
	sudo.stop!
end
   
				^) ; file.close
				

puts "Making #{@bin_file[7]}" ;sleep(1)
file = File.new("#{@bin_file[7]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'sudo'


def install(package_name)
	sudo = Sudo::Wrapper.new
	sudo.start!
	sudo[Kernel].system "apt-get install #{package_name}"
	sudo.stop!
end
   
				^) ; file.close
				

puts "Making #{@bin_file[8]}" ;sleep(1)
file = File.new("#{@bin_file[8]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def ls
		if $sudo.running? == true
		puts	Dir.glob("*/").to_s.red.tr('/','') 
		puts Dir.glob("*.*").to_s.blue  + "\n"
		else
		puts	Dir.glob("*/").to_s.green.tr('/','') 
		puts Dir.glob("*.*").to_s.blue  + "\n"
		end
	end
   
				^) ; file.close
				

puts "Making #{@bin_file[9]}" ;sleep(1)
file = File.new("#{@bin_file[9]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby


def nano(file_name)
		if $sudo.running? == true
			$sudo[Kernel].system "nano #{file_name}"
		else
			Kernel.system "nano #{file_name}"
		end
	end
   
				^) ; file.close
				

puts "Making #{@bin_file[10]}" ;sleep(1)
file = File.new("#{@bin_file[10]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def patch_notes

	Dir.glob("/home/**/").each_with_index do |value, index|
	a = File.exists?("#{value}updates.rb")
	 if a == true
	 load "#{value}updates.rb"
	  end

	end
end   
				^) ; file.close
				

puts "Making #{@bin_file[11]}" ;sleep(1)
file = File.new("#{@bin_file[11]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def rubian_bin
 @ru_bin = Dir.new("/home/#{`echo $USER`.chomp}/Rubian/lib/bin")
 end


begin
def load_rubian_bin(file)

a = Dir.glob("/home/**/")
a.each_with_index do |value ,index|
b = File.exists?("#{value}#{file}")

if b == true
@dir_path = Dir.new("#{value}")
@load_path = value + file

#puts "Loading Rubian bin: " + @load_path
#sleep(0.5)
		end
	end
end


bin_file = ['about_cmd.rb'       ,
			'bash_shell_cmd.rb'     , 
			'cd_cmd.rb'             , 
			'clear_cmd.rb'          , 
			'command_list_cmd.rb'   , 
			'directory.rb'          ,
			'gem_install_cmd.rb'    , 
			'install_cmd.rb'        ,
			'ls_cmd.rb'             , 
			'nano_cmd.rb'           ,
			'patch_notes_cmd.rb'    , 
			'rubian_help.rb'        ,
			'rubian_irb.rb'         ,
			'rusb_cli_cmd.rb'       , 
			'sudosu_cmd.rb'         , 
			'sys_update_cmd.rb'     , 
			'usr_id_cmd.rb'         , 
			'version_cmd.rb'        , 
							  ]

load_rubian_bin bin_file[0]
require "#{@load_path}"

load_rubian_bin bin_file[1]
require "#{@load_path}"

load_rubian_bin bin_file[2]
require "#{@load_path}"

load_rubian_bin bin_file[3]
require "#{@load_path}"

load_rubian_bin bin_file[4]
require "#{@load_path}"

load_rubian_bin bin_file[5]
require "#{@load_path}"

load_rubian_bin bin_file[6]
require "#{@load_path}"

load_rubian_bin bin_file[7]
require "#{@load_path}"

load_rubian_bin bin_file[8]
require "#{@load_path}"

load_rubian_bin bin_file[9]
require "#{@load_path}"

load_rubian_bin bin_file[10]
require "#{@load_path}"

load_rubian_bin bin_file[11]
require "#{@load_path}"

load_rubian_bin bin_file[12]
require "#{@load_path}"

load_rubian_bin bin_file[13]
require "#{@load_path}"

load_rubian_bin bin_file[14]
require "#{@load_path}"

load_rubian_bin bin_file[15]
require "#{@load_path}"

load_rubian_bin bin_file[16]
require "#{@load_path}"

load_rubian_bin bin_file[17]
require "#{@load_path}"

end



	end   
				^) ; file.close
				

puts "Making #{@bin_file[12]}" ;sleep(1)
file = File.new("#{@bin_file[12]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'irb'

def irb 
Kernel.system 'irb'
end


#def irb
		
#		 while
#		  IRB.start
#		  begin
#		trap("INT", "DEFAULT")
		
		
		# IRB.irb_at_exit
#		 		  return Rubian_core while IRB.irb_at_exit 
		 		  
		  
		#exec("clear ; ruby /home/$USER/Rubian/lib/rubian")
		
		 
#		end
#		end
		 
#	end
   
				^) ; file.close
				

puts "Making #{@bin_file[14]}" ;sleep(1)
file = File.new("#{@bin_file[13]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def rubian_bin
 @ru_bin = Dir.new("/home/#{`echo $USER`.chomp}/Rubian/lib/bin")
 end


begin
def load_rubian_bin(file)

a = Dir.glob("/home/**/")
a.each_with_index do |value ,index|
b = File.exists?("#{value}#{file}")

if b == true
@dir_path = Dir.new("#{value}")
@load_path = value + file

#puts "Loading Rubian bin: " + @load_path
#sleep(0.5)
		end
	end
end


bin_file = ['about_cmd.rb'       ,
			'bash_shell_cmd.rb'     , 
			'cd_cmd.rb'             , 
			'clear_cmd.rb'          , 
			'command_list_cmd.rb'   , 
			'directory.rb'          ,
			'gem_install_cmd.rb'    , 
			'install_cmd.rb'        ,
			'ls_cmd.rb'             , 
			'nano_cmd.rb'           ,
			'patch_notes_cmd.rb'    , 
			'rubian_help.rb'        ,
			'rubian_irb.rb'         ,
			'rusb_cli_cmd.rb'       , 
			'sudosu_cmd.rb'         , 
			'sys_update_cmd.rb'     , 
			'usr_id_cmd.rb'         , 
			'version_cmd.rb'        , 
							  ]

load_rubian_bin bin_file[0]
require "#{@load_path}"

load_rubian_bin bin_file[1]
require "#{@load_path}"

load_rubian_bin bin_file[2]
require "#{@load_path}"

load_rubian_bin bin_file[3]
require "#{@load_path}"

load_rubian_bin bin_file[4]
require "#{@load_path}"

load_rubian_bin bin_file[5]
require "#{@load_path}"

load_rubian_bin bin_file[6]
require "#{@load_path}"

load_rubian_bin bin_file[7]
require "#{@load_path}"

load_rubian_bin bin_file[8]
require "#{@load_path}"

load_rubian_bin bin_file[9]
require "#{@load_path}"

load_rubian_bin bin_file[10]
require "#{@load_path}"

load_rubian_bin bin_file[11]
require "#{@load_path}"

load_rubian_bin bin_file[12]
require "#{@load_path}"

load_rubian_bin bin_file[13]
require "#{@load_path}"

load_rubian_bin bin_file[14]
require "#{@load_path}"

load_rubian_bin bin_file[15]
require "#{@load_path}"

load_rubian_bin bin_file[16]
require "#{@load_path}"

load_rubian_bin bin_file[17]
require "#{@load_path}"

end   
				^) ; file.close
				

puts "Making #{@bin_file[14]}" ;sleep(1)
file = File.new("#{@bin_file[14]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def rusb


begin
	def load_rusb(file)

		a = Dir.glob("/home/**/")
		a.each_with_index do |value ,index|
		b = File.exists?("#{value}#{file}")

			if b == true
				@dir_path = Dir.new("#{value}")
				@load_path = value + file
				puts "Loading Rubian etc: " + @load_path
				sleep(0.5)
		end
	end
end


rusb_file = ['Rusb_utility.rb']
																			

load_rusb rusb_file[0]
require "#{@load_path}"

end

end   
				^) ; file.close
				

puts "Making #{@bin_file[15]}" ;sleep(1)
file = File.new("#{@bin_file[15]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def start_sudo
$sudo.start!
end

def stop_sudo
$sudo.stop!
end
   
				^) ; file.close
				


puts "Making #{@bin_file[16]}" ;sleep(1)
file = File.new("#{@bin_file[16]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby


def update
		$sudo.start!
		$sudo[Kernel].system "apt-get update"
		$sudo.stop!
	end   
				^) ; file.close
				

puts "Making #{@bin_file[17]}" ;sleep(1)
file = File.new("#{@bin_file[17]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby


def user_id
		if $sudo.running? == true
		puts	$sudo[Kernel].system"echo $USER"
		else
		puts	Kernel.system"echo $USER"
		end
	end   
				^) ; file.close
				

puts "Making #{@bin_file[18]}" ;sleep(1)
file = File.new("#{@bin_file[18]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'colorize'
require_relative '../version.rb'

def version
		
		puts $version.to_s.yellow
puts $ruby_version.to_s.green
puts Time.now.to_s.green
	end   
				^) ; file.close
				


=begin 
file = File.new("#{@_file[00]}" , 'w')
file.puts(%q^   
				^) ; file.close
				
=end
			
	end
	
end
