class Waiter
    attr_accessor :name, :experience, :customer
    @@all =[]

    def initialize(name, experience)
        @name = name 
        @experience = experience 
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        meals_array = []
        Meal.all.each do |meals|
            if meals.waiter == self
                meals_array << meals
            end
        end
        meals_array
    end

    def best_tipper 
        theBigTip = 0
        tipper = nil
        meals.each do |tips|
            if tips.tip > theBigTip
                theBigTip = tips.tip 
                tipper = tips.customer
            end
        end
        tipper
    end



end




