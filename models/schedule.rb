class Schedule

  def initialize(runtime)
    @runtime = runtime
  end

  def total_minutes
    today = Time.now
    if today.monday? || today.tuesday? || today.wednesday? || today.thursday?
      total_minutes = 12 * 60
    else
      total_minutes = 13.5 * 60
    end
  end

  def divisible_runtime
    divisible_runtime = @runtime
    until divisible_runtime % 5 == 0
      divisible_runtime += 1
    end
      divisible_runtime
  end

  def possible_showings
    @possible_showings = 0
    remaining_minutes = total_minutes
    while remaining_minutes >= @runtime
      remaining_minutes -= 15
      
        if remaining_minutes >= divisible_runtime
          
          remaining_minutes -= divisible_runtime
          
          @possible_showings += 1

          remaining_minutes -= 20
        end
    end
    p "There are #{@possible_showings} showings"
  end

  def showings
    today = Time.now
    number_of_showings = @possible_showings

    open = Time.new(today.year, today.month, today.day, 11, 15)

    showings = []
    while number_of_showings > 0
      number_of_showings -= 1
      showings << open
      open = open + (60 * (divisible_runtime + 20 + 15))
    end
    showings
  end

end

lego_batman = Schedule.new(102)

lego_batman.possible_showings

p lego_batman.showings

lego_batman.showings.each do |showing|
  puts showing.strftime("%I:%M")
end

