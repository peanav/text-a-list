# Text-A-List

A texting application for managing multiple lists

![mobile screen shot](/screens/Text-A-List_mobile.png "mobile screen shot")

## Requriments
- Ruby
- MongoDB
- Heroku
- A Twilio Phone Number

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
