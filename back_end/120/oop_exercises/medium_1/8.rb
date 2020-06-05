def points(games)
  score = 0

  games.map! do |game|
    game.split(':')
  end

end

p points(['1:0','2:0','3:0','4:0','2:1','3:1','4:1','3:2','4:2','4:3'])