class DynamicPagesController < ApplicationController


	def welcome
		@first_name = params[:first_name]
		@gossip = Gossip.last(10)
	end

	def show
		@gossip = Gossip.find(params[:gossip_id])
	end

	def show_user
		@user = User.find(params[:user_id])
	end
end
