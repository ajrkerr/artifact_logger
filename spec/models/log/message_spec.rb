require 'spec_helper'

describe Log::Message do

  it "should have an error on level" do
    subject.should have(1).error_on :level
  end

  it "should have error on text" do
    subject.should have(1).error_on :text
  end

  describe "valid case" do
    subject { Factory.build(:message) }
  
    it "should save" do
      subject.save.should be_true
    end
  end

  describe "with an artifact" do
    subject { Factory.build(:message) }

    before do
      @artifact = Artifact.new
      subject.artifact = @artifact
      subject.save
    end

    it "should be loggable against an artifact" do
      subject.save.should be_true
    end

    it "should find it's artifact" do
      subject.artifact == @artifact
    end

    it "should find the correct log messages for an artifact" do
      @artifact.log.messages.should == [subject]
    end
  end
end
