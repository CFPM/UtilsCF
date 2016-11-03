# UtilsCF

Basic utilities that makes ColdFusion bearable

##Installation

UtilsCF is installed using CFPM or can be downloaded from source

###CFPM

    cfpm add utils

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

## Request (HTTP Calls)

See [RequestCF](https://github.com/Prefinem/RequestCF)