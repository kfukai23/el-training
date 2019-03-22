class User < ApplicationRecord
  has_secure_password
  has_many :tasks,  dependent: :destroy
  has_many :labels, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #FIXME: どうにかひとつにまとめられないものか
  after_save :prepend_adminless
  after_destroy :prepend_adminless

  def prepend_adminless
    if User.where(admin: true).count == 0
      errors[:base] << "管理者ユーザーが0人になるため変更できません"
      raise ActiveRecord::Rollback, self
    end
  end
end
