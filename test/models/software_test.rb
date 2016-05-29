require 'test_helper'

class SoftwareTest < ActiveSupport::TestCase
  
  def setup
  	@software = Software.new(name: "Example software", script: "thing.js")
  end


  test "sofware name should be unique" do 
  	duplicate_software = @software.dup
  	@software.save
  	assert_not duplicate_software.valid?
  end
  	
  test "script validation should reject invalid script name" do 
  	invalidScriptName = %w[hello goodbye thisisnotagoodname]
  	invalidScriptName.each do |invalid_script_name|
  		@software.script = invalid_script_name
  		assert_not @software.valid?, "#{invalid_script_name.inspect} should be invalid"
  	end
  end
 
end
