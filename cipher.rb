#!/usr/local/bin/ruby -w

$key = "beck"

def alpha_to_num(char)
	alpha = 'a'..'z'
	puts alpha.find_index(char.downcase)
end

def encode(str)
	tmp = ""
	while (str.length >= tmp.length)
		tmp += $key
	end
	return tmp[0..str.length-1]
end

a = encode("dog")
puts a