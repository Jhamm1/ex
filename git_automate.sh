#!/bin/sh



#Check for collection in collection directory
cd Newman_tests/collections
file="exampleAPI_test-collection.postman_collection"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
fi

echo Hello, who am I talking to?
read varname
echo It\'s nice to meet you $varname