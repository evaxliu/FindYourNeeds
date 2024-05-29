## Identify which of the course topics you applied (e.g. secure data persistence) and describe how you applied them

#### Properties of People: Vision (Semantics and Contrast)
We added Semantics to our app which allows people who has low vision or blindness to use the app for the information that they need. They are able to understand what the buttons of the app do and hear information about each location.

#### Properties of People: Motor Control (e.g. Fitts’s Law)
We used Fitts' law to set the optimal initial zoom level on the map, so the users can get to the markers quickly and reduce the amount of time the cursor needs to be moved.

#### Stateless & stateful widgets
We have one stateful widget which handles obtaining current position information from the provider. This information is then used to display relevant locations close to the user's current position.
In our stateless widgets, we display information about a selected location a user wants to learn more about.

#### Accessing sensors (Accessing distance from location)
By using Geolocation, we pin point a user's current location and determine the distance the user is from all of the locations in our database. We then display the locations nearest to furthest for ease of access for the user.

#### Querying web services (Google Service API)

We used Google Service API, to access google maps and locations on the maps


#### Secure data persistence (remember which pin they last tapped on)

If you reload the app or close the app, it will show the last location the user zoomed into or moved to.



## Describe what changed from your original concept to your final implementation. Why did you make those changes from your original design vision?
Our original concept of the implementation was a simple map, that shows where resources like bathrooms, food banks, and libraries are. One thing we changed was now you can tap on the locations and see more information like the place has an overlap, like if this food bank has a bathroom as well. It's a separate view for the locations to display more information. Also, now in the new info page you can click "navigate to place" and if there is connection it will lead you to the place with google maps app or website.

## Discuss how doing this project challenged and/or deepened your understanding of these topics.
The research we did was how we deepened our understanding of this topic.
Like the thesis by Nava gave us awareness of how inaccessible hygienic products and resources are. We see the high rates of infections and diseases that come from not having the resources to be clean.
In " Journal of Social Distress and the Homeless", we see how an app like this can be beneficial, since their research saw that 94% of homeless adults owned a cellphone, and half owned a smartphone, if they have access to smartphones an app that shows all locations with resources could help some people.
In "Opinion: Starbucks may soon close its bathrooms to the public. Good hygiene is a human right", we can see how public bathrooms are seen as a basic human right but not many cities care. This creates a sense of vulnerability for the population who don't have any other options for personal hygiene and other resources.
In "Homelessness & Health: What's the Connection?", there is an increase in health problems with those who are experiencing homelessness due to the lack of access to safe and clean sanitation facilities.

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
Beemnet:
I think the most valuable thing I've learned in this class is how to test my own product with the accessibility documentation. Since every class, you write code and make apps or finish projects but it has never been a requirement or a thought to do that. It is fairly simple too with the contrast and semantics (or is it that flutter makes it easy). I’d say it was more of a mindset changer.

Eva:
The most valuable thing I've learned in this class is how to consider and implement accessibility within my software. While I've had experience working with a team to create a website that is more friendly to people from a specific technical background, I never considered people who have vision disabilities. This class opened my mind to becoming more inclusive through the software that I create.

Ha Vi:
The most valuable thing I learned in this class is working with a team on a project. I have not had the chance to work with a team on a project so I learned a lot about using Gitlab and making a functioning app. This will help me beyond this class because being able to work on code with multiple people poking at it is important in the real world. This will help during code reviewing and pushing actual products out into the public.


## If you could go back and give yourself 2-3 pieces of advice at the beginning of the class, what would you say and why? (Alternatively: what 2-3 pieces of advice would you give to future students who take CSE 340 and why?)
Beemnet:
The advice I would give to future students if they took 142/143 (not sure how 120’s work) is that this is going to have a similar structure with the resubmissions, but you should try on the first submission. It can get hard if you don’t keep up with the projects since you will be working on maybe three projects at a time if you wait for the resubmission to put in your first real try. Also, if this is your first look at dart/flutter so don’t wait to start.

Eva:
I'd say 2-3 pieces of advice I would give to future students is to do their best attempt during their first submission of the homeworks so they can maximize learning from the feedback for their resubmissions. I learned a lot about what I missed and need to remember considering when obtaining feedback for the assignments where I tried my best. I would also recommend future students to take good advantage of office hours and EdStem, this is more so general advice, but the TAs and professor were super helpful in answering any questions I had, even ones they never encountered before. For my third advice, I'd advise future students to not feel too daunted about the class. The class is very friendly with documentation and spec instructions during the homeworks so work hard and have fun!

Ha Vi:
If I were to go back and give myself 2-3 pieces of advice, I would say to start the assignments earlier to fully take advantage of the resubmission cycle. With the resubmission cycle there, I slacked off and didn't put in any effort for the first submission, shortening myself from the full learning. Another advice would be to take more advantage of office hours. I know the TAs are super helpful but I chose to struggle through the class by myself with the help of some of my peers. However, trying to find time that aligns with my schedule to ask the teaching team would've alleviate some of the stress I gave myself.
