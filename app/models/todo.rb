class Todo < ApplicationRecord
    validates :name, presence: true
    enum status: {
        incomplete: 0,
        complete: 1
    }    
end
