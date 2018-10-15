class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  #
  belongs_to :hotel
  belongs_to :booking_engine
  belongs_to :room_type

  validates :price, presence: true
  validates :user, presence: true

  def self.grouped_by_status
    all.group_by(&:status)
  end

  def self.status_list
    %w[pending_confirmation confirmed switched sold expired]
  end

  def self.current
    where('check_in >= ?', Time.zone.today)
  end

  def self.confirmed
    where.not(confirmed_at: nil)
  end

  def self.unpurchased
    where(purchased: false)
  end

  def expired?
    check_in < Time.zone.today
  end

  def length_in_nights
    (check_out - check_in).to_i
  end

  def status
    if switched_at.blank? && expired?
      :expired
    elsif confirmed_at.present?
      if switched_at.present?
        :sold
      else
        if buyer.present?
          :switched
        else
          :confirmed
        end
      end
    else
      :pending_confirmation
    end
  end

  def total_cost
    length_in_nights * price
  end
end
