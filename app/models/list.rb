class List < ApplicationRecord
	validates :title, presence: { messsage: "入力してください" }, uniqueness: true, length: { maximum: 31 }
end
