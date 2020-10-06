class User < ApplicationRecord
  # has_many :comments
  # has_many :articles
  # belongs_to :article
  # belongs_to :comment
  validates :name, presence: true,
                    length: { minimum: 3 }
end
