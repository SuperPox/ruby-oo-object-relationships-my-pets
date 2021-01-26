require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def name
    @name
  end

  def species
    @species
  end

  def say_species
    return "I am a human."
  end

  def cats
    Cat.all.select {|i| i.owner == self}
  end

  def dogs
    Dog.all.select {|i| i.owner == self}
  end

  def buy_cat(catToBuy)
    newCat = Cat.new(catToBuy, self)
  end

  def buy_dog(dogToBuy)
    newDog = Dog.new(dogToBuy, self)
  end

  def walk_dogs
    Dog.all.each do |i|
      i.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |i|
      i.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.each do |i|
      i.owner = nil
      i.mood = "nervous"
    end
    Cat.all.each do |i|
      i.owner = nil
      i.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end