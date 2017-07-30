class SchedulesController < ApplicationController
  def index
    @current_term = Term.new.name
  end
end
