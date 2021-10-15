class Car < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    validates :placa, :modelo, :color, presence: true
    validates :placa, uniqueness: true
end
