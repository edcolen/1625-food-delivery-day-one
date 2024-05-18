require 'readline'

class MealsView
  def ask_user_for(info)
    puts "What's the meal's #{info}?"
    gets.chomp
  end

  def display(meals)
    puts "No meals available" if meals.empty?

    meals.each_with_index do |meal, i|
      puts "#{i + 1} - #{meal.name} $#{meal.price}"
    end
  end

  def edit(att, data)
    Readline.pre_input_hook = lambda {
      Readline.insert_text(data.to_s)
      Readline.redisplay
      Readline.pre_input_hook = nil
    }

    print "#{att}: "
    Readline.readline('', false)
  end
end
