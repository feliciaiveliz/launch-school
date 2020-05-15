## RPS Bonus Features Notes

Below are some ideas for features or additions to our Rock, Paper, Scissors game.

- Keeping Score

Right now, the game doesn't have very much dramatic flair. It'll be more interesting if we were playing up to, say, 10 points. Whoever reaches 10 points first wins. Can you build this functionality? We have a new noun -- a score. Is that a new class, or a state of an existing class? You can explore both options and see which one works better.

```ruby
class Score
end
```

or 

```ruby
class ScoreKeeping
  def initialize(score)
    @score = 0
  end
end

