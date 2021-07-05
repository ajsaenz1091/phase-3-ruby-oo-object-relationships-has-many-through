class Customer
    attr_accessor 
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
    def new_meal(waiter,total,tip)
        meal = Meal.new(waiter,self,total,tip)
    end

    # returns an Array of Meal instances associated with this customer
    def meals
        meals = Meal.all.filter{|meal| meal.customer == self}
    end

    # returns an Array of Waiter instances associated with this customer's meals

    def waiters
        self.meals.map{|meal| meal.waiter }
    end

    def self.all
        @@all
    end

end