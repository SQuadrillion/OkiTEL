class Register < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, format: { with: /0\d{1,4}-\d{1,4}-\d{4}/, 
                                              message: '電話番号を入力してね(ハイフンも)' }
  validates :time, presence: true
  validates :todo, presence: true

  def self.time_range
   [5, 10, 15, 20, 25, 30]
  end
end
