

def part_one()
	file_path = File.expand_path("../input1.txt", __FILE__)
	input = File.read(file_path)
	twos = 0
	threes = 0

	input.split("\n").each do |line|
		counts = Hash.new(0)
		line.each_char do |char|
			counts[char] += 1
		end
		counts = counts.invert
		twos += 1 if counts[2]
		threes += 1 if counts[3]
	end
	checksum = twos * threes
	puts "Solution for part 2 is #{checksum}"
end

part_one

def diff_by_one(s1, s2)
	diff_count = 0
	s1.chars.zip(s2.chars).each do |c1, c2|
		if c1 != c2
			diff_count += 1
			if diff_count > 1
				return false
			end
		end
	end

	if diff_count == 0
		return false
	elsif diff_count == 1
		return true
	else
		return false
	end
end


def common_characters(s1, s2)
	common_chars = ""
	s1.chars.zip(s2.chars).each do |c1, c2|
		if c1 == c2
			common_chars << c1
		end
	end
	return common_chars
end


def part_two()
	file_path = File.expand_path("../input2.txt", __FILE__)
	input = File.read(file_path)
	diff_by_one_chars = Array.new

	input.split("\n").combination(2).to_a.each do |s1, s2|
		if diff_by_one(s1, s2)
			diff_by_one_chars = s1, s2
		end
	end
	solution = common_characters(diff_by_one_chars[0], diff_by_one_chars[1])
	puts "Solution for part 2 is #{solution}"
end

part_two