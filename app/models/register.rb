class Register < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true
  validates :time, presence: true
  validates :todo, presence: true

  def self.time_range
   ary = Array.new
   35.times{ |i| ary << i if i % 5 == 0  }
   ary
  end
end
