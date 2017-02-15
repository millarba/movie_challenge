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
    divisible_runtime
  end

  def possible_showtimes
    @showings = 0
    remaining_minutes = total_weekday_minutes
    while remaining_minutes >= @runtime
      remaining_minutes -= 15
        if remaining_minutes >=0
          p remaining_minutes
          remaining_minutes -= divisible_runtime
          @showings += 1
        end
          if remaining_minutes >= 0 

            remaining_minutes -= 20
          end
    end
    @showings
  end

  def determine_showtimes
    time = Time.now
    total_showings = @showings
    while total_showings > 0
      time += (60 * (divisible_runtime + 15 + 20))
      total_showings -= 1
      p time
      p total_showings
    end

  end


end

lego_batman = Schedule.new(124)

lego_batman.possible_showtimes

p lego_batman.determine_showtimes

