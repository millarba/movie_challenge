class Schedule

  def initialize(runtime)
    @runtime = runtime
  end

  def total_weekday_minutes
    12 * 60
  end

  def divisible_runtime
    divisible_runtime = @runtime
    until divisible_runtime % 5 == 0
      divisible_runtime += 1
    end
  p  divisible_runtime
  end

  def possible_showings
    @showings = 0
    remaining_minutes = total_weekday_minutes
    while remaining_minutes >= @runtime
      remaining_minutes -= 15
        if remaining_minutes >= divisible_runtime
          p remaining_minutes
          remaining_minutes -= divisible_runtime
          @showings += 1
        end
        if remaining_minutes >= 0 
          remaining_minutes -= 20
        end
    end
    p @showings
  end

  def showings
    today = Time.now
    number_of_showings = @showings

    open = Time.new(today.year, today.month, today.day, 11, 15)

    showings = []
    while number_of_showings > 0
      p number_of_showings
      showings << open
      open = open + (60 * 160)
      number_of_showings -= 1
    end
    showings
  end


end

lego_batman = Schedule.new(114)

lego_batman.possible_showings

p lego_batman.showings

lego_batman.showings.each do |showing|
  puts showing.strftime("%I:%M")
end

