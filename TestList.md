# FrisbeeTime Test Checklist
Look for malfunction of menus and UIs on various screensizes using FlutterFlow.
### Preparation:
- [ ] Disable notifications to anyone but the testing user during the duration (switch to development firebase connection).
- [ ] Pull the most recent version of the repository into a directory.
### Login Page:
- [ ] Login form responds to an incorrect username/password combination and refuses entry.
- [ ] Link to the create account page works correctly.
- [ ] No animations are broken.
- [ ] Test all other authentication methods are redirected to their respective locations properly.
### Create Account Page:
- [ ] Weak passwords notify the user.
- [ ] Existing email address toss an error and offer a redirect to the login page.
- [ ] Confirm confirmation email sends on creation with Email/Password option.
### Home Page:
- [ ] Live weather information for selected location displays properly.
- [ ] Link to settings page functions.
### Settings Page:
- [ ] Attempt a valid change to a field. Exit the settings page and re-enter to verify that the change has been saved. Repeat this for all fields.
- [ ] Attempt invalid form data and confirm that errors are thrown where appropriate.
### Other tests:
- [ ] Log in on a second device as an admin account and test the notification system with the widget in the settings page.
- [ ] Run the main.dart file to run the other tests and confirm that none have failed.
### Teardown:
- [ ] Reconnect to production database.
