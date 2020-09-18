begin

@rubian_file = ['about_rubian.rb'     , 
			    'rubian'              ,
				'version.rb'	      ,				 
				'LICENSE.txt'         ,					 
				'updates.rb'          ,
	                        'rubian.desktop'      ,
									   ]

def check_core_install
check_rubian_dir =Dir.exists?("#{Dir.home}/Rubian")
if check_rubian_dir == false
		puts "Rubian Directory not found"
		@core_installed = false
		else
		@core_installed = true
		puts "Rubian Directory found"
file1  = File.exists?("#{Dir.home}/Rubian/#{@rubian_file[0]}")
file2  = File.exists?("#{Dir.home}/Rubian/#{@rubian_file[1]}")
file3  = File.exists?("#{Dir.home}/Rubian/#{@rubian_file[2]}")
file4  = File.exists?("#{Dir.home}/Rubian/#{@rubian_file[3]}")
file5  = File.exists?("#{Dir.home}/Rubian/#{@rubian_file[4]}")	

	if file1||file2||file3||file4||file5 == true
		puts "Rubian core file found"
		end
	end
end

	def uninstall_core


File.delete("#{Dir.home}/Rubian/#{@rubian_file[0]}") 
File.delete("#{Dir.home}/Rubian/#{@rubian_file[1]}") 
File.delete("#{Dir.home}/Rubian/#{@rubian_file[2]}") 
File.delete("#{Dir.home}/Rubian/#{@rubian_file[3]}")
File.delete("#{Dir.home}/Rubian/#{@rubian_file[4]}")
Dir.rmdir("#{Dir.home}/Rubian")
	end

	def install_core

	puts "Making Rubian Directory" ;sleep(1)
	Dir.mkdir("#{Dir.home}/Rubian")
	Dir.chdir("#{Dir.home}/Rubian")
	
puts "Making #{@rubian_file[0]}" ;sleep(1)
file = File.new("#{@rubian_file[0]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby
require 'colorize'

puts "          RUBIAN PROJECT".cyan
puts "Ruby Command Line for Debian Linux.".cyan
puts '==================================='.yellow
puts ''
puts 'Rubian started its life as a personal script'
puts "to navigate irb easier.  irb itself can be used"
puts "as a linux shell, however it doesn't come with"
puts "methods for easy directory navigation or running"
puts "Kernel commands."

puts "Traditional ruby way in irb:".cyan
puts "Dir.chdir('/dir/tree'), Dir.mkdir('/dir/tree/new_dir')".yellow
puts "Kernel.system 'echo $USER' , system 'echo $USER', `echo $USER`".yellow

puts "I took what ruby had to offer and shortened the process."
puts "Rubian methods:".cyan
puts "cd '/home/cufe/desktop' , cd desktop , cd home ".yellow

puts "Taking it a step further, I created methods to shorten"
puts "kernel commands."
puts "Default Bash shell:".cyan
puts "sudo apt-get install cool-program".yellow
puts "Rubian Shell:".cyan
puts "install 'cool-program'".yellow
puts "Rubian is now a stand-alone shell.  It is designed"
puts "for simplicity for beginner linux users as well as"
puts "advanced ruby programmers.  Not only does it offer it's personal"
puts "methods, but also has the full scope of the Ruby Interpreter."
puts "Irb can be called inside just like the Bash shell,"
puts "and the bash shell can be called just like irb!"
puts ''
puts "Thank you for using Rubian."
puts "Rubian was created and written by".yellow
puts "Cufe Bvnkedv".yellow
puts "(Choof-ie Bun-ke-duh)".yellow
   
				^) ; file.close
				


puts "Making #{@rubian_file[1]}" ;sleep(1) 
file = File.new("#{@rubian_file[1]}" , 'w')
file.puts(%q^#!/usr/bin/env ruby

begin
	class UpdateProcessTitle

		def initialize(app)
			@app = app
		end

		def call(env)
			title = $0
			$0 = $0 + "rubian"
			status, headers, body = @app.call(env)
			$0 = Title
			[status, headers, body]
		end
	end
	

	require 'io/console'
	require 'open3'
	require 'colorize'
	require 'readline'
	require 'sudo'

	$sudo = Sudo::Wrapper.new

	def load_rubian_files(file)

		a = Dir.glob("/home/**/")
		a.each_with_index do |value ,index|
		b = File.exists?("#{value}#{file}")

		if b == true
		@dir_path = Dir.new("#{value}")
		@load_path = value + file

		puts "Loading Rubian core: " + @load_path
		sleep(0.3)
		end
	end
end


rubian_file = ['version.rb'     , 
			   'rubian_etc.rb'  , 
			   'ru_bin.rb'      ,  ]

load_rubian_files rubian_file[0]
require "#{@load_path}"
load_rubian_files rubian_file[1]
require "#{@load_path}"
load_rubian_files rubian_file[2]
require "#{@load_path}"
#load_rubian_files rubian_file[3]
#require "#{@load_path}"


end

begin
puts $version.to_s.yellow
puts $ruby_version.to_s.green
puts Time.now.to_s.green
end

 

module Rubian_core

Process.setproctitle("rubian")
$0 = 'rubian'

	def find_file(file)
	homedir_array = Dir.glob("/home/**/")
	homedir_array.each_with_index do |value ,index|
	a = File.exists?("#{value}#{file}")

		if a == true
		@dir_path = Dir.new("#{value}")
		@load_path = value + file
		puts '@load_path: '.yellow + @load_path
		print '@dir_path: '.yellow  ;  p @dir_path
		end
	end
end

	


	def pwd
		Dir.pwd
	end


	def prompt 
			if $sudo.running? == true 
			"#{pwd}==> ".red
				else
			"#{pwd}==> ".green
			end
					
	end
 
 end

 
 
	
		stty_save = `stty -g`.chomp
		
	
    
		



include Rubian_core
	bnd = TOPLEVEL_BINDING
	
	while input = Readline.readline("#{Rubian_core.prompt}", true)
          
		begin

			result = bnd.eval(input)  
			
			 ("#{result} \n") ; STDOUT.flush
		       
		        trap("INT", "DEFAULT"  )  {system"stty", stty_save ;  return input }
		        
		       
		        
		         
		         
		rescue  => e  
			puts e.message
 
		rescue SyntaxError => e
			puts e.message
 
		rescue LoadError => e
			puts e.message
	   
	   rescue SignalException => e
	   
			puts e.message
			
	   rescue Exception => e
	   puts e.message
				break if input == 'exit'
			end
			  
		end
	   
				^) ; file.close
				

puts "Making #{@rubian_file[2]}" ;sleep(1)
file = File.new("#{@rubian_file[2]}" , 'w')
file.puts(%q^ #!/usr/bin/env ruby
require 'colorize'


module RUBIAN
	$version = "RUBIAN ALPHA VERSION 2.5"
    $ruby_version = "#{`ruby -v`.chomp}"
    
  class Error < StandardError; end
    



end
  
				^) ; file.close
				

puts "Making #{@rubian_file[3]}" ;sleep(1)
file = File.new("#{@rubian_file[3]}" , 'w')
file.puts(%q^The MIT License (MIT)

Copyright (c) 2019 TODO: Write your name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.   
				^) ; file.close
				
	end
	

Dir.chdir("/usr/share/applications")
	
puts "Making #{@rubian_file[4]}" ;sleep(1)
file = File.new("#{@rubian_file[4]}" , 'w')
file.puts(%q^Encoding=UTF-8
Version=Beta 1.0
Name=Rubian Alpha 2.5.0
Comment=Rubian Shell
Categories=Utility;Development;Network
Type=Application
Terminal=false
Exec=ruby /home/#{`echo $USER`.chomp}/Rubian/rubian
Icon= /home/#{`echo $USER`.chomp}/RubianAlpha2.5.0/icons/rubyicon.png

   
				^) ; file.close
				
	end
end
