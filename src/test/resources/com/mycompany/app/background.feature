Feature: Background Feature

  Background: I have a job
    Given The job is nice
    And I get paid
    
  @EX-9
  Scenario: First Hello
    Given I have "first" task
    And Step from "First Hello" in "Background Feature" feature file
    When I attempt to solve it
    Then I surely succeed

  @smoke @EX-9
  Scenario: Second Hello
    Given I have "second" task
    And Step from "Second Hello" in "Background Feature" feature file
    When I attempt to solve it
    Then I surely succeed
    
   @EX-9
  Scenario: Third Hello
    Given I have "third" task
    And Step from "Third Hello" in "Background Feature" feature file
    When I attempt to solve it
    Then I surely succeed
