class Comment < ApplicationRecord
  validates :text, :project, :user, presence: true

  belongs_to :project
  belongs_to :user
end
