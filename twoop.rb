class Player
  
  attr_accessor :name
  attr_accessor :lives 
  attr_accessor :gain
  attr_accessor :lose
  attr_accessor :total_losses

#Initializes game and requires a name. Also sets #of lives, and keeps track of number of total losses. 
  def initialize(name)
    @name = name
    @lives = 3
    @total_losses = 0
  end
#Adds a point when user is correct
  def gain
    @lives += 1
  end
#Deducts a point when user is incorrect
  def lose
    @lives -= 1
  end
#Adds 1 to total losses any time a user loses
  def total_losses
    @total_losses += 1
  end
end
