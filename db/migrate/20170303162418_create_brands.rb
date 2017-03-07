class CreateBrands < ActiveRecord::Migration
  def change
    create_table(:brands) do |t|
    t.column(:name, :varchar)

    t.timestamps()
    end
  end
end
