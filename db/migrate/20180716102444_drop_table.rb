class DropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments
  end

  def down
   raise ActiveRecord::IrreversibleMigration
 end
end
