begin
@etc_file = ['rubian_etc.rb'   ,
			 'Rusb_utiltiy.rb' , 
			 'usb_mounts.rb'   ,
			                    ]

	def check_etc_install
		check_etc_dir =Dir.exists?("#{Dir.home}/Desktop/Rubian/etc")
			
			if check_etc_dir == false
			puts "Rubian etc Directory not found"
			@etc_installed = false	
			else
			@etc_installed = true
			puts "Rubian etc Directory found"
			
	 file1  = File.exists?("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[0]}")
	 file2  = File.exists?("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[1]}")
	 file3  = File.exists?("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[2]}")
			if file1||file2||file3 == true
			puts "Rubian etc files found"
			@etc_files_installed = true
			end
	    end
	end

	
	def uninstall_etc
	 
	 
	 File.delete("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[0]}") 
	 File.delete("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[1]}") 
	 File.delete("#{Dir.home}/Desktop/Rubian/etc/#{@etc_file[2]}") 
	 Dir.rmdir("#{Dir.home}/Desktop/Rubian/etc")
	end			   


	def install_etc
	puts "Making etc Directory" ;sleep(1)
	Dir.mkdir("#{Dir.home}/Desktop/Rubian/etc")
	Dir.chdir("#{Dir.home}/Desktop/Rubian/etc")
	
 puts "Making #{@etc_file[0]}" ;sleep(1)
file = File.new("#{@etc_file[0]}" , 'w')
file.puts(%q^begin
	def load_rubian_etc(file)

		a = Dir.glob("/home/**/")
		a.each_with_index do |value ,index|
		b = File.exists?("#{value}#{file}")

			if b == true
				@dir_path = Dir.new("#{value}")
				@load_path = value + file
				#puts "Loading Rubian etc: " + @load_path
				#sleep(0.5)
		end
	end
end


etc_file = ['usb_mounts.rb']
																			

load_rubian_etc etc_file[0]
require "#{@load_path}"

end   
				^) ; file.close
				


puts "Making #{@etc_file[1]}" ;sleep(1)
file = File.new("#{@etc_file[1]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'colorize'
require 'io/console'
require 'sudo'
require_relative '../etc/usb_mounts.rb'
require_relative '../version.rb'



usb_drives
@mounted_devices = usb_drives.to_a.count
@refresh_drives = usb_drives
@sudo = Sudo::Wrapper.new

@rows, @columns = $stdin.winsize

def format_utility
	
	@format_type = ["Format List:", "VFAT", "NTFS", "LINUX-SWAP"]
   loop do
	print  "-".yellow * (@columns/2) + "\n" + "Media Device Name: ".yellow + "\n"
    print  "slot 1) ".yellow + @usb_list[0] + "\n"
    print  "slot 2) ".yellow + @usb_list[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @usb_list[2] + "\n" if @mounted_devices == 3
    puts "(type 'back' to return to main menu, or 'exit' to close)".yellow
    print "please select Device ny slot number to be formated: " ; @usr_io = gets.chomp
    
             
      if @usr_io.to_i > @mounted_devices.to_i or @usr_io.to_i == 0
      unless @usr_io =~ /back|exit/
      puts invalid
      end
		else
		puts  "you selected " + "#{@usb_list[@usr_io.to_i-1]}".cyan
		print 'Is this correct?[Y/n]: ' ; @confirm = gets.chomp
			if @confirm =~ /Y|y/
				puts "Select Partition Format:".yellow
				print @format_type[0].to_s.yellow + ' 1) ' + @format_type[1].to_s.yellow + ' 2) ' + @format_type[2].to_s.yellow + ' 3) ' + @format_type[3].to_s.yellow  + "\n"
				print "Select Partition: " ; @part_type = gets.chomp
				puts "You selected " + "#{@usb_list[@usr_io.to_i-1]}".cyan + " to format as " + "#{@format_type[@part_type.to_i]}".cyan
				print 'Is this correct?[Y/n]: ' ; @confirm = gets.chomp
					if @confirm =~ /Y|y/
						puts "Caution! You are about to format ".red + "#{@usb_list[@usr_io.to_i-1]}".cyan 
						print 'Continue to format?[Y/n]: ' ; @confirm = gets.chomp
						if @confirm =~ /Y|y/
						print "Format Starting".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow + "\n"
						system "umount #{@root_dir_path[@usr_io.to_i-1]}"
					    puts "mkfs.#{@format_type[@part_type.to_i].downcase} #{@root_dir_path[@usr_io.to_i-1]}"
						@sudo.start!
						@sudo[Kernel].system "mkfs.#{@format_type[@part_type.to_i].downcase} #{@root_dir_path[@usr_io.to_i-1]}"
						@sudo.stop!
						puts "Format Complete!  Please remove device!".yellow
						sleep(3)
						return_rubian
						end
						if @confirm =~ /N|n/
						puts "exiting Rusb Utility"
						sleep(3)
						return_rubian
						end
					end
					if @confirm =~ /N|n/
					end
				
				end
			if @confirm =~ /N|n/
			end
		
		
		
		
		
		
		end
		if @usr_io =~ /back/
			run_utility
			end
			if @usr_io =~ /exit/
			return_rubian
			end
	end	

end

def invalid
puts "Invalid Selection".red
end
def iso_write

@iso_search = Dir.glob("/home/#{`echo $USER`.chomp}/*/*.iso")
	
	if @iso_search.count != 0 
		puts "#{@iso_search.count}".cyan + " .ISO files found on hard drive. ".yellow
		puts "(does not include files saved outside of ".yellow + "#{`echo $USER`.chomp}".cyan + " Directory.)".yellow
		puts @iso_search.to_s.cyan.split
		loop do
		puts "Please Enter path to the Image file you want to Write:".yellow
		puts "(type 'back' to return to main menu, or 'exit' to close)".yellow
		print "Enter File Path: " ; @iso_path = gets.chomp
			
			check_path = File.exists?("#{@iso_path}")
			
			if check_path == true
			print  "-".yellow * (@columns/2) + "\n" + "Media Device Name: ".yellow + "\n"
    print  "slot 1) ".yellow + @usb_list[0] + "\n"
    print  "slot 2) ".yellow + @usb_list[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @usb_list[2] + "\n" if @mounted_devices == 3
    print "please select Device ny slot number to Write Image: " ; @usr_io = gets.chomp
    
    if @usr_io.to_i > @mounted_devices.to_i or @usr_io.to_i == 0 
      puts invalid
		else
		puts  "you selected " + "#{@usb_list[@usr_io.to_i-1]}".cyan
		print 'Is this correct?[Y/n]: ' ; @confirm = gets.chomp
			if @confirm =~ /Y|y/
				if @confirm =~ /Y|y/
				puts "Caution! You are about Write ".red + "#{@iso_path}".cyan + "to ".red + "#{@usb_list[@usr_io.to_i-1]}".cyan 
				print 'Continue to create Image?[Y/n]: ' ; @confirm = gets.chomp
				if @confirm =~ /Y|y/
				print "Writing Image".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow + "\n"
			    puts "dd if=#{@iso_path} of=#{@root_dir_path[@usr_io.to_i-1]} bs=4M && sync"
				@sudo.start!
				@sudo[Kernel].system "dd if=#{@iso_path} of=#{@root_dir_path[@usr_io.to_i-1]} bs=4M && sync"
				@sudo.stop!
				puts "Image Created! Please remove device!".yellow
				sleep(5)
				return_rubian
				end
				if @confirm =~ /N|n/
				end
			end
			if @confirm =~ /N|n/
			end
			
		end
		
	end	
				else 
				unless @iso_path =~ /back|exit/
			puts "Path is incorrect or file doesn't exist.  Please enter full file path.".red
				
				end
			end
			
			if @iso_path =~ /back/
			run_utility
			end
			if @iso_path =~ /exit/
			return_rubian
			end
		end
		else
		
		puts "No .ISO files found in Active User Directories."
		puts "(does not include files saved outside of ".yellow + "#{`echo $USER`.chomp}".cyan + " Directory.)".yellow
		puts "(type 'back' to return to main menu, or 'exit' to close)".yellow
		
		loop do
		puts "Please Enter path to the Image file you want to Write:".yellow
		puts "(type 'back' to return to main menu, or 'exit' to close)".yellow
		print "Enter File Path: " ; @iso_path = gets.chomp
			
			check_path = File.exists?("#{@iso_path}")
			
			if check_path == true
			print  "-".yellow * (@columns/2) + "\n" + "Media Device Name: ".yellow + "\n"
    print  "slot 1) ".yellow + @usb_list[0] + "\n"
    print  "slot 2) ".yellow + @usb_list[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @usb_list[2] + "\n" if @mounted_devices == 3
    print "please select Device ny slot number to Write Image: " ; @usr_io = gets.chomp
    
    if @usr_io.to_i > @mounted_devices.to_i or @usr_io.to_i == 0
      puts invalid
		else
		puts  "you selected " + "#{@usb_list[@usr_io.to_i-1]}".cyan
		print 'Is this correct?[Y/n]: ' ; @confirm = gets.chomp
			if @confirm =~ /Y|y/
				if @confirm =~ /Y|y/
				puts "Caution! You are about Write ".red + "#{@iso_path}".cyan + "to ".red + "#{@usb_list[@usr_io.to_i-1]}".cyan 
				print 'Continue to create Image?[Y/n]: ' ; @confirm = gets.chomp
				if @confirm =~ /Y|y/
				print "Writing Image".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow ; sleep(1) ; print "... ".yellow + "\n"
			    puts "dd if=#{@iso_path} of=#{@root_dir_path[@usr_io.to_i-1]} bs=4M && sync"
				@sudo.start!
				@sudo[Kernel].system "dd if=#{@iso_path} of=#{@root_dir_path[@usr_io.to_i-1]} bs=4M && sync"
				@sudo.stop!
				puts "Image Created! Please remove device!".yellow
				sleep(5)
				return_rubian
				end
				if @confirm =~ /N|n/
				end
			end
			if @confirm =~ /N|n/
			end
		end
		
	end	
				else
			puts "Path is incorrect or file doesn't exist.  Please enter full file path.".red
			end
			
			if @iso_path =~ /back/
			run_utility
			end
			if @iso_path =~ /exit/
			return_rubian
			end
		end
				
		
		
    end	
  
end

def return_rubian
exit(0)
end

def run_utility
system 'clear' ;load "/home/#{`echo $USER`.chomp}/Rubian/lib/usr/Rusb_utility.rb"
end


puts "======================================================================".yellow
puts "++++++++++ #{$version}: Rusb Utility 1.0 ++++++++++".yellow
puts "======================================================================".yellow
puts "                   |  #{Time.now}  |                             ".yellow
puts "                   -------------------------------               ".yellow
puts "                                                                 "
puts "mounted devices: #{@mounted_devices} '(max of 3)'".yellow


if @mounted_devices  == 0
	loop do
	puts "No mounted devices present. Please plug in a USB drive and refresh or exit."
	puts "1) Refresh devices. ".yellow
	puts "2) return to Rubian CLI. ".yellow
	puts "3) Exit. ".yellow
	print "Make a selection 1-3: " ; $usr_io = gets.chomp
	
	if $usr_io =~ /1/
	 run_utility
	 end
	 
	if $usr_io =~ /2/
	return_rubian
	end
	
	if $usr_io =~ /3/
	exit(0)
	end
	
end
	
 else	
	
 	print  "-".yellow * (@columns/2) + "\n" + "Media Device Name: ".yellow + "\n"
    print  "slot 1) ".yellow + @usb_list[0] + "\n"
    print  "slot 2) ".yellow + @usb_list[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @usb_list[2] + "\n" if @mounted_devices == 3
 	print  "-".yellow * (@columns/2) + "\n" + "Mount Location: ".yellow + "\n"
 	print  "slot 1) ".yellow + @root_dir_path[0] + "\n"
    print  "slot 2) ".yellow + @root_dir_path[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @root_dir_path[1] + "\n" if @mounted_devices == 3
    print  "-".yellow * (@columns/2) + "\n" + "Device Info: ".yellow + "\n"
 	print  "slot 1) ".yellow + @drive_partition[0] + "\n"  
    print  "slot 2) ".yellow + @drive_partition[1] + "\n" if @mounted_devices == 2
    print  "slot 3) ".yellow + @drive_partition[1] + "\n" if @mounted_devices == 3
    print  "-".yellow * (@columns/2) + "\n" + "Utility Options: ".yellow + "\n"
    puts   "===== PLEASE READ CAREFULLY!=====".yellow
    puts   "1) REFRESH USB DRIVES".yellow
    puts   "2) FORMAT".yellow
    puts   "3) IMAGE WRITER".yellow
    puts   "4) EXIT UTILITY".yellow
    
    loop do
    print   "Make a selection 1-4: " ; $usr_io = gets.chomp
			
			if $usr_io =~ /1/ 
			run_utility
			#$usr_io.clear
			end
			
			if $usr_io =~ /2/
			format_utility
			#$usr_io.clear
			end
			  
			if $usr_io =~ /3/
			iso_write
			#$usr_io.clear
			end
			
						
			if $usr_io =~ /4/
			 exit(0) 
		    #$usr_io.clear
		    end	 
		    
		    if $usr_io !~ /1|2|3|4/
		    puts invalid
		    end
		    
		    break if $usr_io =~ /2|3/ 
 	
 	end
 	
 	
 end

   
				^) ; file.close
				


 puts "Making #{@etc_file[2]}" ;sleep(1)
file = File.new("#{@etc_file[2]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

def usb_drives
		@a = `mount|grep /media|awk '{print $3}'`.length
		@b = `mount|grep /media|awk '{print $1}'`.length
		@c = `mount|grep /media|awk '{print $5}'`.length
		
		if @a == 0
		@usb_list = []
		end
		if @a > 0
		@usb_list = `mount|grep /media|awk '{print $3}'`.split
		end
		
	if @b == 0
	@root_dir_path = []
  end
 if @b > 0
 @root_dir_path = `mount|grep /media|awk '{print $1}'`.split
 end
 
	if @c == 0
	@drive_partition = []
	end
	if @c > 0
	@drive_partition  = `mount|grep /media|awk '{print $5}'`.split
	end
 end   
				^) ; file.close
				
	
end		   
			   
end
