## Rent Rabbit App

The purpose of Rent Rabbit is to allow members to rent gear that they are not using to other members that only need something temporarily or are wanting to give a piece of equipment a test run before purchasing.  

RR allows signed up users to post items for rent as well as search available items posted by other users.  Once a transaction has taken place, users are encouraged to rate and review their experience to better inform future interaction.<br>

<b>Installation</b>
Once the app is downloaded:
bundle install 
rake db:create
rake db:migrate

Will also require a .env file for cloudinary url to enable image uploads as well as facebook key and secret for facebook login capabilities.

<b>Process</b>
Our app required the following models:
user -- has many items and has and belongs to many reviews
item -- belongs to user
review -- has and belongs to many users

The tech we used is listed below.

We used Trello and Slack to track progress and communicate.

Tasks were broken up at first based on what we each wanted to tackle.  Once a foundation was built, we each continued to maintain our original areas of the site while also collaborating on solving problems or creating features as they arised.  

<b>Link</b>

https://rent-rabbit.herokuapp.com/

<b>The site was created using the following technology:</b>

Front End:
HTML5, CSS3, Bootstrap, Javascript, JQuery 

Server:
Ruby, Rails

Database:
PostgreSQL 

<b>API's Used:</b>
Cloudinary for uploading profile and item images.

Facebook for OAuth and Facebook login.

<b>Hurdles</b>
Heroku deployment as well as browser compatability affected negatively rendering of home page effects and appearance. 

Heroku also would not allow password reset functionality among other things.

<b>Future Improvements</b>
Current user to user contact method not optimal.  Internal messaging or another more secure method would be desirable.  Automatic email updates available to inform users of events such as upcoming rental return dates, etc.

Google maps integration for displaying items/renters closer to user first as well as general awareness of distances.

Some sort of payment arrangement system to streamline the user rental process.

<b>User Stories</b>
As a Renter: I'm looking for an easy, user friendly platform to list things that I don't use seasonally for others to rent and to make money.

As a Consumer: I'm looking for a quick and easy way to search and find things I want to rent for a couple days so I don't have to pay fully for something I may not end up doing in the future.

As a Consumer: I'm especially paranoid about any information that is on any website. If I use this service, I want to know that the things I want to rent are actually viable, and I don't want to have to deal with payments on my end. I also want to make sure my financial details are secure and none of my information will be easily accessible by others.

<a href="http://i.imgur.com/gthDAqB.jpg">Wireframe</a>
