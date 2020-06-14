class HelloController < ApplicationController
    def index
        render html: "Hello World"    
    end
end
