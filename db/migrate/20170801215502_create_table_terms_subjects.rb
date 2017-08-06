class CreateTableTermsSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :terms_subjects, id: false do |t|
      t.belongs_to :term, index: true
      t.belongs_to :subject, index: true
    end
  end
end
