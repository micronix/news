class HomeController < ApplicationController
    def index
        @stories = Story.all
        @stories = @stories.sort do |x, y|
            y.score <=> x.score
        end
    end
    
    def upvote
        vote = Vote.find_by(user_id: current_user.id, story_id: params[:id])
        if vote.nil?
            vote = Vote.new
            vote.user_id = current_user.id
            vote.story_id = params[:id]
            vote.value = 1
            vote.save
        else
            vote.value = 1
            vote.save
        end
        redirect_to '/'
    end
    
    def downvote
        vote = Vote.find_by(user_id: current_user.id, story_id: params[:id])
        if vote.nil?
            vote = Vote.new
            vote.user_id = current_user.id
            vote.story_id = params[:id]
            vote.value = -1
            vote.save
        else
            vote.value = -1
            vote.save
        end
        redirect_to '/'
    end
end
