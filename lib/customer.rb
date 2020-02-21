class Customer
    attr_accessor :name, :age
    attr_reader

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.find_all { |meal| meal.customer == self }
    end

    def waiters
        self.meals.map { |meal| meal.waiter }
    end

end