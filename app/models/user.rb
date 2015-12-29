class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :plan
  attr_accessor :stripe_card_token #this allows us to use the hidden field to set stripe card token from JS and use token to create customer in Stripe servers 
  def save_with_payment
    if valid? #add validations to ensure for filled out correctly if required
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_card_token = customer.id
      save!
      
    end
  end
end
