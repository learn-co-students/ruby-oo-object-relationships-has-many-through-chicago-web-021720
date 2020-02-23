require_relative 'meal'

class Waiter
  
    attr_reader :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        # Find the meal with the max tip
        max_tip_meal = meals.max_by {|meal| meal.tip}
        # Find the customer associate with that meal
        max_tip_meal.customer
    end

    def self.all
        @@all
    end

end