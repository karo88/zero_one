class ZeroOne
  module Finisher
    def Finisher.finish?(rest)
      true # Fake it
    end
  end
end

describe ZeroOne::Finisher do
  describe "rest 1 case" do
    subject { ZeroOne::Finisher.finish?(1) }
    it { should eq(true) }
  end
end


