# Text-A-List

A texting application for managing multiple lists

![mobile screen shot](/screens/Text-A-List_mobile.png "mobile screen shot")

## Requirements
- Ruby
- MongoDB You can get a free one @ [MongoLab](http://mongolab.com) or [MongoHQ](http://mongohq.com)
- Heroku
- A Twilio Phone Number

## How to Use
Add Item to List:
```
[ListName] Item1, Item2, Item3

Target milk, dog food, chips
```

Retrive List:
```
List [ListName]

List Target
```

Clear List:
```
Clear [ListName]

Clear Target
```
 

## Getting Started

Start by runnig this rake task
```
rake heroku:create_config
```

You will now have a .env file at the project root that is ready to fill out
```
MONGO_URI=
TWILIO_SID=
TWILIO_TOKEN=
TWILIO_NUMBER=
```

After you have entered your settings run this rake task
```
rake heroku:upload_config
```

Then deploy to heroku
```
heroku create
git push heroku master
heroku open
```

Now, set up Twilio to post to your app instance
Go to the Manage Numbers page in your Twilio account. <https://www.twilio.com/user/account/phone-numbers/incoming>. Click on the number you want to use and fill in the *Messaging Request URL*
```
http://[your-heroku-app-name].herokuapp.com/sms
```

Your Text-A-List app is ready for use!

## Web Client
There is also a web client that gives a read-only view into the lists.

![web screen shot](/screens/Text-A-List_web.png "web screen shot")

To run the web client locally, run:
```
foreman start
```
And then visit http://localhost:5000
