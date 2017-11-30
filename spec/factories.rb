FactoryBot.define do
  factory :tutee do
    first_name "John"
    last_name  "Doe"
    email "john_doe@gmail.com"
    password "password"
    password_confirmation "password"
    sid "12345678"
    grade "Freshman"
    phone_number "012-345-6789"
    semesters_at_cal "1"
    major "Media Studies"
    requested_class "English R1A"

    # factory :tutee_with_time_availabilitys do
    #     transient do 
    #         time_availabilitys_count 1
    #     end

    #     after(:create) do |tutee, evaluator|
    #         create_list(:time_availability, evaluator.time_availabilitys_count, tutee: tutee)
    #     end
    # end
    # time_availability
  end

  factory :tutor do
    first_name "Bob"
    last_name  "Ross"
    email "bob_ross@gmail.com"
    password "password"
    password_confirmation "password"
    sid "87654321"
    year "Senior"
    phone_number "987-654-3210"
    major "Haas"
    tutor_cohort "1"
    bio "I am Bob Ross"
    # factory :tutor_with_time_availabilitys do
    #     transient do 
    #         time_availabilitys_count 1
    #     end

    #     after(:create) do |tutor, evaluator|
    #         create_list(:time_availability, evaluator.time_availabilitys_count, tutor: tutor)
    #     end
    # end
    # time_availability
  end

  factory :time_availability do
    day "Monday"
    start_time 8
    tutor
    tutee
  end
end