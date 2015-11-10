require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'responds to name, email, subject and content' do
  	msg = Message.new
  	[:name, :email, :subject, :content].each do |attr|
  		assert msg.respond_to? attr
  	end
  end 

 test 'should accept valid attributes' do
 	valid_attr = {
 		name: 'stephen',
 		email: 'stephen@example.com',
 		subject: 'hi',
 		content: 'kthnxbai'
 	}

 	msg = Message.new valid_attr
 end

 test 'attributes should not be blank' do
 	msg = Message.new
 	refute msg.valid?
 end

end
