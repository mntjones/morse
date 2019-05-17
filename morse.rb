# Code Challenge from SharesPost - Qualified 
# Morse Code

=begin
	
The challenge is that when receiving a message in morse code, some of the dots or dashes are not clear
and are replaced with a '?'.
To keep the challenge reasonable, assume only letters with three or fewer characters are unclear.

Write a method that, when given a word, returns an array with the possible letters it could be.
	
=end

def morse (letter)

	valid_letters = {
		"E" => ".",
		"T" => "-", # one char
		"A" => ".-",
		"I" => "..",
		"M" => "--",
		"N" => "-.", # two chars
		"D" => "-..",
		"G" => "--.",
		"K" => "-.-",
		"O" => "---",
		"R" => ".-.",
		"S" => "...",
		"U" => "..-",
		"W" => ".--"	# three chars
	}

	possibilities = {}

	valid_letters.each do |k,v|
		if v == letter
			return k # assumes no ?
		end

		if letter.length == v.length
			possibilities[k] << v # adds all possible letters that meet length of word
		end
	end

	if possibilities.length == 2
		return ["E", "T"]
	elsif possibilities.length == 4
		return two_char(letter)
	else
		return three_char(letter, possibilities)
	end
end

def two_char(letter)
	i = (0 ... letter.length).find_all { |ind| s[ind] == '?' }
	pos_let = []

	if i.length == 2
		return ["A", "I", "M", "N"]
	elsif i[0] == 0 && letter.split('').include?('.')
		return ["I", "N"]
	elsif i[0] == 0 
		return ["A", "M"]
	elsif i[0] == 1 && letter.split('').include?('.')
		return ["A", "I"]
	else
		return ["M", "N"]
	end
end

# possible to replace ? in target letters and then match like that?
def three_char(letter, letter_hash) # letter hash of 8 values
	i = (0 ... letter.length).find_all { |ind| s[ind] == '?' } # Index # of ?s
	pos_let = []
	mod_let_hash = {}

	letter_hash.each do |k, v|
		v_arry = v.split('')
		i.each do |ind|
			v_arry[ind] == '?'
		end
		v_arry.join
		mod_let_hash[k] = v_arry
	end

	mod_let_hash.each do |k,v|
		if v == letter
			pos_let << k
		end
	end
	pos_let
end






