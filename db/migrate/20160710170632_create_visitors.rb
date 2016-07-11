class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors, id: :uuid do |t|
      t.citext :email, uniq: true, index: true, null: false
    end
  end
end
