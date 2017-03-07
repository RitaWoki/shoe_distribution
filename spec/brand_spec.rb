require("spec_helper")

describe(Brand) do
  it("validates presence of name") do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it("saves brand names in title case") do
    brand = Brand.new({:name => "molly's moccasins"})
    brand.save()
    expect(brand.name()).to(eq("Molly's Moccasins"))
  end

  describe('#stores') do
    it("lists all the stores that carry this brand") do
      test_brand = Brand.create({:name => "Molly's Moccasins"})
      test_store1 = Store.create({:name => "Shoes by Sue"})
      test_store2 = Store.create({:name => "Feet by Frank"})
      test_brand.stores.push(test_store1, test_store2)
      expect(test_brand.stores()).to(eq([test_store1, test_store2]))
    end
  end
end
