class Waiter
    attr_accessor :name, :years
    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper

        # go over <=> syntax for max method
        best_tip_meal = Meal.all.max do |a, b|
            a.tip <=> b.tip
        end
        best_tip_meal.customer
    end

end