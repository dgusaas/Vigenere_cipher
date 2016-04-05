#!/usr/local/bin/ruby -w
$key = "key"
$target = "coliwicojqkwbjplvwffjvapvjuikicomitxrxnemtbefickmpeitfoohesnojwxcgrddvkhitesnnafxjhhfhxxvxbmxvgpvjuikgcemifgsbapagoqympzgvmhggzzclgksdjqgthbytkgubbshlcnnspxufwxnrfbytkgusjtrbbhjxorqijqdxfexstmwtbsoxjjbmvhfjvyvmssnhvtdqrrithnhgjtacnvfhcsxrnrhirwcgroxxjbbhvstxoimmumwolxnrwsnqgfpfamvpotrrvascuicdrflioussjrfxodqwgiosjxgwmjwkgfpfaathihqxkmghqsumiqxrvasgusqksbpitemjfmuaseclgfcsasyoojwpabvbmwqnuicxqucsasyyfpvqaucptwunfdneuxcgbstkcxbstkcxostmvfusumzfwstxtpaxjxfbaicgrsjhktbuvekwsoflqfhinepzsmbrcfsmnrqksojqgestblgksgxvgossvstx"

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

# puts encode("dog") # returns "nse"
# puts decode("nse") # returns "dog"
# puts encode("function") # returns "pylmxgyr"
# puts decode("pylmxgyr") # returns "function"

def blah(str)
	str_arr = str.split(//)
	guess = 6
	start = 0
	tmp_arr = []
	while (start != 6)
		tmp_arr << str_arr[0][start]
		for i in start..str_arr.length
			if (i + 1) % guess == 0
				tmp_arr << str_arr[start][i]
			end
		end
		start += 1
	end
	puts tmp_arr[0][1]
end

blah("daltondaltondaltondalton")

# def generate_structure(str)
# 	str_arr = str.split(//)
# 	str_fake = []
# 	str_arr.each_with_index do |x, i|
# 		str_fake[i] = []
# 		for j in 0..(str_arr.length -  1) - i
# 			str_fake[i][j] = str_arr[j]
# 		end
# 	end
# 	puts str_fake[2][3]
# 	return str_fake
# end
#
# # puts generate_fake_hash("key").instance_of? nil
#
# def coincidences(str)
# 	tmp = generate_fake_hash(str)
# 	length = str.length
#   counts = []
# 	for i 0..length - 1
# 		arr[i][j]
# 	end
# end
