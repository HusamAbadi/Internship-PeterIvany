
# Day 37 (30th September)

    I completed the firebase setup and now it's ready to be used.
    I brainstormed the structure of the program in which I know how to devide each portion of it. and it goes as follows:
        The app is structured with a root widget MyApp, which has a Wrapper widget beneath it. The Wrapper listens for user authentication changes. Based on the authentication status, it dynamically displays either a home screen (for logged-in users) or an authentication screen (for logged-out users). The home screen lists user data and preferences, while the authentication screen allows switching between sign-in and registration widgets. The Wrapper serves as the central point for managing which screen to display.

    Task: Structuring the Flutter Application with Dynamic Authentication Handling:
        Today, I focused on defining the architecture and structure of the Flutter application to handle user authentication dynamically. The application was set up to show different screens based on the user's authentication status, ensuring a seamless user experience. 

    Work Done:
    Root Widget and Wrapper Implementation.
    Dynamic Screen Display Based on Authentication Status
    Implemented conditional rendering of screens:
        If the user is logged in, the app displays the HomeScreen widget.
        If the user is logged out, the app shows the Authenticate widget.

# Day 38 (1st October)

    Tasks: 
        1- Implementing Anonymous Sign-In Functionality:
            A new sign-in widget is created as a separate Dart file and incorporated into the app to allow anonymous login. This widget accesses the AuthService class to perform authentication and prints relevant messages to the console based on the outcome. Future improvements will include creating a custom user object to simplify the data structure.

        2- Implementing a Custom User Model in a Flutter Application for Firebase Authentication:
            I focused on refining how the application handles user data after a successful sign-in. Specifically, I converted the Firebase user object returned during authentication into a custom user model that simplifies data management. This custom user model allows us to store only the necessary properties required for the app, reducing complexity and making the user object lighter.

        3- Implementing Real-Time Authentication Change Handler
            I also focused on implementing a real-time authentication change listener in our Flutter application. The goal was to enable dynamic UI updates based on whether the user is signed in or not. This was achieved using Firebase’s authentication stream, allowing the app to respond to sign-in and sign-out events in real-time.

        4- Creating rout files for the main three routs: Conferences, Authors and Keywords.

# Day 39 (2nd October)

Tasks Accomplished:

  1-State Management with Provider:
    --Integrated Provider for managing user authentication state, ensuring seamless UI updates when the user logs in or out.

  2-Firebase Email/Password Authentication:
    --Implemented email and password-based registration and sign-in forms, replacing the initial anonymous sign-in approach.
    --Added validation for form fields to ensure proper inputs before sending requests to Firebase.

  3-Validation and Error Handling:
    --Utilized Flutter’s form validation features to display error messages for incorrect inputs, such as invalid email formats or passwords shorter than six characters.

  4-Firebase Registration:
    --Created a registerWithEmailAndPassword method in AuthService to handle user registration via Firebase.
    --Integrated Firebase’s createUserWithEmailAndPassword method to register new users and automatically update the authentication state.

  5-User Feedback:
    --Implemented dynamic error messages for failed registration attempts, providing clear feedback to users.

# Day 40 (3rd October)

Tasks Accomplished:

  1- Implementing sign-in functionality:
       allowing users to log in using their registered email and password. This completes the core authentication flow of the app, paving the way for data integration and UI enhancements.

  2- Text Input Decoration:
    By changing the background color, giving the textFormField widget a border and adding a hint text to each text field.

  3- Creating A Loading Widget using Flutter SpinKit Package.

  4- Setting up Firestore Database:
    I created a new file named 'database' in the services folder which will be used to create and manage our collections and each record in each collection.

  5- Implementing Firestore User Records for New Users
    I started on integrating Firestore into the Flutter application to store user-specific data. I created a function that automatically generates a new document in the Firestore collection for each new user upon registration. The goal was to ensure that each user has a dedicated document in the conferences collection, which can later be updated based on their preferences.
    
# Day 41 (4th October)

  Task: Setting up Firestore Stream to Display User Data:
    Today, I focused on setting up a Firestore stream in the Flutter application to monitor changes in the conferences collection and dynamically display user data on the home screen.

  Steps Taken:

    -Cleaning Up Existing Data:
      --Deleted all previously created user records from Firebase Authentication, keeping only the latest registered user for testing.

    -Setting Up Firestore Stream:
      --Implemented a Firestore stream in the DatabaseService class to listen for changes in the conferences collection.
      --Configured the stream to notify the app whenever there are changes, such as new documents added or updates to existing ones.
      --Used the .snapshots() method to create a stream of snapshots that reflect the current state of the collection.

    -Integrating Firestore Stream with Provider:
      --Wrapped the home screen widget in a StreamProvider to listen to the conferences collection stream.
      --Linked the stream to the StreamProvider in the home screen, making the Firestore data accessible to descendant widgets.

    -Creating the conference List Widget:
      --Developed a conferenceList widget to display data retrieved from Firestore.
      --Implemented logic to cycle through the documents in the conferences collection and print their data to the console for verification.
      --Verified that each user’s document data is displayed correctly based on the current state of the Firestore collection.

    -Testing and Troubleshooting:
      --Debugged issues related to null values and missing documents to ensure smooth data retrieval and display.

  Outcome: 
    Successfully set up a Firestore stream to monitor real-time changes in the conferences collection. The stream updates the app dynamically, allowing for accurate display of user-specific data. This foundation will be used to further enhance the UI by mapping Firestore snapshots to custom objects in future iterations.