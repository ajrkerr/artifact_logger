require 'spec_helper'

shared_examples "a log message" do |artifact|
  subject { Factory.create(:log_message, :artifact => artifact) }

  it "should be loggable against an artifact" do
    subject.save.should be_true
  end

  it "should find it's artifact" do
    subject.artifact.should == artifact
  end

  it "should find the correct log messages" do
    artifact.log << subject if artifact
    artifact.log.should include subject if artifact
  end

  it "should know the artifact type" do
    subject.artifact_type.should equal Artifact if artifact
  end
end

describe Log::Message do

  describe "default state" do
    it "should have two errors on level" do
      subject.should have(2).error_on :level
    end

    it "should have error on text" do
      subject.should have(1).error_on :text
    end

    it "should prevent an invalid message level" do
      subject.level = "invalid"
      subject.should have(1).errors_on :level
    end
  end

  describe "without an artifact" do
    it_should_behave_like "a log message"
  end

  describe "with a class as an artifact" do
    it_should_behave_like "a log message", Artifact
  end

  describe "with an artifact" do
    it_should_behave_like "a log message", Artifact.create
  end
end
