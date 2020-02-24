require_relative 'customer.rb'
require_relative 'meal.rb'
require_relative 'waiter.rb'
class Customer

    attr_accessor :name, :age 
    attr_reader  
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def new_meal(waiter, total, tip=0) 
        Meal.new(waiter, self, total, tip)
    end 

    def meals
        cust_meals = Meal.all.select do |meal|
            meal.customer == self 
        end 
    end 
    
    def waiters
        meals.map do |meal|
        meal.waiter
        end
    end
  
end