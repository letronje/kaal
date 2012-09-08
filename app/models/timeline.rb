# encoding: UTF-8

class Timeline < ActiveRecord::Base
  # Validation for title
  validates :title, :presence => true
  validates :title, :length => {
    :maximum => 256,
    :minimum => 3
  }
  validates :title, :format => {
    :with => /[a-zA-Z]/,
    :message => "must contain some letters"
  }

  # Validation for desc
  validates :desc, :length => {
    :maximum => 2048
  }

  # Validation for imgurl
  validates :imgurl,:format => {
    :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix,
    :message => '^URL (%{value}) is invalid'
  }, :allow_blank => true

end
