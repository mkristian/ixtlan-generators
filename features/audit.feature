Feature: Generators for Ixtlan Audit

  Scenario: a rails application which uses ixtlan-audit gem
    Given I create new rails application with template "audit.template" and "audit" files
    And I execute "rake audit"
    Then the output should contain "Ixtlan::Audit::Manager"
