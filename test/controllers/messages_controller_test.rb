require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  
    def setup
      @base_title = "Jason Post - Composer, Sound Artist, Developer"
    end
    
    test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "succesful post" do
  assert_difference 'ActionMailer::Base.deliveries.size', 1 do
    post :create, message: {
      name: 'cornholio',
      email: 'cornholio@example.com',
      subject: 'hi',
      content: 'bai'
    }
  end


    assert_redirected_to contact_path
    last_email = ActionMailer::Base.deliveries.last

    assert_equal 'hi', last_email.subject
    assert_equal 'jason.w.post@gmail.com', last_email.to[0]
    assert_equal 'cornholio@example.com', last_email.from[0]
    assert_match(/bai/, last_email.body.to_s)

    ActionMailer::Base.deliveries.clear
  end

  test "failed post" do
  	post :create, message: {
  		name: '',
  		email: '',
  		subject: '',
  		content: ''
  	}

  	[:name, :email, :subject, :content].each do |attr|
  		assert_select 'li', "#{attr.capitalize} can't be blank"
  	end
  end

end
