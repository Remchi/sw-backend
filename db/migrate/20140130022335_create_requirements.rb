class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :value
      t.string :type
      t.references :edge, index: true

      t.timestamps
    end
  end
end
