#!/usr/local/bin/ruby -w
$key = "key"
$target = "coliwicojqkwbjplvwffjvapvjuikicomitxrxnemtbefickmpeitfoohesnojwxcgrddvkhitesnnafxjhhfhxxvxbmxvgpvjuikgcemifgsbapagoqympzgvmhggzzclgksdjqgthbytkgubbshlcnnspxufwxnrfbytkgusjtrbbhjxorqijqdxfexstmwtbsoxjjbmvhfjvyvmssnhvtdqrrithnhgjtacnvfhcsxrnrhirwcgroxxjbbhvstxoimmumwolxnrwsnqgfpfamvpotrrvascuicdrflioussjrfxodqwgiosjxgwmjwkgfpfaathihqxkmghqsumiqxrvasgusqksbpitemjfmuaseclgfcsasyoojwpabvbmwqnuicxqucsasyyfpvqaucptwunfdneuxcgbstkcxbstkcxostmvfusumzfwstxtpaxjxfbaicgrsjhktbuvekwsoflqfhinepzsmbrcfsmnrqksojqgestblgksgxvgossvstx"
$letter_frequency = {a: 0.08167, b: 0.01492, c: 0.02782, d: 0.04253, e: 0.12702, f: 0.02228,
					 g: 0.02015, h: 0.06094, i: 0.06966, j: 0.00153, k: 0.00772, l: 0.04025,
					 m: 0.02406, n: 0.06749, o: 0.07507, p: 0.01929, q: 0.00095, r: 0.05987,
					 s: 0.06327, t: 0.09056, u: 0.02758, v: 0.00978, w: 0.02361, x: 0.00150,
					 y: 0.01974, z: 0.00074}


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

############################# DECRYPTION ##############################
#https://www.rosettacode.org/wiki/Letter_frequency#Ruby
#Made a guess on the size of the key after checking several of the possible key lengths

#Takes a letter and returns it's frequency in the english alphabet
def frequency(letter)
	return $letter_frequency[:letter]
end

#Takes a frequency as a decimal and returns a letter closest to that frequency
def letter(freq)
	vals = $letter_frequency.values
	if vals.index(freq) != nil
		return $letter_frequency.key(freq)
	else
		differences = []
		vals.each do |x|
			differences << (x - freq).abs
		end
		min = differences.min
		index_of_min = differences.index(min)
		freq = vals[index_of_min]
		return $letter_frequency.key(freq)
	end
end 

#Takes an string and a number (n), returns an array of arrays where the string is paritioned into
#arrays of size n
def segment(str, key_len)
	str_arr = str.split(//)
	parts = str_arr.each_slice(key_len).to_a
	return parts
end

#Takes and array and an item and returns the number of times that item appears in the array
def count(arr, item)
	arr.count { |x| x == item }
end

#Takes an array of arrays and returns the letter frequency for each letter of the sub-arrays
def freq_calc(mult_arr)
	result_arr = []
	subarrs_by_index = reorder_on_index(mult_arr)
	subarrs_by_index.uniq.each do |arr|
		arr.uniq.each do |letter|
			result_arr << {letter => (count(arr, letter))}
		end
		p arr.uniq
	end
	return result_arr
end

#Takes an array of arrays, an index, and returns an array that countains the values of the sub-arrays at that index
#Ex- collapse([[2, 3, 4], [5, 2, 120], [-3, 12, 84]], 0) == [2, 5, -3]
def collapse(mult_arr, index)
	result = []
	mult_arr.each_index do |i|
		result << mult_arr[i][index] 
	end
	return result
end

def reorder_on_index(mult_arr)
	result = []
	mult_arr.each_index do |i|
		size = mult_arr[0].length
		result	<< collapse(mult_arr, i) if i < size
		#The above if is to prevent the creation of arrays with nil when the number of sub arrays,
		#is greater than the individual size of each sub array
	end
	return result
end

p reorder_on_index(segment("ababcdcd", 2))
p freq_calc(segment("ababcdcd", 2))
p [1, 3, 4, 2, 4, 1, 3, 2].uniq








































