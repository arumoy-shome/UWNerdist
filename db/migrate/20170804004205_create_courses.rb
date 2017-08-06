class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :description
      t.string :campus
      t.string :level
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
