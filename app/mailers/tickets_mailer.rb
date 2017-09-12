class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: I18n.t(".buy_ticket"))
  end
end
