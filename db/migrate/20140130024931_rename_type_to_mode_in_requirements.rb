class RenameTypeToModeInRequirements < ActiveRecord::Migration
  def change
    change_table :requirements do |t|
      t.rename :type, :mode
    end
  end
end
