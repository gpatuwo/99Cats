class Cat < ActiveRecord::Base
  has_many :cat_rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy

  SEXES =["M", "F"]

  validates :birth_date, :color, :name, :description, :presence => true
  validates :sex, :presence => true, inclusion: {:in => SEXES}

def age
  time_ago_in_words(birth_date)
end


end
