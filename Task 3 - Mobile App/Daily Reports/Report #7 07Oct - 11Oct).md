#### Week #7
# Day 42 (7th October):

    Task: Setting Up Firestore Stream for Real-Time Data Updates

    Description: Today, I worked on integrating Firestore streams into the Flutter application to enable real-time data updates for the conferences collection. This functionality ensures that whenever a new document is added or an existing document is modified, the app can dynamically reflect these changes in the UI.

    Steps Taken:
        Data Cleanup:
        --Removed existing user records from Firebase Authentication, retaining only one user to ensure a clean slate for testing.

        Setting Up Firestore Stream:
        --Implemented a stream in the DatabaseService class that listens for changes in the conferences collection.
        --Configured the .snapshots() method to return a QuerySnapshot whenever the data in Firestore changes enabling real-time updates.

    Integrating Firestore Stream with Provider:
        --Wrapped the home screen in a StreamProvider to listen to the Firestore stream and provide data to descendant widgets.
        --Linked the Firestore stream to the home screen’s StreamProvider, making data accessible throughout the widget tree.

    Creating the Conference List Widget:
        --Developed a ConferenceList widget that cycles through and displays each document from the conferences collection.
        --Printed out the document data in the console for verification, ensuring that the stream returns the expected values.
    
    Testing and Debugging:
        --Registered a new user and verified that a corresponding document is created and updated dynamically in Firestore.
        --Debugged issues related to null values and missing document fields to ensure smooth data retrieval and display.

# Day 43 (8th October): 
    
    Task: Creating and Integrating Conference Model for Firestore Data

    Description: Today, I focused on refining how Firestore data is handled in the Flutter application. The goal was to convert Firestore query snapshots into a list of Conference objects, making it easier to manage and display data in the UI. This process involved creating a Conference model class and mapping Firestore snapshots to this custom model.

    Steps Taken:

        -Creating the Conference Model Class.
        -Mapping Firestore Query Snapshots to Conference Objects.
        -Updating the Firestore Stream.
        -Refactoring Conference List Widget.

# Day 44 (9th October): 