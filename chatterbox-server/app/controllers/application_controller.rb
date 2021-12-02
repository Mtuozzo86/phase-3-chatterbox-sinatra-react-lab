class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add routes
  get "/messages" do
    list = Message.all
    list.to_json
  end

  post "/messages" do
    new_message = Message.create(username: params[:username], body: params[:body])
    new_message.to_json
  end

  delete "/messages/:id" do
    remove = Message.find(params[:id])
    remove.destroy
    remove.to_json
  end

  patch "/messages/:id" do
    change = Message.find(params[:id])
    change.update(body: params[:body])
    change.to_json
  end
end
