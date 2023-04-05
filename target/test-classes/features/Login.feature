Feature: Print Hello Ashwini

Background:
* def query = {status:'active',gender: 'female'}

  Scenario: Hello Ashwini
    * print 'Ashwini'
    * print 'Dyanda'

  Scenario: Hello Dyanda
    * def total = 200
    * def passed = 180
    * def failed = 10
    * print 'Skipped =' + (total - passed - failed)
    
   Scenario: JSON reader
   * def jsonObject =
   """
 {
  "Actors": [
    {
      "name": "Tom Cruise",
      "age": 56,
      "Born At": "Syracuse, NY",
      "Birthdate": "July 3, 1962",
      "photo": "https://jsonformatter.org/img/tom-cruise.jpg",
      "wife": null,
      "weight": 67.5,
      "hasChildren": true,
      "hasGreyHair": false,
      "children": [
        "Suri",
        "Isabella Jane",
        "Connor"
      ]
    },
    {
      "name": "Robert Downey Jr.",
      "age": 53,
      "Born At": "New York City, NY",
      "Birthdate": "April 4, 1965",
      "photo": "https://jsonformatter.org/img/Robert-Downey-Jr.jpg",
      "wife": "Susan Downey",
      "weight": 77.1,
      "hasChildren": true,
      "hasGreyHair": false,
      "children": [
        "Indio Falconer",
        "Avri Roel",
        "Exton Elias"
      ]
    }
  ]
}
   """ 
   * print jsonObject
   * print 'hello ' + jsonObject.Actors[1].children[1]
   
   Scenario: Get User Details
   * def query1 = { id: 729051}
   Given url 'https://gorest.co.in/public/v1/users'
   #And path '729055'
   And params query
   And params query1
 	 When method GET
 	 Then status 200 
   * print response
   * def jsonResponse = response
   * def count = jsonResponse.data.length
   * match count == 1
   * def username = jsonResponse.data[0].name
   * print username
   * match username == 'Gopi Kakkar'
   
    Scenario: User Not Found
   Given url 'https://gorest.co.in/public/v1/users'
   And path '7255'
 	 When method GET
 	 Then status 404 
 	 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
