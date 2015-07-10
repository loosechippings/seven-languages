#!/usr/bin/ruby

thing_to_match=ARGV.shift

ARGF.each_with_index do |line, index|
	puts "#{index} --> #{line}" if line=~/#{thing_to_match}/
end