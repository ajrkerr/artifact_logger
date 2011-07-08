require 'artifact_logger/engine'
require 'artifact_logger/model_extensions'
require 'artifact_logger/active_record'


module ArtifactLogger

  def self.extend_object obj, artifact
    artifact.valid_log_levels.each do |level|
      obj.define_singleton_method level do |message=nil|
        if message.nil?
          artifact.log.log_level(level)
        else
          artifact.log.create(:text => message, :level => level)
        end
      end
    end
    return obj
  end
end

class ActiveRecord::Base
  include ArtifactLogger::ActiveRecord
end