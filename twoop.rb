class Player
  
  attr_accessor :points :lives

  def initialize(name)
    @name = name
  end

  def points(points)
    @points = points
    #code to fight
  end

  def lives
    @lives = lives 


    #<not sure if necessary> ... could so something like if incorrect, run lose_points method for that specific player, and then end the loop when that player's points == 0 
    self.points -= 1
  end

#below two methods are not necessary because attr_accessor can set the getters and setters
  # this is a getter method:
  # def points
    # @points 

#if decide want to set the above variable myself, need to create a setter method, e.g.
  # def points =(new_points)
  #   @points = new_points
end

bob = Player.new("Bob", 3)
joe = Player.new("Joe", 3)

bob.attack(joe) #would run the second method in the Player class 
#in other file, put this in method: player1 logic logic player 2 and instantiate each player, e.g. player1 = Player.new(name,)