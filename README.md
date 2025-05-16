
Flutter Test Task – Pixelfield Submission

Hi Veronika and Pixelfield Team,

Thank you for assigning this test task. Below is a summary of what I’ve done and how it matches the requirements provided.

---

Task Coverage

- The app is built using the latest stable version of Flutter 3.29.3 and uses null safety throughout.
- Bottle data is loaded from a local mock JSON file located in the assets folder (`mock_bottles.json`). Although the data is local, a connectivity check has been implemented using the `connectivity_plus` package to simulate the requirement that the data should only load when internet is available.
- The app uses the BLoC pattern for state management. Events and states are separated clearly and handled cleanly inside a single BLoC file. This also allows the app to support future enhancements like offline filtering or replacing the data source with an API.
- Git version control was used throughout the development process with regular commits and a clean history.
- The app implements the two core screens: My Collection (a grid of bottle cards) and the Bottle Detail screen, which includes tabbed sections for details, tasting notes, and history.
- Animations have been added to improve UI experience, including Hero transitions for images, fade-in animations for content, and scale animation on buttons.
- The folder structure was adjusted slightly for clarity, following a feature-first layout with separate folders for `auth`, `collection`, `logic`, `model`, and `ui`.

---

Time Tracking

The task was completed in under 2 hours. Here's a rough breakdown:

- Initial setup and routing: 15 minutes  
- Mock data loading and BLoC setup: 10 minutes  
- UI development for both screens: 1 hour  
- Animations and polishing: 15 minutes  
- Final testing and cleanup: 10 minutes  

---

Packages Used

- flutter_bloc: For managing state using the BLoC pattern.
- go_router: For routing between splash, welcome, sign-in, collection, and detail screens.
- google_fonts: To apply Playfair Display typography.
- connectivity_plus: To simulate internet check before loading the local JSON.
- path_provider: Used internally by Google Fonts to cache fonts on device.

---

Notes

- The app avoids overengineering. It is scalable and modular while keeping the implementation focused on the task.
- Animations were added selectively to enhance user experience but kept minimal and clean.
- Although the data is local, the architecture makes it very easy to switch to an API-based backend in the future.

If you have any questions or need me to walk you through any part of the code, I’ll be happy to help.

