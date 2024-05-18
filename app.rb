require_relative 'router'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

meal_csv = File.join(__dir__, '/data/meals.csv')
meal_repo = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repo)

customer_csv = File.join(__dir__, '/data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)
router.run
