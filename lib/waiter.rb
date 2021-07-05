class Waiter
    attr_accessor :experience
    attr_reader :name

    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total,tip)
    end

    # meals returns an Array of Meal instances associated with this waiter

    def meals
        meals = Meal.all.filter{|meal| meal.waiter == self}
    end

    # returns the Customer instance associated with the meal that received the largest tip

    def best_tipper
        best_tipper = self.meals.max_by(&:tip).customer
    end
end