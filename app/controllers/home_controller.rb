require 'mailgun' 

class HomeController < ApplicationController
  def index
    
  end
  
  def write
    @title1 = params[:title]
    @content1 = params[:content]
    @email1 = params[:email]
    
    mg_client = Mailgun::Client.new("key-b6b1121292884bfb03c99051c86984b9")

    message_params =  {
                   from: 'amoomail@example.com',
                   to:   @email1,
                   subject: @title1,
                   text:    @content1
                  }

    result = mg_client.send_message('sandbox89d18a8d5aca42eaa920bf8cace25d88.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  
    new_post = Post.new
    new_post.title = @title1
    new_post.content = @content1
    new_post.email = @email1
    new_post.save
    redirect_to "/list"
  end
  
  def list
      @bidulgi1 = Post.all #db에 있는 모든 글들을 @bidulgi에 저장한다
      
  end
end
# rake db:migrate

