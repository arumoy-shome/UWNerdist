class Subject < ApplicationRecord
  extend ApiHelper

  has_and_belongs_to_many :terms

  def self.update
    subjects = get("codes/subjects")[:data]

    subjects.each do |subject|
      find_or_create_by(code: subject[:subject], description: subject[:description])
    end
  end
end
