class Ticket < ApplicationRecord
  belongs_to :end_station, class_name: "RailwayStation"
  belongs_to :start_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user

  after_create :send_notification
  after_destroy :send_about_destroy

  def route_name
    "#{start_station.title} – #{end_station.title}"
  end

  private
    def send_notification
      TicketsMailer.buy_ticket(self.user, self).deliver_now
    end

    def send_about_destroy
      TicketsMailer.destroy_ticket(self.user, self).deliver_now
    end
end
