a = (1..16).to_a

puts "'each' solution"
i = 0
a.each do |element|
  puts "#{a[i..i+3].join(" ")}" if i % 4 == 0
  i += 1
end

puts "each_slice solution"
a.each_slice 4 do |elements|
  puts elements.join(" ")
end
