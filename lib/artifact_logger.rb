require 'artifact_logger/engine'
require 'artifact_logger/model_extensions'
require 'artifact_logger/active_record'


module ArtifactLogger

  #Extends a log object to add additional functionality
  def self.extend_log_object obj, artifact
    artifact.valid_log_levels.each do |level|
      obj.define_singleton_method level do |message=nil|
        if message.nil?
          artifact.log.log_level(level)
        else
          artifact.log.create(:text => message, :level => level)
        end
      end

      # Adds a method such as:
      # artifact.log.error? which returns true if there 
      obj.define_singleton_method "#{level}?" do
        !artifact.log.log_level(level).empty?
      end
    end
    return obj
  end
end

class ActiveRecord::Base
  include ArtifactLogger::ActiveRecord
end