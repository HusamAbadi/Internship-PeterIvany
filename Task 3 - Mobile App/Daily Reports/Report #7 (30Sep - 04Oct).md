
# Day 37 (30th September):
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

# Day 38 (1st October):
    Tasks: 
        1- Implementing Anonymous Sign-In Functionality:
            A new sign-in widget is created as a separate Dart file and incorporated into the app to allow anonymous login. This widget accesses the AuthService class to perform authentication and prints relevant messages to the console based on the outcome. Future improvements will include creating a custom user object to simplify the data structure.

        2- Implementing a Custom User Model in a Flutter Application for Firebase Authentication
            I focused on refining how the application handles user data after a successful sign-in. Specifically, I converted the Firebase user object returned during authentication into a custom user model that simplifies data management. This custom user model allows us to store only the necessary properties required for the app, reducing complexity and making the user object lighter.

        3- Implementing Real-Time Authentication Change Handler
            I also focused on implementing a real-time authentication change listener in our Flutter application. The goal was to enable dynamic UI updates based on whether the user is signed in or not. This was achieved using Firebase’s authentication stream, allowing the app to respond to sign-in and sign-out events in real-time.
