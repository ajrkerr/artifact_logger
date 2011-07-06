class Log::Message < ActiveRecord::Base
  belongs_to :artifact, :polymorphic => true

  validates :level, :presence => true
  validates :text, :presence => true
end