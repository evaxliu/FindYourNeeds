## Identify which of the course topics you applied (e.g. secure data persistence) and describe how you applied them

#### Properties of People: Vision (Semantics and Contrast)
We added Semantics to our app which allows people who has low vision or blindness to use the app for the information that they need. They are able to understand what the buttons of the app do and hear information about each location.

#### Properties of People: Motor Control (e.g. Fitts’s Law)


#### Stateless & stateful widgets
We have one stateful widget which handles obtaining current position information from the provider. This information is then used to display relevant locations close to the user's current position.
In our stateless widgets, we display information about a selected location a user wants to learn more about.

#### Accessing sensors (Accessing distance from location)
By using Geolocation, we pin point a user's current location and determine the distance the user is from all of the locations in our database. We then display the locations nearest to furthest for ease of access for the user.

#### Querying web services (Google Service API)


#### Secure data persistence (remember which pin they last tapped on)

## Describe what changed from your original concept to your final implementation. Why did you make those changes from your original design vision?


## Discuss how doing this project challenged and/or deepened your understanding of these topics.


## Describe two areas of future work for your app, including how you could increase the accessibility and usability of this app
One area for future work is reducing the app's reliance on cellular data even more by switching from Google Maps API to creating our own map of location information and storing it as app storage locally on a person's machine. This avoids a possible invisible paywall since cellular data costs a lot of money.
Another area for future work is allowing the user to pin specific locations that they had good experiences at so they won't need to remember it themselves, reducing mental burden.

## Cite anything (website or other resource) or anyone who assisted you in creating your solution to this assignment. (Remember to include all online resources such as Stack Overflow, blogs, students in this class, or TAs and instructors who helped you during OH)
Ben Shapiro, CSE 340 Staff and Eva's code from Food Finder Assigment. https://gitlab.cs.washington.edu/cse340-24spring-students/4_food_finder-evaliu02 <br/>
https://stackoverflow.com/questions/49959617/flutter-how-do-you-make-a-card-clickable <br/>
Ben Shapiro, CSE 340 Staff and Eva's code from Journal Assignment. https://gitlab.cs.washington.edu/cse340-24spring-students/5_journal-evaliu02 <br/>
https://dart.dev/language/branches#switch-statements <br/>
Google Maps <br/>
https://stackoverflow.com/questions/72060995/flutter-listview-padding <br/>
https://stackoverflow.com/questions/76064482/how-to-set-padding-on-text-widget <br/>
https://docs.flutter.dev/ui/layout <br/>

## What do you feel was the most valuable thing you learned in CSE 340 that will help you beyond this class, and why?


## If you could go back and give yourself 2-3 pieces of advice at the beginning of the class, what would you say and why? (Alternatively: what 2-3 pieces of advice would you give to future students who take CSE 340 and why?)

