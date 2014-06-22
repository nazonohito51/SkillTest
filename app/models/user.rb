# coding: utf-8

class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  #name
  validates_presence_of :name
  validates :name, uniqueness: true
  validates :name, length: { maximum: 30 }

  #age
  validates_presence_of :age
  validates_numericality_of :age
  validates_inclusion_of :age, :in=>0..100, message: "は0～100の範囲で入力してください。"

  #gender
  validates_inclusion_of :gender, in: [true, false], message: "を入力してください。"
end
