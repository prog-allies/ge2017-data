class CreateAreaPopulationEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :area_population_estimates do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_pop_est_on_area' }
      t.date :estimate_date, index: true
      t.string :estimate_description, index: true

      t.integer :pop_total
      t.integer :pop_total_f
      t.integer :pop_total_m

      (0..89).each do |i|
        t.integer "pop_#{i}_f"
        t.integer "pop_#{i}_m"
      end
      t.integer "pop_90plus_f"
      t.integer "pop_90plus_m"

      t.timestamps
    end
  end
end
