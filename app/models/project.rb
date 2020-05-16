class Project < ApplicationRecord
    #a project can have many tasks
    has_many :tasks
    
    validates :name, presence: true,
                        length: {minimum: 2}
                        
    validates :season , presence: true,
                        length: {minimum: 2}
    
    validates :category, presence: true,
                        length: {minimum: 2}
end

