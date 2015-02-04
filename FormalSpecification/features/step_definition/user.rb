Given(/^"(.*?)" sees the "(.*?)" page$/) do |arg1, arg2|
  puts arg1, arg2
  currUrl = arg2 + '.jsp'
  visit(currUrl)
  currPage = page
end

Then(/^"(.*?)" should see the "(.*?)" button$/) do |arg1, arg2|
  puts arg1, arg2
  raise "User has not logged in." unless page.has_button?(arg2) 
end









Given(/^user is on "(.*?)" page$/) do |arg1|
      puts arg1
   currUrl = arg1 + '.jsp'
   visit(currUrl)
   currPage = page
end


When(/^user "(.*?)" the registration page$/) do |arg1|
    fill_in('member_login', :with => "arjunp")
  fill_in('member_password', :with => "arjunp" )
  fill_in('member_password2', :with => "arjunp")
fill_in('first_name', :with => "arjun")
fill_in('last_name', :with => "p")
  fill_in('email', :with => "arj@gmail.com")
  click_button('Register')
end

Then(/^user should see a "(.*?)" page$/) do |arg1|
  goToUrl = arg1+'.jsp'
  visit goToUrl
end


Given(/^user sees the "(.*?)" page$/) do |arg1|
        puts arg1
   currUrl = arg1 + '.jsp'
   visit(currUrl)
   currPage = page
end

When(/^"(.*?)" logs in$/) do |arg1|
    fill_in "Login", with: arg1
  fill_in "Password", with: arg1
click_button('Login')
end

Then(/^user should see the "(.*?)" page$/) do |arg1|
    goToUrl = arg1+'.jsp'
  visit goToUrl
end


When(/^user searches for a  "(.*?)" book present in the database$/) do |arg1|
    	fill_in "name",with:arg1
       click_button('Search')
end

Then(/^user should see the "(.*?)" book details$/) do |arg1|
	raise "No such content" unless page.has_content?(arg1)
end


Then(/^item returned is "(.*?)"$/) do |arg1|
  raise "No such content" unless page.has_content?(arg1)
end


Given(/^"(.*?)" is logged in as guest$/) do |arg1|
  fill_in "Login", with: arg1
  fill_in "Password", with: arg1
click_button('Login')
end

When(/^user clicks "(.*?)"$/) do |arg1|
      goToUrl = arg1+'.jsp'
  visit goToUrl
end

Then(/^user should not see "(.*?)" page$/) do |arg1|
	page.should have_no_content(arg1)
	page.should have_content('Enter login and password')
end


When(/^user clicks on book "(.*?)"$/) do |arg1|
        goToUrl =  'BookDetail.jsp?item_id=' + arg1 + '&'
  visit goToUrl
end

When(/^clicks "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^user should see the item in "(.*?)" page$/) do |arg1|
  page.should have_content('Web Database Development : Step by Step')
 page.should have_content('Total')
end

Then(/^user should see the "(.*?)" in ShoppingCart page$/) do |arg1|
  	page.should have_content(arg1)
	page.should have_content('Total')
end




