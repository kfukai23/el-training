class User < ApplicationRecord
    has_secure_password
    has_many :tasks, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    #FIXME: どうにかひとつにまとめられないものか
    after_save :prepend_adminless
    after_destroy :prepend_adminless

    def prepend_adminless
       throw(:abort) if User.where(admin: true).count == 0
    end

end
