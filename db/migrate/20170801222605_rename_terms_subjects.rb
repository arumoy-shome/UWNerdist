class RenameTermsSubjects < ActiveRecord::Migration[5.0]
  def change
    rename_table 'terms_subjects', 'subjects_terms'
  end
end
