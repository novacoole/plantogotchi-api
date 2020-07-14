class User < ApplicationRecord
    validates :username, :password, :email, presence: true  
    validates :username, length: { minimum: 3 }
    validates :password, length: { minimum: 8 }
    validates :email, email: true

end
