#Model extensions for Artifct Logger
module ArtifactLogger::ModelExtensions
  extend ActiveSupport::Concern

  module ClassMethods
    def log *params
      if params.length == 0
        ArtifactLogger.extend_object(Log::Message.where(:artifact_type => model_name, :artifact_id => nil), self)
      elsif params.length == 2
        Log::Message.create :level => params[0], :text => params[1], :artifact_type => model_name
      else
        super
      end
    end

    def valid_log_levels
      return @_valid_levels || [:error, :info, :warning]
    end
  end

  module InstanceMethods
    def log *params
      if params.length != 2
        ArtifactLogger.extend_object(_log(*params), self)
      else
        Log::Message.create :level => params[0], :text => params[1], :artifact => self
      end
    end

    def valid_log_levels
      return self.class.valid_log_levels
    end
  end
end