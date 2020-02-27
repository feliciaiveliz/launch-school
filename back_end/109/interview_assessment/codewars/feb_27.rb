def solution(str)
  pairs = []
  if str.size.even?
    until str.empty?
      pairs << str.slice!(0..1)
    end
  else
    underscore = str.slice!(-1) << '_'
    until str.empty?
      pairs << str.slice!(0..1)
    end
    pairs << underscore
  end
  pairs
end

p solution('abcdef')
p solution('abcde')