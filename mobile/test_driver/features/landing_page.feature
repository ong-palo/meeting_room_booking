Feature: Landing page

  Scenario: As a user, I have launched the meeting room booking app
    Given I open the app
    When I am in "landing_page" page
    Then I should see "landing_page_palo_logo"
    And I should see "landing_page_intro_text"
    And I should see "landing_page_login_button"
    And I should see "landing_page_sign_up_button"

    When I tap on "landing_page_login_button"
    Then I should see "login_page" page

