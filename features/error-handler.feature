Feature: Generators for Ixtlan Error Handler

  Scenario: a rails application which uses ixtlan-error-handler gem
    Given I create new rails application with template "error-handler.template" and "error-handler" files
    And I execute "rake error_handler"
    Then the output should contain "Ixtlan::Errors::ErrorDumper"
