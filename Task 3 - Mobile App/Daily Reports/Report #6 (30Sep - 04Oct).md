
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

        2- Implementing a Custom User Model in a Flutter Application for Firebase Authentication:
            I focused on refining how the application handles user data after a successful sign-in. Specifically, I converted the Firebase user object returned during authentication into a custom user model that simplifies data management. This custom user model allows us to store only the necessary properties required for the app, reducing complexity and making the user object lighter.

        3- Implementing Real-Time Authentication Change Handler
            I also focused on implementing a real-time authentication change listener in our Flutter application. The goal was to enable dynamic UI updates based on whether the user is signed in or not. This was achieved using Firebase’s authentication stream, allowing the app to respond to sign-in and sign-out events in real-time.

        4- Creating rout files for the main three routs: Conferences, Authors and Keywords.

# Day 39 (2nd October):
Tasks Accomplished:
  1. Implementing Authentication State Management with Provider
    -Integrated the Provider package into the Flutter application to manage user authentication state.
    -Used Provider to effectively propagate state changes across the widget tree, dynamically displaying either the authentication screen or the home screen based on the user's login status.
    -Leveraged StreamProvider to listen for authentication state changes and update the UI accordingly, offering a reactive experience.
  
  2. Implementing Sign-In and Sign-Out Functionality Using Provider
    -Integrated sign-in and sign-out functionality into the app using the Provider package.
    -Modified the existing AuthService class to handle authentication logic, such as signing in and signing out.
    -Utilized StreamProvider to manage user state across different screens, ensuring the UI reflects the user's authentication status in real-time.

  3. Enhancing the User Authentication Flow with Firebase Integration
    -Sign-In Form Implementation:
      --Refactored the existing sign-in page, replacing the anonymous login functionality with an email and password-based authentication form.
      --Created a new sign-in form using TextFormField widgets to capture user credentials.
      --Added a sign-in button with custom styling and an onPressed function that captures form data for interaction with Firebase.

    -Registration Form Implementation:
      --Developed a registration form similar to the sign-in form, allowing new users to create accounts.
      --Implemented necessary form validation and error handling to ensure a smooth registration process.

    --Navigation and Toggle Functionality:
      --Set up a navigation mechanism to toggle between the sign-in and registration forms for a streamlined user experience.
      --Introduced a new toggleView function to switch between the sign-in and registration screens based on a Boolean state.
      --Passed the toggleView function as a prop to child components to facilitate interaction between different screens.

    
  4. UI/UX Enhancements for Authentication Module
      -Restructured the sign-in and registration forms, ensuring consistent styling and layout across both screens.
      -Integrated state management to track user input and perform validation dynamically.
      -Added a navigation button in the app bar that allows users to easily switch between the sign-in and registration screens.
      -Tested the entire flow to confirm the navigation buttons worked as expected, enabling smooth transitions between the two forms.
    
    Summary
      -Overall, today’s work focused on integrating the Provider package for state management, implementing core sign-in and sign-out functionalities, and enhancing the user authentication flow by creating and linking sign-in and registration forms. The new structure is ready for further Firebase integration, paving the way for a more robust and feature-rich authentication system.
# Day 40 (3rd October):



# Day 41 (4th October):