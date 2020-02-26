class Customer

    attr_accessor :name, :age, :waiter, :meal, :total, :tip
  
    @@all = []
    def initialize(name, age)
        @name = name 
        @age = age 
        @@all << self
    end

    def self.all 
        @@all 
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
        meal
    end

    def meals
        array_of_meals = []
        Meal.all.each do |meals|
            if meals.customer == self
                array_of_meals.push meals
            end
        end
        array_of_meals
    end

    def waiters
        waiters_array = []
        for i in self.meals 
            waiters_array.push(i.waiter)
        end
        waiters_array
    end





end
