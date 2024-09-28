Feature: petStore REST API Testing

  Background:
    * url baseUrl
    * def body = read('classpath:petStore/json/templateAddPet.json')
    * def data = read('classpath:petStore/json/data.json')
    * set body.id = data.id
    * set body.category.id = data.categoryId
    * set body.category.name = data.categoryName
    * set body.name = data.name
    * set body.photoUrls[0] = data.photoUrls
    * set body.tags[0].id = data.tagId
    * set body.tags[0].name = data.tagName
    * set body.status = data.status
    * header 'Content-Type' = 'application/json'

  Scenario: Add a pet to the store
    Given path '/pet'
    And request body
    And print body
    When method post
    Then status 200
    And match response.id == data.id
    And match response.name == data.name
    And match response.status == data.status

  Scenario: Consult the previously entered pet (Search by ID)
    Given path '/pet/',data.id
    When method get
    Then status 200
    And match response.name == data.name
    And match response.category.name == data.categoryName
    And match response.tags[0].name == data.tagName
    And match response.status == data.status

  Scenario: Update pet name and pet status to sold
    Given path '/pet/', data.id
    And form field name = 'Toby'
    And form field status = 'sold'
    When method post
    Then status 200
    And match response.message == data.id.toString()

  Scenario: Check the modified pet by status (Search by status)
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    * def pet = null
    * response.forEach(function(x){ if(x.id == data.id) pet = x })
    And match pet.id == data.id
    And match pet.name == 'Toby'
    And match pet.category.name == data.categoryName
    And match pet.tags[0].name == data.tagName
    And match pet.status == 'sold'






