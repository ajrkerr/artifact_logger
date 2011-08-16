class Log::Message < ActiveRecord::Base
  belongs_to :artifact, :polymorphic => true

  validates :text, :presence => true
  validates :level, :presence => true, :inclusion => { :in => lambda { |record| record.valid_levels } }

  scope :log_level, lambda { |level| where(:level => level.to_s)}

  def self.valid_levels
    [:info, :warning, :error]
  end

  def valid_levels
    if artifact_type
      artifact_type.valid_log_levels || self.class.valid_levels
    else
      self.class.valid_levels
    end
  end

  #Store the old artifact and artifact= functions for later usage
  alias_method :_get_artifact, :artifact
  alias_method :_set_artifact, :artifact=

  #Returns either the model, or the object
  def artifact
    _get_artifact.nil? ? artifact_type : _get_artifact
  end

  #Assignment overriden to allow the model to be used as well
  def artifact= val
    if val.is_a? Class
      self[:artifact_type] = val.model_name
    else
      _set_artifact val
    end
  end

  #Finds the class of object which we're dealing with
  def artifact_type
    self[:artifact_type].nil? ? nil : self[:artifact_type].constantize
  end

  def level= level
    super level.to_sym
  end
end