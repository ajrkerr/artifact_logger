# ActiveRecord augmentations
module ArtifactLogger::ActiveRecord
  extend ActiveSupport::Concern

  module ClassMethods
    def enable_artifact_logger options={}
      #Configure the has_many
      has_many :log, :as => :artifact, :class_name => '::Log::Message', :dependent => :destroy, :autosave => true
      #Store the old logging method
      alias_method :_log, :log
      remove_method :log

      include ArtifactLogger::ModelExtensions

      #Store the levels which are valid
      @_valid_levels = options[:levels]
    end
  end
end
