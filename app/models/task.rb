class Task < ActiveRecord::Base
  belongs_to :list, optional: true

  validates :description, :presence => true

  scope :not_done, -> { where(:done => false) }
  scope :done, -> { where(:done => true) }
  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
end
