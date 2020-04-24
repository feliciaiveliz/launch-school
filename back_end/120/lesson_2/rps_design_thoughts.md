## Compare this design with the one in the previous assignment

Questions:

1. is this design, with Human and Computer sub-classes, better? Why, or why not?
2. what is the primary improvement of this new design?
3. what is the primary drawback of this new design?

Answers: 

1. I think having subclasses is better. This way we can seperate the tasks for each player to make it more clear and organized. We can also see from looking at the initialize method what is clearly happening. It gets rid of having to use if/else statements within a method. Since it is seperated into 'human' and 'computer' classes, each player can have their own methods that take care of their owns tasks without having one method that does multiple things.

2. The primary improvement is creating subclasses from 'Player', which splits the logic/work into the two player subclasses. This way we don't have one general method that has to take care of both players.
3. Each subclasse's methods only worry about their player. It makes it easier when we call the method, knowing who the method is dealing with.
To be quite honest, I'm not sure of any drawbacks yet. 

1. The improvement is that the logic that was previously in the display winner method is now moved to its own class.

2. This makes it clear what the class is about and doing. Downside is that it starts to get confusing on what certain methods do or what variables actually represent.