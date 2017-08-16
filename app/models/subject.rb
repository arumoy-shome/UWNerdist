class Subject < ApplicationRecord
  extend ApiHelper

  has_and_belongs_to_many :terms
  has_many :courses

  def self.update
    subjects = get("codes/subjects")[:data]

    subjects.each do |subject|
      find_or_create_by(code: subject[:subject], description: subject[:description])
    end
  end

  def self.current_subjects
    courses = get("terms/#{Term.current.id}/courses")[:data]
    subject_codes = courses.map { |course| course[:subject] }.uniq

    where(code: subject_codes).map(&:code)
  end
end
