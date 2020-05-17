class Task < ApplicationRecord
    #defines a relationship (project belongs to a task)
  belongs_to :project
end
