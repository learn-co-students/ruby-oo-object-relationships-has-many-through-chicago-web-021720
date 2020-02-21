class Waiter
    attr_accessor :name, :yrs_experience
    attr_reader

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, yrs)
        @name = name
        @yrs_experience = yrs
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.find_all { |meal| meal.waiter == self }
    end

    def best_tipper
        self.meals.max_by { |meal| meal.tip }.customer
    end

end