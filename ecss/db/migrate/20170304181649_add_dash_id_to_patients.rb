class AddDashIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :dash_id, :string, after: :disease
  end
end
