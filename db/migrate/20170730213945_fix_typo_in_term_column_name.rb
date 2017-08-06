class FixTypoInTermColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :terms, :desciption
    add_column :terms, :description, :string
  end
end
