# final_project

## Name
Find Your Needs

## Description
Find Your Needs (FYN) is an app for an aasier approach to finding basic needs. Whether you are homeless or have trouble accessing general resources such as food, hygiene, and libraries. FYN includes a real time map with all these resources in the greater seattle area along with a list to scroll through these resources, along with the ability to directly navigate to them.

## Visuals
### Screenshots

#### Home Page
<img src="assets/visuals/home_page.png" alt="Home Page" width="175"/>

#### Main View
<img src="assets/visuals/main_view.png" alt="Main View" width="175"/>

#### More Info
<img src="assets/visuals/more_info.png" alt="More Info" width="175"/>

#### Navigation Feature
<img src="assets/visuals/navigation_feature.png" alt="Navigation Feature" width="175"/>

## Installation
- clone repo above
- using terminal in project root, do the following:
    - flutter pub get
- navigate to ios directory and install ios dependencies:
    - cd ios
    - pod install

- if you have issues do the following in the projects root:
    - flutter clean
    - flutter build ios

## Usage
- All in one place navigate to various public resources with visuals including a map and a list along with a legend for reference. Also, has the ability to start direct navigation to a slected resource/location using your preferred phone map.

## Support
email: sshahb@uw.edu for any support and any issues.

## Contributing
Create a merge request or git action to contribute to Find Your Needs, and we will follow up.

## Authors and acknowledgment
Sulaiman, 
Ha Vi, 
Eva, 
Beemnet 

## License
Reach out to support for licensing and using.

## Project status
Find Your Needs - App is complete including stretch goals.

## Data Design and Data Flow
### Data Design

*   **Locations Database**: Collection of location data structures gotten from a JSON file (assets/location.json). Each location object has attributes such as name, latitude, longitude, type, and description. This data is loaded into the app on startup and is the main data structure from which map markers and list items are made and shown.
    
*   **Markers**: List of markers created based on the locations data. Each marker in the map corresponds to a location in the data, with properties such as position (latitude, longitude), icon, and info window content that displays details on tap directly on the map.

Keeping track of consistently:
- Users current location (latitude and longitude)
- Last shared preference on the map for data persistence

#### Data Flow

*   **Provider for Position and Location Data**:
    
    *   The **PositionProvider** is used to manage and show the user's current geolocation throughout the app (map current location and list for distance).        
    *   Listens for changes in the user's position using geolocation services from ios.
        
    *   When the position changes, **PositionProvider** updates the current latitude and longitude.
                
*   **Reactive Updates**:
    
    *   Changes in user location or interactions with the map (such as selecting a marker).
        
    *   Tapping on a location in the list opens a view with more details regarding that location.

    *   Ability to navigate to phones actual map app and instantly provides navigation details.
        
*   **Integration with Map API**:
    
    *   Google Maps API is used to provide a visual experience along with a list visual for users.
        
    *   Markers are put on the map based on the locations data (assets/location.json). Icons are used to differentiate between types of locations, with a legend for reference.
        
    *   Map API works with the **PositionProvider** to update the users current location marker.
        
    *   The map view reacts to user interactions such as zooming in and out and moving view to current location using the pin point button.
        
    *   App saves last known map position and zoom level to ensure data persistence, accomplished by using shared preferences for data persistence.

## Resources Used
Ben Shapiro, CSE 340 Staff and Eva's code from Food Finder Assigment. https://gitlab.cs.washington.edu/cse340-24spring-students/4_food_finder-evaliu02 <br/>
https://stackoverflow.com/questions/49959617/flutter-how-do-you-make-a-card-clickable <br/>
Ben Shapiro, CSE 340 Staff and Eva's code from Journal Assignment. https://gitlab.cs.washington.edu/cse340-24spring-students/5_journal-evaliu02 <br/>
https://dart.dev/language/branches#switch-statements <br/>
Google Maps <br/>
https://stackoverflow.com/questions/72060995/flutter-listview-padding <br/>
https://stackoverflow.com/questions/76064482/how-to-set-padding-on-text-widget <br/>
https://docs.flutter.dev/ui/layout <br/>
https://pub.dev/packages/google_maps_flutter_ios<br/>
https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#0 <br/>
https://medium.com/@ndubuisiaso/shared-preferences-in-flutter-a-guide-with-a-demonstrative-app-e03582ccce9a <br/>
https://pub.dev/packages/shared_preferences <br/>
https://stackoverflow.com/questions/55968628/google-maps-flutter-zoom-in-zoom-out <br/>
https://developers.google.com/maps/flutter-package/map-with-marker <br/>
