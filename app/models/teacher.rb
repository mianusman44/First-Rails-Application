class Teacher < ApplicationRecord
    paginates_per 10
    has_one_attached :profile_image
    has_many :blogs
    has_and_belongs_to_many :courses
    has_many :teacher_projects
    has_many :projects, through: :teacher_projects
    validates :first_name,:last_name,:email,presence:true
    validates :email,uniqueness:true
    validates :first_name, :last_name, length:{minimum:2 ,maximum:15}
    validates :first_name, :last_name , format: { with: /\A[a-zA-Z]+\Z/, message:'only character are allowed'}
    # validates :age , presence:true ,numericality:true
    validate :validate_student_age
    after_commit :display_student_age


    def display_student_age
        if self.date_of_birth?
            age=Date.today.year - self.date_of_birth.year
            puts "======Age of Teacher is#{age}======"
        else
            puts "======Age cannot be calculated without date_of_birth======"
        end
    end

    def validate_student_age
        if self.date_of_birth?
            age=Date.today.year - self.date_of_birth.year
            if age < 15
                errors.add(:age , 'Please provide a valid date of birth here. Age must be greater than 15')
            end
        end
    end

    def full_name
        "#{first_name} #{last_name}"
    end

    def age
        if date_of_birth.present?
            Date.today.year - date_of_birth.year

        else
            nil
        end
    end


end
