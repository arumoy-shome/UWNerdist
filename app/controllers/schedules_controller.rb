class SchedulesController < ApplicationController
  def index
    @current_term = Term.new.current_term
  end
end
