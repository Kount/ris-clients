require 'spec_helper'
require 'ascii85'

describe "Test: Ascii85 encode and decode method method" do
  describe "Test the encode method" do

    it "Test the encode method for the value Ruby" do
      expect(Ascii85.encode("Ruby")).to eq('<~;KZGo~>')
    end
  end

  describe "Test the decode method" do

    it "Test the decode method for the value Ruby" do
      expect(Ascii85.decode("<~;KZGo~>")).to eq('Ruby')
    end
  end

  end