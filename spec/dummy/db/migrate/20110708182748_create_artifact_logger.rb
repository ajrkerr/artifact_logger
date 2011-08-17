class CreateArtifactLogger < ActiveRecord::Migration
  def self.up
    create_table :log_messages do |t|
      t.string  :level, :null => false
      # t.string  :type
      t.text    :text, :null => false
      t.string  :artifact_type
      t.integer :artifact_id

      t.timestamps
    end

    add_index :log_messages, :artifact_type
    add_index :log_messages, :artifact_id
    add_index :log_messages, :level
  end

  def self.down
    drop_table :artifacts
  end
end
