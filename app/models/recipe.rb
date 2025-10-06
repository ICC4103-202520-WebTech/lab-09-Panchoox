class Recipe < ApplicationRecord
    has_rich_text :instructions
    
    validates :title, presence: true
    validates :cook_time, presence: true, numericality: { greater_than: 0 }
    validates :difficulty, presence: true, inclusion: { in: %w[Easy Medium Hard] }
end
