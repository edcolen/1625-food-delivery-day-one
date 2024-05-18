class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    title
    display_options while @running
    puts 'Bye!'
  end

  def display_options
    puts ''.center(40, '-')
    puts ''
    puts 'What do you want to do?'
    puts '1 - Access meals menu'
    puts '2 - Access customers menu'
    puts '0 - Exit'
    action = gets.chomp.to_i
    dispatch(action)
  end

  def display_meals_menu
    puts '1 - List all meals'
    puts '2 - Add a new meal'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '0 - Exit'
    meal_action = gets.chomp.to_i
    dispatch_meals(meal_action)
  end

  def display_customer_menu
    puts '1 - List all customers'
    puts '2 - Add a new customer'
    puts '3 - Edit a customer'
    puts '4 - Delete a customer'
    puts '0 - Exit'
    customer_action = gets.chomp.to_i
    dispatch_customers(customer_action)
  end

  def dispatch(action)
    title
    case action
    when 1 then display_meals_menu
    when 2 then display_customer_menu
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def dispatch_meals(action)
    title
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.remove
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def dispatch_customers(action)
    title
    case action
    when 1 then @customers_controller.list
    when 2 then @customers_controller.add
    when 3 then @customers_controller.edit
    when 4 then @customers_controller.remove
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def stop!
    @running = false
  end

  def title
    print `clear`
    puts ''.center(40, '=')
    puts ' Batch #1625 Food Delivery '.center(40, '=')
    puts ''.center(40, '=')
    puts ''
  end
end
