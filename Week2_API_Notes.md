# Week 2 API Notes 

## Links
Links to places(headers) in the document
- [Week 2 API Notes](#week-2-api-notes)
  - [Links](#links)
    - [HTML](#html)
    - [JSON](#json)
    - [REST APIs](#rest-apis)
_____






### HTML

> **What is HTTP?**
>> Hypertext Transfer Protocol (HTTP) application layer protocol
>> designed for communication between browsers and web server
>> Tradionally used to transfer HTML Documents.

>**What does a request-response style protocol mean?**
>> Like a letter, only returns infomation when a request is received.
>> Connection will be shutdown once the infomation as been received.
 
>**What does statelessness mean with HTTP?**
>>Does not Store any information about the sender cheats all requests as separate and are not associated with each other.
>>Therefore each request must contain is own infomation. 

>**What is found in an HTTP request?**
>>* GET / HTTP/1.1 (HTTP Method/version)
>>  * Host: URL where the request is being sent to
>> * User-agent: The thing that is creating the HTTP Request
>> * Accept: */* What we want to get back (*/* - anything)
>> * blank line

>>Word: is a header (meta data regarding the request)

>>can also include body

>**What is included within a HTTP response?**
>>* HTTP/1.1 200 OK (HTTP Method and status code)
>>* Server (name of server)
>>* Current Date and time
>>* Content-Type: html, Charset (what method to encode)
>>* Content Length
>>* Connection Keep Alive (Tries to keep the connection aveilable)
>>* Cookies
>>* Expires(when the conneciton expires)
>>* Cache-control (specifying to cache or not cache the request)
>>* !DOCTYPE HTML (Body of the HTTP Response)
>>* Pragma

>**What are cookies?**
>>A small block of data created by the web sever that is placed on the users computer.  
Index number of the client

>**What are Requests methods?**
>>* GET
>>* HEAD - Asks for a response identical to GET but without the response body
>>* POST
>>* PUT
>>* DELETE
>>* PATCH
>>* OPTIONS
>>* TRACE - Loopback
Requests methods, also known as HTTP methods, define the actions that can be performed on a given resource in a web server. 

>**What are they (cookies) used for?**
Enable the storage of stateful infomation.
Allows for the linking of multiple requests from the same client.
Identify a specific client 
Applys partial modifications to a resource
Marketing purposes

>**What are the different types of HTTP response status codes?**
>> 100 Waiting Message:
>>>* 100 - Contiune
>>>* 101 - Switching Protocols
>>>* 102 - Processing
>>>* 103 - Early hint

>> 200 OK Message:
>>>* 200 - Success
>>>* 201 - Created
>>>* 202 - Accpeted
>>>* 204 - No Content

>> 300 Resource Moved Message(Redirected):
>>>* 301 - Moved permanently

>> 400 Client Error Message:
>>>* 403 - Forbidden
>>>* 404 - Not Found

>> 500 Sever Error Message:
>>>* 500 - Internal Server Error


>**What are the HTTP CRUD request methods we can use?**

>>* [x] POST – Used to Create a resource on the server.
>>* [x] GET – Used to Read or retrieve a resource.
>>* [x] PUT – Used to Update an existing resource by replacing it completely.
>>* [x] PATCH – Used to Partially Update a resource.
>>* [x] DELETE – Used to Delete a resource.
(Create, Read, Update, Delete)
    

>**What is the difference between (POST, ) PUT and PATCH?**
>>* POST methods submits an entity to the specified resource often causing a change in state to the server.
if the entity already exists post cannot be used
if the  entity already exists, put request will update it
>>* PUT Replace all current representions of the target reousrce with the request payload.
>>* PATCH Modify request will error if entry does not exist unlike put


>**What is DNS?**
>>Domain Name system DNS Translate domain names to IP addresses

>**What is the difference between HTTP and HTTPS?**
>HTTPS is encrypted 
Uses SSL/TLS
Port 443

### JSON
Just Text

JAVAscript Object Notation

Javascript is now ECMAscript
### REST APIs

>**What is a REST API?**
>>A mechaisms which allows two Computer Programs to communicate with each other.

>>Rest - Reprentional State of Transfer 
>>* Archtiecural Style (an apporach for devloping an API)
>>* Not a standard
>>* Not an implmentation of technology 
>>* Restful means complying with the architetual Style 
>>* Popular because its easy to call from web pages and mobile data, General intergation of applications

>**What are the REST API criteria and what do they mean?**
>>* Client-sever architecture - The client makes requests and the server gives a response.
>>* Statelessness - no client infomation is stored on the server
>>* Cacheability  - Store infomation locally to reduce requests
>>* Layered system - Know not know if the client is going through and immdiatery. The client should not be aware of whether it is directly communicating with the server or an intermediary.
>>* Uniform interface - Self-descriptive messages, consistent set of rulles for clients, well-defined end point data, formats
>>* HATEOAS

>**What is the importance of a layered system?**
>>>* Resource manipulation through representations, 
>>>* Resource identitcation in reequests, 
>>>* data format transferred not the same as storage. 
>>>* Self-descriptive messages (tells in the message if what in wants)
Hypermeida as the engine application state return request should suggest where to go to find other similiar media

Allows for scalability and Security

>**What is a REST endpoint?**
Rest Endpoint is a specifc URL or URI used to interact with a RESTful API
URIs - Uniform resource identifers/ methods
Representing the data
JSON, XML
Describe the servicew

>**What's the relevance of plurals in the urls of REST APIs?**
    When the URL represents a collection of resources, it is standard to use plural nouns. This makes sense because the endpoint is meant to handle multiple items or instances of a resource.

>**What does CRUD describe?**
>>(Create(Post or  put), Read, Update(Put or Patch), Delete)
Get Post, put patch delete
5 important HTTP Methods
    

>**What is an API key?**
>>Encrytion key?
>>An API key is a unique identifier used to authenticate a user, application, or service when interacting with an API 

>**What is HATEOAS - Hypertext As The Engine Of Application State**
>>A REST API criteria
>> Returning links to find out more infomation 
 engine application state return request should suggest where to go to find other similiar media
Give links to load other information



Quesstion mark on the end of the URL and filter the results