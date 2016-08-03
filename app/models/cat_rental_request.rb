class CatRentalRequest < ActiveRecord::Base
  belongs_to :cat

  STATUS = ["PENDING", "APPROVED", "DENIED"]
  validates :cat_id, :start_date, :end_date, :status, presence: true

  validates :status, inclusion: {:in => STATUS}

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id) ("id = #{self.id}")
      .where(cat_id: self.cat_id)
      .where(<<-SQL, start_date: self.start_date, end_date: self.end_date)
        NOT (start_date > :end_date) OR (end_date < :start_date)
      SQL

  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

end
