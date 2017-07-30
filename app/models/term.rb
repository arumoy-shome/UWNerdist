class Term < ApplicationRecord
  extend ApiHelper

  def self.create
    res = get('terms/list')
    id = res[:data][:current_term]
    listings = res[:data][:listings][Time.current.year.to_s.to_sym]
    description = ''

    listings.each do |listing|
      return unless description.empty?

      description = listing[:name] if listing[:id] == id
    end

    super(id: id, description: description)
  end
end
