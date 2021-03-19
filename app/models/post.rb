class Post < ApplicationRecord
  validates :title, presence:true, length:{ in:1..140 }
end
