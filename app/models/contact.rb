class Contact < ApplicationRecord
  # Associations - define the relationship between other objects
  # belongs_to - only be in child model, one per relationship  
  # has_many - only in the parent model, multiple of the object , one per relationship, plural 
  # has_one - only in the parent model, single object , one per relationship, singular
  
  # adv
    # has_many :through
    # has_one :through
  # dependent - work when we are deleting something. avoid orphan data, only for has many and has one
  has_many :notes, dependent: :destroy
  has_one :address, dependent: :destroy

  # Vaildations, make sure your data follows some rules before it goes to the db 
  # - confirmation 
  #   - two text field match each other, exact same content
  #   password and password confirmation 
  # - inclusion - validates a attr that are included with in a given set 
  # class Coffee < ActiveRecord::Base
  #   validates :size, inclusion: { 
  #     in: %w(small medium large),
  #       message: "%{value} is not a valid size" 
  #   }
  # end

  # - length, length of the attr values 
  # class Person < ActiveRecord::Base
  #   validates :name, length: { minimum: 2 }
  #   validates :bio, length: { maximum: 500 }
  #   validates :password, length: { in: 6..20 }
  #   validates :registration_number, length: { is: 6 }
  # end

  # - numericality - make sure it is a number or a number range 
  # class Player < ActiveRecord::Base
  #   validates :points, numericality: true
  #   validates :games_played, numericality: { only_integer: true }
  #   validates :golf_handicap, numericality: { less_than_or_equal_to: 40.4, greater_than_or_equal_to: 2 }
  # end

  # - presence - makes sure the value isn't blank ''
  # class Person < ActiveRecord::Base
  #   validates :name, :login, :email, presence: true
  # end

  # - uniqueness - not record has the same value attr
  # class Account < ActiveRecord::Base
  #   validates :email, uniqueness: true
  # end


  # allow_nil
  #   class Coffee < ActiveRecord::Base
  #     validates :size, inclusion: { in: %w(small medium large),
  #     message: "%{value} is not a valid size" }, allow_nil: true
  #   end

  # allow_blank 
  #   class Topic < ActiveRecord::Base
  #     validates :title, length: { is: 5 }, allow_blank: true
  #   end

  # message
  #   class Coffee < ActiveRecord::Base
  #     validates :size, inclusion: { in: %w(small medium large),
  #     message: "%{value} is not a valid size" }
  #   end

  # on
  #   class Person < ActiveRecord::Base
  #     validates :email, uniqueness: true, on: :create
  #     validates :age, numericality: true, on: :update
  #     validates :name, presence: true, on: :save
  #   end
  validates :email, :first_name, :last_name, :age, :phone, presence: true 
  validates :email, uniqueness: true 
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 21 }

  # Callbacks - trigger logic or method or code based on a certain event 
  # before_validation
  # after_validation
  # before_save
  # around_save
  # before_create
  # around_create
  # after_create
  # after_save

  # class CreditCard < ActiveRecord::Base
  #   before_save :encrypt_card_number
   
  #   private
   
  #     def encrypt_card_number
  #       self.card_number = bcrypt(self.card_number)
  #     end
  # end

  # Model Methods 
  # Class method 
  # work with all of your contacts
  # class Person < ActiveRecord::Base
  #   # called on a class Person.by_first_name
  #   def self.by_first_name
  #     order(:first_name)
  #   end
  # end

# instance Methods
  # work s with a single record of the object
  # class Person < ActiveRecord::Base
  #   # called on an instance @person.full_name
  #   def full_name
  #    "#{self.first_name} {self.last_name}"
  #   end
  # end

  # any logic would be in the models, fat model skinny controllers
end
