class Waiter
    attr_accessor :name, :years

    @@all = []
    
    def initialize(name, years)
        self.name = name
        self.years = years
        @@all << self
    end

    #needs to see all the meals for 
    #isolate the meals that a
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        highest_tip = 0
        result = nil
        Meal.all.each do |meal|
            if meal.tip > highest_tip
                highest_tip = meal.tip
                result = meal.customer
            end
        end
        result
    end
end