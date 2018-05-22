class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #
  def send_when_update(user)
    @user = user
    @ingredients = ShoppingList.where(user_id: user.id)
     mail to: user.email,
     subject: '買い物リストが送信されました'
  end
end

