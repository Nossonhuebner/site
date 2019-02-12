# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string
#  body        :string
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ApplicationRecord
  validates :author_id, :title presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Admin

end
