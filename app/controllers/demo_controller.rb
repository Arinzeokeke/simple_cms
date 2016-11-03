class DemoController < ApplicationController
	#layout false
	@list= ['a', 's', 'd', 'f']

	def initialise
		
	end
	def index
		@name = 'jay'
		@list = ['a', 's', 'd', 'f']
	end

	def hello
		render('index')

	end

	def text_helpers

	end
end
