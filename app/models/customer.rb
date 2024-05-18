class Customer
  attr_accessor :id, :name, :address

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end
end
