describe Artifact do
  describe "a default case" do
    subject { Artifact.new }
    it "should save" do
      subject.save.should be_true
    end
  end
end
