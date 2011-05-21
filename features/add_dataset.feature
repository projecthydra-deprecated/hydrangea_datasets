@new @dataset 
Feature: Add a new Dataset
  In order to publish a Dataset
  As a Depositor
  I want to submit a new Dataset
  
  Scenario: Visit New Dataset Page
    Given I am logged in as "archivist1" with "admin_policy_object_editor" permissions
    And I am on the home page	
    And I create a new hydrangea_dataset
    Then I should see "Describe the Dataset"
    And the "Title:" inline edit should be empty
