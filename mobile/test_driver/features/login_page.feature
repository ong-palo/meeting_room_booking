Feature: Login page

    Scenario: As a user, I have launched the meeting room booking app
        Given: I open the app
        When: I am in "landing_page"

        When I tap on "landing_page_login_button"
        Then I should see "login_page"
        And I should see "login_page_email_input"
        And I should see "login_page_password_input"

        When I fill "password" in "login_page_password_input"
        Then I should see "password" appear in "login_page_password_input"

        When I tap on "login_page_login_button"
        Then I should see "my_booking_page"



