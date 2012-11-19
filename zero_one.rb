class ZeroOne
  module Finisher
    def self.create_finish_table()
      darts = []

      (1..20).each do |i|
        darts << ["S" + i.to_s, i]
        darts << ["D" + i.to_s, i * 2]
        darts << ["T" + i.to_s, i * 3]
      end
      darts << ["S-BULL", 50]
      darts << ["D-BULL", 50]
      darts << ["MISS", 0]

      possible_ways = darts.repeated_combination(3).to_a

      # Is there any shorter implementation?
      finish_table  = possible_ways.map{|possible_way|
        [ possible_way.map{|dart| dart.first }, possible_way.inject(0){|sum,dart| sum + dart.last } ]
      }

      finish_table
    end

    def self.finish?(rest)
      finish_table = create_finish_table

      # Is there any elegant implementation?
      finish_table.map{|item| item.last }.include?(rest)
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

  describe "rest 180 case" do
    subject { ZeroOne::Finisher.finish?(180) }
    it { should be_true }
  end
end
