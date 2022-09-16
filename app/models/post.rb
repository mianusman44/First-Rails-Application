class Post < ApplicationRecord
    belongs_to :admin_user, :optional => true
    has_many :comments
end
