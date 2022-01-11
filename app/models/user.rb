# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password        :string
#  avatar          :binary
#  bio             :text
#  birthday        :date
#  color           :string
#  fruit           :string
#  music           :string
#  language        :string
#  pill            :string
#  choises         :string
#  active          :boolean
#  friends         :integer
#  mood            :integer
#  awake           :time
#  first_kiss      :datetime
#  terms           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  serialize :fruit, JSON
  serialize :music, JSON
  serialize :choises, JSON

  AVATAR = Mime::LOOKUP.keys.keep_if{ |v| v =~ /image/ }
  COLOR = [:red, :pink, :violet, :indigo, :blue, :teal, :green, :yellow]
  FRUIT = [:apple, :banana, :cherry, :coconut, :grape, :lime, :mango, :orange, :pear, :pineapple]
  MUSIC = [:rock, :pop, :jazz, :heavy_metal, :hip_hop, :house, :electronic_dance, :dance, :techno]
  LANGUAGE = [:en, :de, :es, :ru]
  PILL = [:red, :blue]
  CHOISES = [:a, :b, :c, :d]

  validates :name,        presence: true, length: { minimum: 3 }
  validates :email,       presence: true, format: { with: /.+@.+\.{1}.{2,}/ }
  validates :password,    length: { within: 8..40 }
  validates :avatar,      presence: true
  validates :bio,         length: { within: 100..900 }
  validates :birthday,    presence: true, comparison: { greater_than: ->(_) { Date.today } }
  validates :color,       presence: true
  validates :fruit,       presence: true, exclusion_array: { in: User::FRUIT.first, presence: true, deny_blank: true }
  validates :music,       presence: true, exclusion_array: { in: User::MUSIC.first, presence: true, deny_blank: true }
  validates :language,    inclusion: { in: User::LANGUAGE.map(&:to_s) }
  validates :pill,        inclusion: { in: [User::PILL.first.to_s] }
  validates :choises,     presence: true, exclusion_array: { in: User::CHOISES.first, presence: true, deny_blank: true }
  validates :active,      presence: true, acceptance: true
  validates :friends,     numericality: { only_integer: true, greater_than: 1, less_than: 10_000 }
  validates :mood,        numericality: { only_integer: true, greater_than: 50, less_than_or_equal_to: 100 }
  validates :awake,       presence: true, comparison: { less_than: ->(_) { Date.today.beginning_of_day + 12.hours } }
  validates :first_kiss,  presence: true, comparison: { greater_than: ->(_) { Date.today.beginning_of_day + 20.hours } }
  validates :terms,       acceptance: true
end
