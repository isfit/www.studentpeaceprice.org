# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
tabs = Tab.create([{ :name_en => 'HOME', :order=> 0, :tag=>'home', :name_no =>'HJEM'}, { :name_en => 'ABOUT', :order=> 1, :tag=>'about', :name_no =>'OM SPP'}, { :name_en => 'PRIZE LAUREATES', :order=> 2, :tag=>'laureates', :name_no =>'HJEM'}, { :name_en => 'PRIZE COMMITTEES', :order=> 3, :tag=>'committees', :name_no =>'HJEM'}, { :name_en => 'PRESS CENTER', :order=> 4, :tag=>'press', :name_no =>'HJEM'}, { :name_en => 'CONTACT', :order=> 5, :tag=>'contact', :name_no =>'HJEM'}])


sublinks = Sublink.create([{:tab_id =>2, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>2, :title_en=> "History", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>3, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>4, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>5, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>6, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1}])

pages = Page.create(:title_en=>"THE STUDENT PEACE PRIZE PRESENT AND THE FUTURE", :ingress_en=>"BLABLA", :body_en=>"BLABLABLABLA")
