#!/usr/bin/ruby

class Test
  def initialize(pattern, output_filename)
    @pattern = pattern
    @output_filename = output_filename
    puts @filename
  end

  def wrtFile(filename)
    File.open @output_filename, 'w' do |f|
      f.puts "Info from File:: #{filename}"
      f.puts "Data matching group 1 of RE Pattern:: #{@pattern.inspect}\n"

      IO.foreach filename do |line|
        f.puts " #{$1}" if line =~ @pattern
      end
    end
  end
end

Test.new(/^\/\*\s*(.*?)\s*\*\/$/, "NameOfRules.txt").wrtFile("question9.c")
