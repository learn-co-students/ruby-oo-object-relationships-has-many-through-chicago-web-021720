require 'pry'
class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        self.name = name
        self.age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
        #binding.pry
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        result = self.meals.map do |meal| 
            meal.waiter
        end
        result
    end
    
end