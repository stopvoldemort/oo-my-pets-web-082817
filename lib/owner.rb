require 'pry'
require_relative './cat'
require_relative './dog'
require_relative './fish'

class Owner

  OWNERS = []

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(name=nil)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    OWNERS << self
  end

  def self.all
    OWNERS
  end

  def self.reset_all
    OWNERS.clear
  end

  def self.count
    OWNERS.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def play_with_cats
    self.pets[:cats].map { |cat| cat.mood = "happy" }
  end

  def feed_fish
    self.pets[:fishes].map { |fish| fish.mood = "happy" }
  end

  def walk_dogs
    self.pets[:dogs].map { |dog| dog.mood = "happy" }
  end

  def sell_pets
    self.pets.each do |species, array|
      array.each do |pet|
        pet.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    number_of_fish = self.pets[:fishes].length
    number_of_dogs = self.pets[:dogs].length
    number_of_cats = self.pets[:cats].length
    "I have #{number_of_fish} fish, #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end



end
