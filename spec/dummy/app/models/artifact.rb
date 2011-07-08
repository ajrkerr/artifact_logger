class Artifact < ActiveRecord::Base
  enable_artifact_logger :levels => [:info, :warning, :error, :custom]
end
