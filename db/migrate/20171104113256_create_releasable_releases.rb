class CreateReleasableReleases < ActiveRecord::Migration
  def change
    create_table :releasable_releases do |t|
      t.string :key
      t.string :user_ids
      t.boolean :active, default: false
    end
    add_index :releasable_releases, :key
  end
end
