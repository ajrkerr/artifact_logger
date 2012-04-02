# ActiveRecord augmentations
module ArtifactLogger::ActiveRecord
  extend ActiveSupport::Concern

  module ClassMethods
    def enable_artifact_logger options={}
      include ArtifactLogger::ModelExtensions

      #Store the levels which are valid
      @_valid_levels = options[:levels]
    end
  end
end
