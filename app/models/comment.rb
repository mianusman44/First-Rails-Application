class Comment < ApplicationRecord
    
    belongs_to :admin_user
    belongs_to :post
end
