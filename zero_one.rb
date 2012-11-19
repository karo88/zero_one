class ZeroOne
  module Finisher
    def Finisher.finish?(rest)
      darts = []

      (1..20).each do |i|
        darts << ["S" + i.to_s, i]
        darts << ["D" + i.to_s, i * 2]
        darts << ["T" + i.to_s, i * 3]
      end
      darts << ["S-BULL", 50]
      darts << ["D-BULL", 50]
      darts << ["MISS", 0]

      darts.map{|item| item.last }.include?(rest) # Is there any elegant implementation?
    end
  end
end

describe ZeroOne::Finisher do
  describe "rest 1 case" do
    subject { ZeroOne::Finisher.finish?(1) }
    it { should be_true }
  end

  describe "rest 181 case" do
    subject { ZeroOne::Finisher.finish?(181) }
    it { should be_false }
  end
end
