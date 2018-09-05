class User < ApplicationRecord

  has_many :enrollments,
    primary_key: :id,
    class_name: :Enrollment
    
  has_many :enrolled_courses,
    primary_key: :id,
    class_name: :Course
    
    
end
