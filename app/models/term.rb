class Term < ApplicationRecord
  extend ApiHelper

  def self.create
    id = res[:current_term]
    listings = res[:listings][Time.current.year.to_s.to_sym]
    description = ''

    listings.each do |listing|
      break unless description.empty?

      description = listing[:name] if listing[:id] == id
    end

    super(id: id, description: description)
  end

  def self.current
    id = res[:current_term]
    find(id)
  end

  def self.res
    @@res ||= get('terms/list')[:data]
  end

  private_class_method :res
end
