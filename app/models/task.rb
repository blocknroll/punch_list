class Task < ActiveRecord::Base

  validates :title, presence: true
  validate  :start_date_cannot_be_before_current_date
  validate  :due_date_cannot_be_before_current_date


  def start_date_cannot_be_before_current_date
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Sorry – your start date cannot be before current date.")
    end
  end

  def due_date_cannot_be_before_current_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Sorry – your due date cannot be before current date.")
    end
  end

end
