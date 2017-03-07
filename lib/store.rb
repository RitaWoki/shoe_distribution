require ('pry')

class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates(:name, {:presence => true})
  before_save(:titleize_name)

private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
