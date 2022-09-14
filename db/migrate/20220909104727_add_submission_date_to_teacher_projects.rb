class AddSubmissionDateToTeacherProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :teacher_projects, :submission_date, :date
  end
end
