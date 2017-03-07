require("spec_helper")

describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it("saves store names in title case") do
    store = Store.new({:name => "shoe crazy"})
    store.save()
    expect(store.name()).to(eq("Shoe Crazy"))
  end

  describe("#brands") do
    it("has many brands") do
      store = Store.create({:name => "Shoe Crazy"})
      brand1 = Brand.create({:name => "Molly's Moccasins"})
      brand2 = Brand.create({:name => "Gary's Galoshes"})
      store.brands.push(brand1, brand2)
      expect(store.brands()).to(eq([brand1, brand2]))
    end
  end
end
