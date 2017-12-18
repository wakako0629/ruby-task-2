class Word < ApplicationRecord
    validates :writer, presence: true
    validates :content, presence: true,length: { in: 1..140 }
end
