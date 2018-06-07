class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :histories
  has_many :recipes, through: :favorites, dependent: :destroy
  has_many :stock_lists, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :recently_cooked_recipes, dependent: :destroy
  has_many :helpers, dependent: :destroy
  enum retire_flag: { 会員: false,
                      退会済み: true}

    def active_for_authentication?
      super && self.retire_flag == '会員'
    end

    def inactive_message
      self.retire_flag == '会員' ? super : :deleted_account
    end

  protected
    def update_with_password(params, * options)
     if params[:password].blank?
     params.delete(:password)
     params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
     update_attributes(params, * options)
    end

end
