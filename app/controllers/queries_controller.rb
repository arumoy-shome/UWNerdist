class QueriesController < ApplicationController
  def new
    @terms = Request.new("terms/list").get
  end

  def result
    render :new unless params[:query][:subjects]
    @courses = Request.new(term: params[:query][:term],
      subjects: params[:query][:subjects]).get_schedules
  end
end
