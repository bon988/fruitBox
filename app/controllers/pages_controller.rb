class PagesController < ApplicationController
    
    def about
        @title = 'About Us';
        @content = 'Leading fruit and veg box service';
    end
end
