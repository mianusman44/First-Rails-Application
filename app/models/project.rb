class Project < ApplicationRecord
    has_many :teacher_projects
    has_many :teachers,through: :teacher_projects
end
