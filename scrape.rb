#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def phone_e(str,file)
	phone = (/[\(\s]\d+[\)*\s\-]+\d+\-\d+/)
	matchdata=str.match(phone)
	while matchdata!=nil
		puts file+" p "+matchdata[0]
		string=matchdata.post_match
		matchdata=string.match(phone)
	end
end

def email_e(str,file)
	email = (/[a-zA-Z]+[\s]*[@(at)](\s)*[a-z]+(\.[a-z]+)*\.edu/)
	matchdata=str.match(email)
	while matchdata!=nil
		puts file+" e "+matchdata[0]
		string=matchdata.post_match
		matchdata=string.match(email)
	end
end

dir = Dir.pwd + "/dev"

Dir.open(Dir.pwd + "/dev").each do |file|	
	#puts file
#=begin
#	node.each do |file|
	f=File.open(Dir.pwd + "/dev/" + file)
	doc = Nokogiri::HTML(f)
	string = doc.xpath("//body").text
	str = string
	phone_e(str,file)
	email_e(str,file)

#=end
end
	

