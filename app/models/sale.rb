class Sale < ActiveRecord::Base

  def self.active
    Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !ucpming? && !finished?
  end
end
