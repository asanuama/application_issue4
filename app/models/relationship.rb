class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # userモデルという名前ではなく、擬似的にfollower,forrowedモデルをつくり
  # belongs_toさせる
end
