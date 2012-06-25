Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #assert false, "Unimplmemented"
end

When /I go to the edit page for "(.*)"/ do |item|
  result=Movie.find_by_title(item)
  visit edit_movie_path(result[:id])
end

Then /the\s?director\s?of\s?"(.*)"\s?should\s?be\s?"(.*)"$/ do |item,dir|
  result=Movie.find_by_title(item)
  assert result[:director]== dir
end

Given /I am on the details page for "(.*)"$/ do |item|
   result=Movie.find_by_title(item)
   visit movie_path(result[:id])
end
   
Then /I should be on the Similar Movies page for "(.*)"/ do |item|
  movie=Movie.find_by_title(item)
  id=movie.id
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/movies/similar/#{id}"
  else
    assert_equal "/movies/similar/#{id}", current_path
  end  
end
