class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
    t.column(:name, :varchar)
    t.column(:city, :varchar)
    t.column(:state, :varchar)

    t.timestamps()
    end
  end
end
