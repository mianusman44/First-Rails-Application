class CreateTeacherProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_projects do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
