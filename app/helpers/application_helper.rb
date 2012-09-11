module ApplicationHelper

	def self.extract_articles(file_path)
	    articles = []
	    File.open(file_path, 'r') do |f|
		is_title,is_body=false,false
		title,body="",""
		f.each_line do |line|
		    if(line =~ /===title===/)
			is_title=true 
			is_body=false
			unless(body == "")
                            articles << Article.new(title,body)
			    title=""
			    body=""
			end
		    elsif(line =~ /===body===/)
			is_body=true 
			is_title=false
		    elsif(is_body)
			body << line
		    elsif(is_title)
	      	        title << line		    
		    end	    
		end
	    end
	    articles
	end

end
