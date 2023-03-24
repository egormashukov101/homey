class Project < ApplicationRecord
  validates :title, :status, presence: true
  has_many :comments, dependent: :destroy

  enum status: %w[active pending archived deleted].freeze

  has_paper_trail only: [:status], on: [:update]
end
