class PageController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: "This is article path";
    end

    def create
        article = Articlepage.create(
            author: params[:author],
        createdOn: params[:createdOn], 
        category: params[:category],
        body: params[:body],
        page: params[:page]
        )
        render json: article;
    end

    def read
        content = Articlepage.all;
        render json: content;
    end

    def update
        content = Articlepage.find_by(id: params[:id])
        content.author = params[:author] || content.author;
        content.createdOn = params[:createdOn] || content.createdOn;
        content.category = params[:category] || content.category;
        content.body = params[:body] || content.body;
        # puts "Here is body"
        # puts params[:body]
        # puts "\n here is page:  #{params[:page].class}"
        # if !params[:page]
        #     puts 'hehllo'
        # content.page = params[:page];
        # end
        content.page = params[:page].to_s || content.page;
        
        content.save;

        render json: content;
    end

    def delete
        content = Articlepage.find_by(id: params[:id]);
        render json: content;
        content.destroy;
        
    end

    def findByID
        
        content = Articlepage.find_by(id: params[:id])
        render json: content;
    end


    def category
        content = Articlepage.find_by(category: params[:category]);
        render json: content;
    end

    def dateRange
        content = Articlepage.where(createdOn: (params[:start]..params[:end]));
        render json: content;
    end

    def author
        content = Articlepage.find_by(author: params[:author]);
        render json: content;
    end

    def partialAuthor
        #sanitize_sql_like is used to consider % as input not as anything.
        content = Articlepage.where("author LIKE ?", "%" + Articlepage.sanitize_sql_like(params[:author]) + "%");
        render json: content;
    end



end
