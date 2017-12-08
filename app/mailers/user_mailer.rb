class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  
   def order_confirm_email(order, email)
    @order = order
    @email = email
    mail(to: email, subject: "Your order #{order.id} has been confirmed")
   end
end
