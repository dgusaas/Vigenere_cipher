#!/usr/local/bin/ruby -w

key = 'beck'

def alpha_to_num(char)
	alpha = 'a'..'z'
	puts alpha.find_index(char.downcase)
end

def encode(w, k)
	
end

a = 'beck'.split(/(\w)/)

a = a.drop(2)
puts a
