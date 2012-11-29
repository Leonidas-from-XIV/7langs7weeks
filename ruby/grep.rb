#!/usr/bin/env ruby

regex = Regexp.new(ARGV.first)
$stdin.each_line {|l| puts l if regex =~ l}
