require 'spec_helper'

shared_examples "an artifact" do |artifact|
  
  before :each do
    artifact.reload unless artifact.is_a? Class
    @message = artifact.log "info", "Test Message"
  end

  it "should add a message" do
    m = artifact.log "info", "This is a log message"
    n = artifact.log "warning", "This is also a message"
    artifact.log.info.should include m
    artifact.log.warning.should include n
    m.artifact.should == artifact
    n.artifact.should == artifact
  end

  it "should allow for query functions" do
    artifact.log.info?.should be_true
    artifact.log.warning?.should be_false
    artifact.log.error?.should be_false
  end

  it "should add a message" do
    m = artifact.log.info "This is a log message"
    n = artifact.log.warning "This is also a message"
    artifact.log.info.should include m
    artifact.log.warning.should include n
    m.artifact.should == artifact
    n.artifact.should == artifact
  end

  it "should be able to see the message" do
    artifact.log.should include @message
  end

  it "should only appear as an info message" do
    artifact.log.warning.should be_empty
    artifact.log.error.should be_empty
  end

  it "should only be accessible to itself" do
    artifact2 = Factory.create :artifact
    artifact2.log.should be_empty
    artifact.log.should_not be_empty
  end

  it "should keep custom messages separate" do
    artifact2 = Factory.create :artifact, :name => "Bob"
    message2 = Factory.create :log_message, :level => :custom, :artifact => artifact2

    artifact.log.should == [@message]
    artifact.log.info.should == [@message]
    artifact.log.custom.should be_empty

    artifact2.log.should == [message2]
    artifact2.log.custom.should == [message2]
    artifact2.log.info.should be_empty
  end

  it "should have a custom method" do 
    message2 = Factory.create :log_message, :level => :custom, :artifact => artifact
    artifact.log.custom.should == [message2]
  end
end

describe Artifact do
  it_should_behave_like "an artifact", Artifact
  it_should_behave_like "an artifact", Factory.create(:artifact)

  it "should not be visible to the class" do
    artifact = Factory.create :artifact
    artifact.log "info", "Message"
    Artifact.log.should be_empty
  end

  describe "default case" do
    subject { Factory.build :artifact }
    it "should save" do
      subject.save.should be_true
    end
  end
end

