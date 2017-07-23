class SchedulesController < ApplicationController
  def index
     @current_term = Term.current_term
  end
end
