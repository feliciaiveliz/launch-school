 
class BeerSong

  def verse(beer)
    verse = ""
    loop do
      if beer == 2
        verse = "#{beer} bottles of beer on the wall, #{beer} bottles of beer.\nTake one down and pass it around, #{beer - 1} bottle of beer on the wall."
      elsif beer == 1
        verse = "#{beer} bottle of beer on the wall, #{beer} bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall."
      elsif beer == 0
        verse = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
      else
        verse = "#{beer} bottles of beer on the wall, #{beer} bottles of beer.\nTake one down and pass it around, #{beer - 1} bottles of beer on the wall."
      end
      break if beer == 0
      beer -= 1
    end
  end
end


