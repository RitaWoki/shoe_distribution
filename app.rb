require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

get ('/brands') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:brands)
end

get ('/stores') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:stores)
end

post('/brands/new') do
  name = params['name']
  store_ids = params['store_ids']
  @new_brand = Brand.new({:name => name, :store_ids => store_ids})
  @brands = Brand.all()
  @stores = Store.all()
  if @new_brand.save()
    redirect("/brands/".concat(@new_brand.id().to_s()))
  else
    erb(:errors_brands)
  end
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @brands = Brand.all()
  @stores = Store.all()
  erb(:brand)
end

get('/brands/:id/edit') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = Store.all()
  erb(:brands_edit)
end

patch('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  name = params['name']
  store_ids = params['store_ids']
  @brand.update({:name => name, :store_ids => store_ids})
  if @brand.save()
    redirect("/brands/".concat(@brand.id().to_s()))
  else
    erb(:errors_brands)
  end
end

delete('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  if @brand.destroy()
    redirect("/brands")
  else
    erb(:brand)
  end
end

post('/stores/new') do
  name = params['name']
  city = params['city']
  state = params['state']
  brand_ids = params['brand_ids']
  @new_store = Store.new({:name => name, :city => city, :state => state, :brand_ids => brand_ids})
  @stores = Store.all()
  @brands = Brand.all()
  if @new_store.save()
    redirect("/stores/".concat(@new_store.id().to_s()))
  else
    erb(:errors_stores)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @stores = Store.all()
  @brands = Brand.all()
  erb(:store)
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all()
  erb(:stores_edit)
end

patch('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  name = params['name']
  city = params['city']
  state = params['state']
  brand_ids = params['brand_ids']
  @store.update({:name => name, :city => city, :state => state, :brand_ids => brand_ids})
  if @store.save()
    redirect("/stores/".concat(@store.id().to_s()))
  else
    erb(:errors_stores)
  end
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  if @store.destroy()
    redirect("/stores")
  else
    erb(:store)
  end
end
