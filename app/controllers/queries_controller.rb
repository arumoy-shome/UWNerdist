class QueriesController < ApplicationController
  def new
    @terms = UwApi::Request.new("terms/list").get
  end

  def result
    render :new unless params[:query][:subjects]
    @courses = UwApi::Request.new(term: params[:query][:term],
      subjects: params[:query][:subjects]).get_schedules
  end
end
