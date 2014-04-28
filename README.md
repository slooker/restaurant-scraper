== README

I'm using mysql for this.  I'm not sure if you can use it with SQLite or not, but there's a lot of things used for geolocation through geokit-rails.

Here are a few examples:

## Return the closest restaurants to this latitude and longitude
http://ssh.codeforvegas.org:3000/lat/36.172315/long/-115.139412

## Return the closest restaurants to this latitude and longitude, within range of 5 miles
http://ssh.codeforvegas.org:3000/lat/36.172315/long/-115.139412/range/5 

## Get restaurant id 1
http://ssh.codeforvegas.org:3000/restaurants/1

## Get restaurant id 1 inspections
http://ssh.codeforvegas.org:3000/restaurants/1/inspections

## Get restaurant id 1 current violations
http://ssh.codeforvegas.org:3000/restaurants/1/violations

## Get inspection id 1
http://ssh.codeforvegas.org:3000/inspections/1

## Get violations for inspection id 1
http://ssh.codeforvegas.org:3000/inspections/1/violations

