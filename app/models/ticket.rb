class Ticket < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :tags
  validates :name, presence: true
  validates :status, inclusion: { in: %w(new blocked in_progress fixed),
    message: "%{value} is not a valid status" }

  def display_tags
    tags.map(&:name).join(', ')
  end
end
