class WelcomeController < ApplicationController	

    def index
	@articles = ApplicationHelper.extract_articles('public/articles.txt')
    end
end
