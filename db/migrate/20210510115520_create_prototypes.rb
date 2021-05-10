class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title     , null: false, default: ""
      t.text       :catch_copy, null: false
      t.text       :concept   , null: false
      t.references :user      , only: :index

      t.timestamps
    end
  end
end
