# Returns the full title on a per-page basis.
def full_title(page_title)
  base_title = "Pilot App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

#Returns the text displayed according to rating
def rating_text(rating)
  base = " Level Opportunity"
  if rating>9
    "Ruby"+base
  elsif rating>7.5
    "Gold"+base
  elsif rating>6
    "Silver"+base
  else
    "Bronze"+base
  end
end

#Returns css class of the rating
def rating_css(rating)
  if rating>9
    "ruby"
  elsif rating>7.5
    "gold"
  elsif rating>6
    "silver"
  else
    "bronze"
  end
end