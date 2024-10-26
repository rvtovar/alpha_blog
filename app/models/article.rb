# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
end
