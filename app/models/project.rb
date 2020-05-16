class Project < ApplicationRecord
    validates :name, presence: true,
                        length: {minimum: 2}
                        
    validates :season , presence: true,
                        length: {minimum: 2}
    
    validates :category, presence: true,
                        length: {minimum: 2}
end

