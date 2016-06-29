# UtilsCF
Basic utilities that makes Coldfusion bearable

##API

Because will all the api calls there are out today, I decided to make a single component that could handle the most common use cases.  If you find a common use case to be missing, please open an issue for your use case.

### Basic Usage

There are two main methods, get() and post().  They accept the same parameters with the exception being a body for post requests.

#### Params
    requestURL (string): URL Endpoing (not including query string)
    params (struct): Parameters to be sent through form fields (if POST) or through the url (if GET)
    headers (struct): Any key value pair for headers you want to send along
    body (string): ONLY FOR POST REQUESTS, sends a body

#### GET

    var request = application.requre('utils').request.get(url, {'query':'test'});

#### POST

    var request = application.requre('utils').request.post(url, {'query':'test'});

with body

    var request = application.requre('utils').request.post(url, {'query':'test'}, {}, body);


### Response

Utils.API will try and return a ColdFusion based response.  If the response is JSON, you will get a parsed ColdFusion struct.  If XML, then XML.  Lastly, we return the body if we can't figure it out

### Bad Responses

If a non 200 type response was given, we through an error with the response (string) of the status code.  Handle with a try/catch when using this call

## Basic Methods

### upperCaseWords(string)

Return a string with the first letter of each work capitalized

### parseQueryString(string)

Parses a query string into a nice key value struct

### time(time='', format='')

Handles times.
Without any parameters passed, sends back current unix time stamp.

    var unixTimeStamp = application('utils').time();

With time being passed in, determines if unix time stamp, and converts it to ColdFusion native DateTime, else, converts ColdFusion native DateTime to unix time stamp.

    var dateTime = application('utils').time(unixTimeStamp);
    var unixTimeStamp = application('utils').time(NOW());

With format being passed in, and with time empty or with time being passed in, converts either NOW() or time into human legibal format using dateTimeFormat

    var date = application('utils').time(unixTimeStamp, 'short');  // MM/DD/YY HH:MM AM|PM
    var date = application('utils').time(NOW(), 'short');  // MM/DD/YY HH:MM AM|PM

### sortArrayofStructs(array, key, order='asc')

    Sorts and Array of Structs.

