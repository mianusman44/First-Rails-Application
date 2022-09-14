class CreateCoursesTeachersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table:courses,:teachers
  end
end
