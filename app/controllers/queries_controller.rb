class QueriesController < ApplicationController
  require 'uw_api/request'
  require 'uw_api/filter'


  def new
    @terms ||= to_json(UwApi::Request.new("terms/list").get)
  end

  def result
    response = to_json(UwApi::Request.new("terms/#{params[:query][:term]}/courses").get)
    @courses = UwApi::Filter.new(response, subjects: params[:query][:subjects]).by_subject
  end

  private

  def to_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
