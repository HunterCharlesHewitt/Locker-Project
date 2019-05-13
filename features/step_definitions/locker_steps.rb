Given("I am on the locker page") do
    visit "/locker"
end

When("I click on the create button") do 
     click_on("Create Locker")
end

Then(I should refresh the page) do
    #assert page.current_path, 'locker' FIXME
end
