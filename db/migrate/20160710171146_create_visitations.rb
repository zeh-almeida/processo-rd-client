class CreateVisitations < ActiveRecord::Migration
  def change
    create_table :visitations, id: :uuid do |t|
      t.references :visitor, index: true, null: false
      t.citext     :address, index: true, null: false
      t.timestamp  :time,    null: false
    end
  end
end
