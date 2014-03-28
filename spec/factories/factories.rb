FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :airport do
  	name	"Example Aiport"
  	city	"Foo"
  	state	"Bar"
  	website	"http://www.foobar.com"
  end
end