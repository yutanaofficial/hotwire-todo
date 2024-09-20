class Todo < ApplicationRecord
validates :name, presence: true
validates :due_date, presence: true
# validate :due_date_must_be_in_the_future
validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
validates :subject, inclusion: { in: ['worker', 'delivery ', 'maid'] ,message: "%{value} is not a valid subject" }
validates_presence_of :name
    enum status: {
        incomplete: 0,
        complete: 1
    }    
    # private
    # def due_date_must_be_in_the_future
    #     if due_date.present? && due_date <= Date.today
    #       errors.add(:due_date, "must be in the future")
    #     end
    #   end
end
