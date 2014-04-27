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

  factory :opportunity do
    name                  "Test Program"
    company               "Airline Company"
    logo                  "some_logo.png"
    program_type          "Cadet Program"
    duration              "3 to 6 months"
    post_graduation       "ATPL and job"
    website               "http://idealopp.com"
    rating                8.5
    general_information   "Some general information text"
    requirements          ({"Foo_d" => "Bar_d", "Bar" => "Foo"})
    medical_requirements  ({"Foo_a" => "Bar_aa", "Bar_a" => "Foo_aa"})
    additional            ({"somekey" => ["Bar_bb", "Ba_rcode", "Lovely"], "someotherkey" => ["Foo_bb"]})
  end
end