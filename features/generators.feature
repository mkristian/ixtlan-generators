Feature: Generators for Ixtlan

  Scenario: Create a rails application and adding 'ixtlan-generators' gem will provide the ixtlan generators
    Given I create new rails application with template "generators.template"
    And I execute "rails generate"
    Then the output should contain "ixtlan:setup" and "ixtlan:configuration_model" and "ixtlan:configuration_scaffold"
