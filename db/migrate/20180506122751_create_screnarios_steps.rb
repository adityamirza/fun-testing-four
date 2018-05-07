class CreateScrenariosSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :screnarios_steps do |t|
      t.integer :scenario_id
      t.integer :step_id
      t.boolean :active

      t.timestamps
    end
  end
end
