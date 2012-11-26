class ZeroOne
  module Finisher
    def self.create_finish_table()
      darts = []

      {"S" => 1, "D" => 2, "T" => 3}.each do |symbol, factor|
        (1..20).each do |point|
          darts << [symbol + point.to_s, point * factor]
        end
      end
      darts << ["S-BULL", 50]
      darts << ["D-BULL", 50]
      darts << ["MISS", 0]

      possible_ways = darts.repeated_permutation(3)

      finish_table = possible_ways.map{|possible_way|
        [ possible_way.map(&:first), possible_way.map(&:last).inject(0, :+) ]
      }

      finish_table
    end

    @@finish_table = create_finish_table

    def self.finish?(rest)
      @@finish_table.map(&:last).include?(rest)
    end

    def self.ways_to_finish(rest)
      ways_including_miss = @@finish_table.select{|item| item.last == rest }
      ways_including_miss.map{|item| item.first.reject{|dart| dart == "MISS" } }
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

  describe "rest 179 case" do
    subject { ZeroOne::Finisher.finish?(179) }
    it { should be_false }
  end

  describe "rest 0 case" do
    subject { ZeroOne::Finisher.finish?(0) }
    it { should be_true }
  end

  describe "rest 77 case" do
    subject { ZeroOne::Finisher.finish?(77) }
    it { should be_true }
  end

  describe "rest 3 case" do
    subject { ZeroOne::Finisher.ways_to_finish(3) }
    it { should include( ["S1", "S1", "S1"] ) }
  end

  describe "rest 6 case" do
    subject { ZeroOne::Finisher.ways_to_finish(6) }
    it { should include( ["S1", "D1", "T1"] ) }
  end

  describe "rest 1 case" do
    subject { ZeroOne::Finisher.ways_to_finish(1) }
    it { should include( ["S1"] ) }
  end

  describe "rest 150 case" do
    subject { ZeroOne::Finisher.ways_to_finish(150) }
    it { should include( ["S-BULL", "D-BULL", "S-BULL"] ) }
  end
end
