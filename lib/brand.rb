require ('pry')

class Brand < ActiveRecord::Base
  validates(:name, {:presence => true})
  has_and_belongs_to_many(:stores)

  before_save(:titleize_name)

private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
