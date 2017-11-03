# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    ##### duplicates #########
    when /the tutee edit info page/
      edit_tutee_path
    
    when /the tutee show page/
      tutee_path

    when /the tutor edit info page/
      edit_tutor_path 

    when /the tutee sign in page/
      new_tutee_session_path

    when /the tutor sign in page/
      new_tutor_session_path

    ##############################

    when /^the home\s?page$/ 
      '/'
      
    when /^Tutee Information Form for User (.*)$/
     "/tutees/#{$1}/edit"

    when /^Tutee Submitted Form for User (.*)$/
     "/tutees/#{$1}"
     
    when /^Tutor Information Form for User (.*)$/
     "/tutors/#{$1}/edit"

    when /^Tutor Submitted Form for User (.*)$/
     "/tutors/#{$1}"

    when /^the tutor login page$/
      '/tutors/sign_in'

    when /^the tutee login page$/
      '/tutees/sign_in'

    when /^the tutee registration page$/
      '/tutees/sign_up'

    when /^the tutor registration page$/
      '/tutors/sign_up'
      
    when /^the tutor match page for tutee (.*)$/
      "/tutees/#{$1}/tutor_match"
      
    
    when /^the tutee match page for tutor (.*)$/
      "/tutors/#{$1}/tutee_match"
      
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
