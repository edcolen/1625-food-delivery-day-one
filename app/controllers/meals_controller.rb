require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    name = @meals_view.ask_user_for(:name)
    price = @meals_view.ask_user_for(:price).to_i
    # meal = Meal.new(name: name, price: price)
    meal = Meal.new(name:, price:)
    @meal_repository.create(meal)
    list
  end

  def remove
    list
    index = @meals_view.ask_user_for(:number).to_i - 1
    @meal_repository.destroy(index)
    list
  end

  def edit
    list
    index = @meals_view.ask_user_for(:number).to_i - 1
    meal = @meal_repository.find(index)
    meal.name = @meals_view.edit('name', meal.name)
    meal.price = @meals_view.edit('price', meal.price).to_i
    @meal_repository.save_csv
    list
  end

  def list
    meals = @meal_repository.all
    @meals_view.display(meals)
  end
end
