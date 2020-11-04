# NETFLUX_API

## An API setup specifically to be used by my NETFLUX frontend (https://github.com/gilv93/NETFLUX).

Current relevant endpoints:
* https://shielded-castle-53505.herokuapp.com/movies/ - pulls up full list of movies in DB
* https://shielded-castle-53505.herokuapp.com/movies/:category - pulls up list of movies that match specified category parameter

## To-do:

* Create endpoint to allow for search for specific movies based off of ID
* Create nested endpoint that alters https://shielded-castle-53505.herokuapp.com/movies/:category to /movies/category/:category to allow separating from https://shielded-castle-53505.herokuapp.com/movies/:id

* Refactor project and include tests
