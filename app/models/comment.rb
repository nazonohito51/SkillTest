# coding: utf-8

class Comment < ActiveRecord::Base
  belongs_to :user

  #message
  validates_presence_of :message
  validates :message, length: { maximum: 50 }

  #user_id
  validates_presence_of :user_id
  validates_associated :user
end
