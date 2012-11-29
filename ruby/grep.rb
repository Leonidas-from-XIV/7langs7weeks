#!/usr/bin/env ruby

regex = Regexp.new(ARGV.first)
STDIN.each_line {|l| puts l if regex =~ l}
