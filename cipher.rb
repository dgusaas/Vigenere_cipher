#!/usr/local/bin/ruby -w
$key = "key"

def c_to_n(c)
	return c.downcase.ord - 97
end

def n_to_c(n)
	return (n + 97).chr
end

def encode(str)
	tmp = ""
	while (str.length >= tmp.length)
		tmp += $key
	end
	tmp_arr = tmp[0..str.length-1].split(//)
	str_arr = str.split(//)
	result = []
	tmp_arr.each_with_index do |x, i|
		result << (c_to_n(tmp_arr[i]) + c_to_n(str_arr[i])) % 26
	end
	result = result.map { |x| n_to_c(x) }
	return result.join()
end

def decode(str)
	tmp = ""
	while (str.length >= tmp.length)
		tmp += $key
	end
	tmp_arr = tmp[0..str.length-1].split(//)
	str_arr = str.split(//)
	result = []
	tmp_arr.each_with_index do |x, i|
		result << (c_to_n(str_arr[i]) - c_to_n(tmp_arr[i])) % 26
	end
	result = result.map { |x| n_to_c(x) }
	return result.join()
end

def key_elim(str, offset)
	str_arr = str.split(//)
	off_arr = str_arr.map { |x| n_to_c(c_to_n(x) + offset)}
	result = []
	str_arr.each_with_index do |x, i|
		result << (c_to_n(str_arr[i]) - c_to_n(off_arr[i])) % 26
	end
	result = result.map { |x| n_to_c(x) }
	return result.join()
end

puts key_elim("abc", 3)

# puts encode("dog") # returns "nse"
# puts decode("nse") # returns "dog"
# puts encode("function") # returns "pylmxgyr"
# puts decode("pylmxgyr") # returns "function"
