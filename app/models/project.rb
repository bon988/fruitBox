class Project < ApplicationRecord
    #has many - relationship (a project can have many tasks)
    has_many :tasks
    
    #validation - for project model files to permit only minimum of 2 characters
    #for name, season, category
    validates :name, presence: true,
                        length: {minimum: 2}
                        
    validates :season , presence: true,
                        length: {minimum: 2}
    
    validates :category, presence: true,
                        length: {minimum: 2}
end

