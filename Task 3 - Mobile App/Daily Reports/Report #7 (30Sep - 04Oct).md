
# Day 37 (30th September):
    I completed the firebase setup and now it's ready to be used.
    I brainstormed the structure of the program in which I know how to devide each portion of it. and it goes as follows:
        The app is structured with a root widget MyApp, which has a Wrapper widget beneath it. The Wrapper listens for user authentication changes. Based on the authentication status, it dynamically displays either a home screen (for logged-in users) or an authentication screen (for logged-out users). The home screen lists user data and preferences, while the authentication screen allows switching between sign-in and registration widgets. The Wrapper serves as the central point for managing which screen to display.

    Task: Structuring the Flutter Application with Dynamic Authentication Handling

    Description:

    Today, I focused on defining the architecture and structure of the Flutter application to handle user authentication dynamically. The application was set up to show different screens based on the user's authentication status, ensuring a seamless user experience.

    Work Done:
    Root Widget and Wrapper Implementation:

    Set up the root widget MyApp as the entry point of the application.
    Integrated a Wrapper widget below the root widget to manage authentication changes and dynamically display the appropriate screens.
    Dynamic Screen Display Based on Authentication Status:

    Configured the Wrapper widget to listen for changes in user authentication status.
    Implemented conditional rendering of screens:
    If the user is logged in, the app displays the HomeScreen widget.
    If the user is logged out, the app shows the Authenticate widget.
    Home Screen Setup:

    Designed the HomeScreen to include a BrewList widget for displaying user-specific data (e.g., hot drink preferences).
    Added a SettingsPanel widget within the HomeScreen to allow users to update their coffee preferences using a SettingsForm widget.
    Authentication Screen Setup:

    Structured the Authenticate widget to contain either a SignIn or Register widget, allowing users to switch between the two screens based on their needs.
    Outcome: Successfully established the architecture for the app to handle user authentication dynamically. The Wrapper widget now serves as the central controller for managing screen displays based on whether a user is logged in or out.

# Day 38 (1st October):
    Task: Implemented Anonymous Sign-In Functionality for Flutter Application:

        A new sign-in widget is created as a separate Dart file and incorporated into the app to allow anonymous login. This widget accesses the AuthService class to perform authentication and prints relevant messages to the console based on the outcome. Future improvements will include creating a custom user object to simplify the data structure.


    Work Done:
        Created a New SignIn Widget:
            Developed a new stateful widget named SignIn under the screens/authenticate directory.
            Set up the widget to return a Scaffold with a basic UI layout, including an app bar and a button for the sign-in action.
        
        UI Design and Configuration:
            Customized the Scaffold with background colors and an app bar to enhance the user interface.
            Added padding and structural elements to improve the layout's visual organization.
        
        Anonymous Sign-In Implementation:
            Configured the sign-in button’s onPressed function to invoke the signInAnonymously method from the AuthService class.
            Implemented asynchronous handling to wait for the sign-in process to complete and determine its success.
        
        Logging and Error Handling:
            Used print statements to log the sign-in result. If the login is successful, the user’s UID is printed; otherwise, an error message is displayed.

    Outcome: 
        Successfully implemented the anonymous sign-in functionality and confirmed it works as expected by printing the result to the console. Moving forward, I will work on refining the data structure by using a custom user model.