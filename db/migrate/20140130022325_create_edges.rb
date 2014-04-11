class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.string :name
      t.text :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
