class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist

    validates :name, presence: true
    validates :scientist_id, uniqueness: true
end
