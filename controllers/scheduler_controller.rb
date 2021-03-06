require_relative '../config/ruby_manifest.rb'

class SchedulerController
  attr_reader :load_view, :runner_view, :movie_loader, :today
  attr_accessor :finished

  def initialize
    @load_view = LoadView.new
    @runner_view = RunnerView.new
    @movie_loader = MovieLoader.new
    @today = Time.now
    @finished = false
  end

  def run_program #This is the flow of your program, call other classes and methods to complete
    runner_view.reset_screen!
    load_view.ask_to_reload(today)
    reload_input = gets.chomp

    if reload_input == 'yes'
      movie_loader.compile_todays_list
      load_view.finished
    end

    until finished
      # logic for your program
      movies.each do |movie|
        p movie.name
      end
      runner_view.ask_if_user_is_finished
      user_choice = gets.chomp

      if user_choice == 'end'
        exit_program 
      end
    end    
  end

  def exit_program
    self.finished = true
    runner_view.good_bye_message
  end
end
