#Model extensions for Artifct Logger
module ArtifactLogger::ModelExtensions
  extend ActiveSupport::Concern

  module ClassMethods
    #Provides two different functionalities:
    # Artifact.log # => log message object
    # Artifact.log :level, "Message" # Creates a new message
    def log *params
      if params.length == 0
        #Return a set of messages, however extend the class at runtime
        #This allows you to use:
        #Artifact.log.error
        #Artifact.log.error?
        ArtifactLogger.extend_log_object(Log::Message.where(:artifact_type => model_name, :artifact_id => nil), self)
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
    #Provides two different functionalities:
    # artifact.log # => log message object
    # artifact.log :level, "Message" # Creates a new message
    def log *params
      if params.length == 2
        Log::Message.create :level => params[0], :text => params[1], :artifact => self
      else
        ArtifactLogger.extend_log_object(_log(*params), self)
      end
    end

    def valid_log_levels
      return self.class.valid_log_levels
    end
  end
end