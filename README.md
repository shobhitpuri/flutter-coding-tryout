
## Notes

*Any notes you might want us to be aware of.*

My main approach throughout the tryout opporunity has been to approach this like a real production app. This includes writing clean, well commented, decoupled, well architected and testable code. I've also tried to show the processes that I follow along the way to achieve that.
___

### Features Implemented:
You can find the set of the tasks I worked on by seeing the `Done` tab on the [GitHub Project Board](https://github.com/shobhitpuri/thinkific-tryout/projects/1). Here is a consise list
  - Created a widget showing to show current weather details like temperature, humidity, min / max temperature, location, description and weather condition icon. The weather icon fetched from network, is also cached for better performance. 
  - Added custom background for all weather conditions. Converted the locally stored images to `webp` format to get better performance and smaller size.
  - Implemented pull-to-refresh to enable user to refresh the location and weather information.
  - Integrated Open Weather API to fetch weather data, given latitude and longitude.
  - Integrated `geocoder` to get the current device location to extract latitude and longitude.
  - Handled corner cases of permission decline, disabled location services, network errors etc.
  - Added splash screen, app icon, customized .gitignore file etc.
  - Added unit tests.
   
 ___
 
### Submission Date

03-Feb-2021
___

### Instructions for how to build & run the app. 
*Please provide any information we need to be able to review your app.*
#### Demo / Installation
- **Install the Android app** from here: https://www.dropbox.com/s/rh2aqkcaxxyxtia/WeatherApp_Release_Shobhit.apk?dl=0 . I've also included this release build in the folder named `apk` above. To install the apk, you might need to allow your Android OS to install `apk` from unknown sources from the `Settings` app. I also released the app on Google Play, to use the private closed alpha testing that they offer. It is still pending review and won't be public. It'd require me to add the gmail IDs of the testers to allow installation. Here is the URL: https://play.google.com/apps/internaltest/4700635866713086531 . Let me know if you want an invitation. Simplest is to just use the dropbox link to install.

- **Demo video of the app running on Android phone** here:

  [![Android Video](https://user-images.githubusercontent.com/3515359/106855777-58612b00-6672-11eb-87c8-6168cf642b60.png)](https://youtu.be/NHb9mDPB1bA)

  https://youtu.be/NHb9mDPB1bA
- **Demo video of the app running on iOS** here:

  [![iOS Video](https://user-images.githubusercontent.com/3515359/106855775-57c89480-6672-11eb-99bc-fb3cd1c57d31.png)](https://youtu.be/lg9-k_fJ25k)

  https://youtu.be/lg9-k_fJ25k

- **iOS Screenshots**

  | 1 | 2 |
  |--|--|
  | ![](https://user-images.githubusercontent.com/3515359/106584014-90456280-64fa-11eb-9575-39be808cd39b.png) |![](https://user-images.githubusercontent.com/3515359/106584070-9dfae800-64fa-11eb-81bc-b7adc5f3ea37.png) 

  | 3 | 4 |
  |--|--|
  |![](https://user-images.githubusercontent.com/3515359/106584059-9afff780-64fa-11eb-86dc-5f28d83831c2.png)  | ![](https://user-images.githubusercontent.com/3515359/106584049-976c7080-64fa-11eb-9f5d-d91ef061fdb4.png) 

  | 5 | 6 |
  |--|--|
  | ![](https://user-images.githubusercontent.com/3515359/106584039-950a1680-64fa-11eb-9a61-95c5c7b81e61.png) | ![](https://user-images.githubusercontent.com/3515359/106583866-65f3a500-64fa-11eb-98b8-ddde1d5aee1e.png) 
  
  | 7 | 8 |
  |--|--|
  | ![](https://user-images.githubusercontent.com/3515359/106683196-eb1d9f00-6578-11eb-8a42-c7b387b6c3f8.png) | ![](https://user-images.githubusercontent.com/3515359/106683203-ed7ff900-6578-11eb-824b-38c808d2f0b2.png) |


#### Instructions to build and run the app locally:
1. Make sure you have `flutter` and `cocoapods` installed on your system. Try run `flutter doctor` to see what else you are missing to get going. See [Flutter macOS install](https://flutter.dev/docs/get-started/install/macos%20flutter%20doctor) for more.
2. Clone the above git repository on your local machine. 
3. Checkout the `main` branch on your local machine. 
4. Use an IDE to import the project. I used `Android Studio` to build the app. If you have that installed, open the weather project from `File` -> `Open`. Make sure to install `flutter` and `dart` plugins on your Android Studio. 
5. IDE should install the necessary SDK versions and platform tools as a part of the build. If not, you can download them from `Tools` -> `SDK Manager`.  
6. On the top bar, choose a device or simulator. Then click the `Run` button to run the app with `main.dart` file as entry point.
___

### Time spent
*How much time did you spend on the assignment? Normally, this is expressed in hours.*
I spent more than 19 hours on the Weather App project.

  - **Workflow**: I tried to simulate my workflow to how I'd do it for a production level app. You can look at my task distribution and workflow from the ['Projects' section on GitHub repository](https://github.com/shobhitpuri/thinkific-tryout/projects/1):
    <img width="1440" alt="project" src="https://user-images.githubusercontent.com/3515359/106884186-d08d1800-6695-11eb-9590-58fbd4215dba.png">
    1. To start with I did a **spike** to clarify requirements do some exploratory research on the things I'll need to complete the project.
    2. As a result of the spike, I **created individual tasks** after splitting the requirements into actionable items.
    3. For each task, I **created a separate git branch** to work branched out of `main`.
    4. Almost all the tasks required doing **exploratory research** to come up with the best way to do it before starting them. Examples include, the best architecture approach, the best way to refresh weather, the most maintainable and time saving way to implement Splash screen etc.
    5. After completing each task, I opened a **pull request** with attached comments, screenshots and `.gif` files showing a demo of the feature implemented in the pull request. This was to simulate real life situations, wherein it would help code reviewer review my changes. Also, helps me track what I did for a specific task. You can see the details of all my [closed pull requests here:](https://github.com/shobhitpuri/thinkific-tryout/pulls?q=is%3Apr+is%3Aclosed)

___ 

### Assumptions made
*Use this section to tell us about any assumptions that you made when creating your solution.*

-  **API level**: The minimum assumed Android OS level is 4.1 and above, which covers over 99.8% of the Android devices. For iOS, min level assumed is iOS 9, which covers more than 99% of the iOS devices.
- **Orientation**: Only portrait mode supported.
- **Devices**: Only tested on iPhone, iPad, Android Phones and tablets. Assumed that the support other apple or android devices like TV or Watches isn't supported for the tryout purpose.
- **IDE**: I used Android Studio to develop this app and assumed that the team working on the app would use the same IDE for consistent experience. However irrespecitive of that I configured the `.gitignore` file in a way that it doesn't matter if they use IntelliJ, Android Studio or VS Code for the development. It ignores the unneeded generated files from all of them.
- **Development Experience**: I assumed that I am working on a real life app to be released into production. This way I tried to mimic the process followed, including pull requests, branches, task management, release builds etc. Due to time constraint, I couldn't do all that I wanted, which I have documented in subsequent questions.
 ___

### Why did you choose the technology/framework you used?
Q:*What were your considerations behind the technology/framework chosen?*

- **App Development Framework:** I chose Flutter. One of the requiement was it to support both Android and iOS operating systems. Out of all the cross platform frameworks that have existed, flutter is most promising in my humble opinion. Comparing it to React Native, which is the next most popular one, it is faster, since there is no conversion layer. Flutter engine doesn’t need a bridge to communicate with the native components, whereas React Native does. It gives the React Native approach a poorer performance in comparison. Flutter is also actively supported by Google, and has an exponentially growing support community. Also, I love the flutter hot reload feature of Flutter. It saves so much time. Being developed native apps, this was truly the gem that was missing for a long time. 
___

### Stretch goals attempted
*If applicable, use this area to tell us what stretch goals you attempted. What went well? What do you wish you could have done better? If you didn't attempt any of the stretch goals, feel free to let us know why.*

I spent some time exploring the stretch goals. For example, the one that allows user to search for any location and see it's weather. I signed up for Google Places API key, and did some exploration. It'dhave definitely been a good addition. However due to time constraints, I couldn't include it in the project. 
I believe I was able to show my approach to problem solving by implementing the main required features, and managing the tasks and processes involved with it. It shows how I would approach architecting and development of production level app, if there weren't any time constraints. Hope that provides you with some confidence on what you are looking for in an ideal candidate.

___

### Shortcuts/Compromises made
*Q: If applicable. Did you do something that you feel could have been done better in a real-world application? Please let us know.*

There were many things that could have been included. I think this question, and the question below of '*What did you not include in your solution that you want us to know about?*', have similar answers. I've answered both these questions below.

### What did you not include in your solution that you want us to know about?
*Q: Were you short on time and not able to include something that you want us to know about? Please list it here so that we know that you considered it.*

There are a lot of things I tried or thought about but left out due to time constraints. Following are some of the things which I considered, and would definitely consider for a real world app.

**Features / Implementation Thoughts**
  - **Refresh weather logic options**: 
    - **Refresh onResume**: For refreshing the current location and the weather data, I wanted to refresh it when user resumes the app. Right now it's done either on app start or using pull to refresh gesture. The reason being that if the user is resuming the app even from the background, the intent is to see the current weather. So it makes sense to refresh it again. Although, this would mean using more resources including network and API call threshold etc. Pull-to-refresh is an extra step for the user, but atleast user has more control this way. 
     - **Don't show error widget**: If the refresh weather call doesn't return success, instead of showing error screen, there could be a use case to keep showing the previously fetched weather details. However, I'd add a timestamp or some other indicator that tells that the weather report is outdated, and also give the last fetched time for reference.
  - **Animation for pull-to-refresh user training**: On the first time opening of the app, I wanted to show a small overlay animation, showing the pull to refresh option. This lets the user know that such a feature exist, which otherwise might be hidden from them, unless they are a power user.
  - **Settings screen**: Allow user to view temperature, wind speed etc in different units. 
  - **Landscape orientation**: Right now the only support is for portrait mode. I wanted to add different layout for landscape.
  - **API key placement**: Right now the Open Weather API key is checked in source control. This is not safe. Best is to read them in from a config file that is read in when the app is being built either locally or on CI machine.
  - **Localization**: Support localization. Have strings in separate files to support it in future, rather than having constant strings all over the place.
  - **Consolidated styling parameters**: Having styling at one place to simplify future changes	
  - **AppBar colour** change based on weather conditions.
  - **Tests**: For now as a sample, I included few positive and negative unit test scenarios testing the `Bloc` classes in the project, after mocking the dependencies. The test suite should be more comprehensive for production apps.  Also having and running UI automation tests once a day at least would add to confidence level of production release. Either Firebase or Amazon device farms are well suited candidates.
  - **Home screen widget** : I'd consider reusing the weather wiget to allow users to put it on their Android / iOS home screens. Lots of users might prefer that information on their home screen, rather than opening the app everytime.
  - **Persistent notification**:  This could be another way, to not force user to open the app to see latest weather but consumes resources. We can listen to location changes in background and update this notification accordingly. This can be an optional featue for the user, enabled from Settings. 
  - **Search Location Suggestions**: Like the extended task talked about, it'd be good to have a search bar where user could search any location. I wanted to integrate search bar with Google Places API to get the location suggestions. Then based on user selection, use the latitude and longitude to query the weather API. I had crated the Google Places API key to try this out. However due to time contraint couldn't include it in the project.
  - **Favorite Location**: I thought about the choice of persistance layer to use for this feature. Also, wanted to include a ⭐ button on the widget to favorite it. I was debating with myself whether it'd be better to show the favorite locations as horizontal scrollview at the bottom of home page, or have it as a separate page linked from the navigation drawer. I like the prior approach better. However I couldn't include it as a part of the project.


**Tools, Processes and Other intricacies**
  - **Google Play Store Alpha app release**: I set up the app on Google Play console, and made an alpha release. It allows adding internal testers using email, and they can directly install from the play store. The play store listing is not public and only available to invited testers. The app is still in review. The intention was to use play store for sharing the link and inviting you to check the `apk`.   [Here is a link that invited testers can use to get access to the Alpha distribution of app](https://play.google.com/apps/internaltest/4700635866713086531). 
  - **GitHub**
    - **CI/CD**: Wanted to integrate using GitHub Actions. I have some unit tests in the implementation and wanted to run them on each pull request. 
    - **Protect branches**: I'd also wanted to protect the `main` branch, to prevent direct pushes to it. Only pull requests should be allowed for safety purposes. Also, in real world application, I'd add another protected `dev` branch or something, where all the features for next release would go. `main` is the stable, production ready branch. 
 - **Firebase Crash Report**: Wanted to add Firebase crash reporting and analytics. That might be more suitable for production.

___

### Other information about your submission that you feel it's important that we know if applicable.
**Asset under creative common license**: Most of the assets being used in the app are from unsplash.com. They are allowed to be used freely under creative common license (CCL). Icon is from somewhere else but still under CCL.

**Decision Explanations**: I'd like to take this opportunity to go through reasons of using some frameworks, packages and approaches that I used within the project below:

  - **Flutter Dependencies** : Although some of the ones mentioned are explanined fine by the one line comments, I'd like to highlight a few:
  
    ![](https://user-images.githubusercontent.com/3515359/106869884-4c329900-6685-11eb-97ca-f2daf65ddab9.png)
    - [weather](https://pub.dev/packages/weather): This package uses the `OpenWeatherMAP` API to get the current weather status as well as weather forecasts. I used this instead to reduce the boilerplate code, instead of setting up the `http` package and doing the REST call myself. This looks stable seeing their GitHub, and from verified developer. I still wanted the code to not explicitely used their model, since it'll bread things if we decide to change the weather API or we start using another package. So, to decouple it, you'll  find an `abstract` class called `WeatherInfo` with generic details that we'd need from any API. All the Open Weather API specific fields are in`OpenWeatherInfo` model, which extends the abstract class. You'll also see from code that I used a `WeatherRepository` and an `interface`  `WeatherAPIClient`. `OpenWeatherMapApiClient` implements this interface. That way we can have multiple API clients adhering to same `interface` in future. **All this so that, when/if we need to change or add another weather API, the existing code need not change a lot. So although this package was used to reduce API call boilerplate, the code takes care simplifying the error in case of future changes.**

    -  [flutter_bloc](https://pub.dev/packages/flutter_bloc): Clean architecture has been a talk of the town for a long time in mobile app developer community. There are many architectural patterns which would support write a clean code. They provide separation of concerns, isolating business logic, UI, and data layer, thereby also simplifying testability. The two popular ones include MVVM (Model-View-ViewModel) and BLoC (Business Logic Components). Although both are good, I decided to go with used `BLoC`. In my opinion, BLoC does the separation of concerns better than MVVM. With BLoC every communication in the app is stream of events. When widgets submit events, others respond and BLoC sits in the middle, managing the conversation. Whereas in MVVM, there is databindings between the view and the viewmodel, that's how they communicate. If some implementation changes in the view, one would need to do some changes in the view model as well. This is an overhead. In BLoC, it's just stream of events, so changing view implementation doesn't change much if same events are being used. I used this package, since it makes it easier to implement the BLoC design pattern.
    - [cahced_network_image](https://pub.dev/packages/cached_network_image): It is important to cache the images, since they are usually the heavier components. This package provide out of the box solution for it.
    - [mockito](https://pub.dev/packages/mockito/): Used that to mock the repository and other dependencies for unit tests.
    - [flutter_native_splash](https://pub.dev/packages/flutter_native_splash):  The Flutter engine takes some time to load, and the app takes some time to initialize. The app was showing blank page for that duration. So to make seamless experience, I added splash screen to both Android and iOS natively. Instead of doing that manually, this package helped me automate that, and save a lot of time.
    
  - **Skeleton**: I used the below way to setup the project. There are many schools of thought on how to setup the skeleton. I prefer to keep the structure in a way, wherein all the classes related to a feature can be find at the same place. It is easier for a new developer to debug, and understand what's going on. That makes it easier to do any bug fixes.

  ![](https://user-images.githubusercontent.com/3515359/106870244-bc411f00-6685-11eb-9d98-457857fd29bb.png) 
  
  - **webP**: Instead of using `png` or `jpg` files, which were large, I convereted most of the background images to `webP`. This reduced the load time and image size by multiple factors.

___

### Your feedback on this technical challenge
Q: *Have feedback for how we could make this assignment better? Please let us know.*

I have one small feedback. It'd be good if you allow future developers to use any mobile app development technology for the tryout. I understand if the company has decided to go the hybrid approach. However, the task restricts to using cross-platform solutions. In my humble opinion, the skills set is transferable. It is the approach that matters. Hybrid approach works great for some apps, whereas for apps which need a lot of system level interaction, native might work better. Although, I'd say Flutter is evolving fast. We live in exciting times!
