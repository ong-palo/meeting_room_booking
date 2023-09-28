Feature: Login page

    Scenario: As a user, I have launched the meeting room booking app
        Given: I am in "landing_page" page

        When I tap the "landing_page_login_button"
        Then I am in "login_page" page
        And I should see "login_page_email_input"
        And I should see "login_page_password_input"

        When I fill "login_page_password_input" with "password"
        Then I should see value "password" appear in "login_page_password_input"

        When I tap the "login_page_login_button"
        Then I am in "my_booking_page" page



