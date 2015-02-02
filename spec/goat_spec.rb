require 'spec_helper'

module Billy

  describe Goat do

    it "has a brain" do
      expect(subject).to respond_to :brain
    end

  end

end

