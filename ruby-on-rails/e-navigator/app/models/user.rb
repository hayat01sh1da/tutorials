class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validate :birthday_cannot_be_in_the_future

  enum sex: {
    unchosen: 0,
    male: 1,
    female: 2
  }

  has_many :interviews, dependent: :destroy

  # パスワード入力なしでの更新を許可する
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def age
    return unless birthday

    @today      = Time.zone&.today || Date.today
    @birth_date = birthday.to_date
    age         = today.year - birth_date.year

    before_birthday? ? age -1 : age
  end

  private

  attr_reader :today, :birth_date

  def birthday_cannot_be_in_the_future
    if birthday.present? && birthday.future?
      errors.add(:birthday, "に未来の日時は選択できません。")
    end
  end

  def before_birth_date_on_birth_month?
    today.month == birth_date.month && today.day < birth_date.day
  end

  def before_birthday?
    before_birth_month? || before_birth_date_on_birth_month?
  end

  def before_birth_month?
    today.month < birth_date.month
  end
end
