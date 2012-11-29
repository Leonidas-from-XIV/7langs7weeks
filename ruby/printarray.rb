a = (1..16).to_a

puts "'each' solution"
i = 0
a.each do |element|
  puts "#{a[i]} #{a[i+1]} #{a[i+2]} #{a[i+3]}" if i % 4 == 0
  i += 1
end

puts "each_slice solution"
a.each_slice 4 do |elements|
  puts elements.join(" ")
end
