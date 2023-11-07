# Frisbee Time Requirements

****

## Non-functional Requirements

1. Time - must be achievable within the course of the semester
2. Cost - must fall within a reasonable budget ($10 month)
3. Accessibility - Operates on mobile devices of different OSes
4. Meets the requirements for the App Store and the Google Play store
5. (Possible) Boston Common legality
6. (Possible) Exclude California and UK Residents

****

## Functional Requirements

1. Users define constraints for notifications. (Time, Amount of people, Temp)
2. The app facilitates the rapid assembly of spontaneous recreational activities, including, but not limited to, the
   playing of ultimate frisbee.
3. (Possible) Uses weather and location data to notify those interested.

### Questions for Customers

1. What would be the most liberating part of using an app like this?
2. What's the minimum number of people required for frisbee?
3. How much detail would you like to see when you get a notification that says: "The weather is nice, I think it's
   FrisbeeTime!"
4. What settings would you like to be able to control?
5. Would you sync your calendar with this app?
6. How much would you pay for this app?
7. What features are essential for this app?

****

## System Architecture

1. App allows for simple login via existing methods
2. App allows for login through email and password

****

## Customers

1. Hannah Watson
2. Jonathan Mast
3. Clayton Wagler
4. Conrad Stoltzfus

****

## Possible Expansions

1. Iphone widget

****

## System Practices

The code formatting follows the practices outlined at: https://dart.dev/tools/dart-format

### Code Naming Style

- Constants: CONSTANT_NAME
- Variables: variable_name
- Functions: functionName
- Classes: ClassName

### Risk Assessment

( These risks are prefixed with two numbers. The first number is the seriousness of the risk (1-5), and the second is
the probability (1-5))

- (2/1) Database leak that exposes the email addresses and passwords of users. The concern is not with hackers accessing
  frisbeetime. Rather, the concern is that users will duplicate their passwords used in our app, meaning that the hacker
  would gain access to other sites with the frisbeetime password. Our control for this risk is to follow Firebase's
  security recommendations, as our application is very typical.
