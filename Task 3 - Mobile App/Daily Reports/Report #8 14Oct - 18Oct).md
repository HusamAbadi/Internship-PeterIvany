# Days 46-48 (14th - 16th October):
Tasks Completed:
    Worked on Sessions Management in Conference App:

        -Implemented a FutureBuilder to fetch data asynchronously instead of using StreamBuilder for the sessions data.
        -Added a method to the DatabaseService class to retrieve session data using a Future<List<Session>> from Firestore.
        -Updated the SessionsScreen to work with FutureProvider instead of StreamProvider to handle one-time fetching of sessions.
        -Adjusted the SessionsList widget to handle null and empty values when waiting for the Future to resolve.

    Implemented Day Tile with Incremental Value:
        -Updated the DaysList and DayTile components to dynamically increment and display the day number for each tile.
        -Passed the incrementing value from the parent ListView.builder in the DaysList widget by calculating index + 1 to display the correct day number on each DayTile.
        -Tested the solution by ensuring correct ordering and display of dynamic day values in the app interface.

    Understanding of Firestore Data Mappings:
        -Explored the use of DocumentSnapshot and QuerySnapshot in Firestore to map data from Firestore to Dart models (e.g., converting Firestore Timestamp to DateTime).
        -Applied this knowledge to build efficient and responsive data-driven components in Flutter, improving the overall performance of the application.

# Days 49-50 (17th - 18th Octoper):
    Objectives:
        -Enhance the PapersScreen widget to allow for flexible instantiation with different parameters.
        -Implement multiple constructor methods to access the PapersScreen from various parts of the application.

    Tasks Completed:
        -Analyzed Current PapersScreen Implementation:
            --Reviewed the existing implementation of the PapersScreen widget to understand its data flow and dependencies on the Session and Conference models.

        -Implemented Named Constructors:
            --Introduced multiple constructors in the PapersScreen class:
                ---Default Constructor: Accepts session, conference, and papers as optional parameters.
                ---Named Constructor (fromSession): Allows initialization using a Session and a Conference object. This constructor fetches papers based on the provided session.
                ---Named Constructor (fromPapers): Initializes the screen using a direct list of Paper objects. This approach avoids fetching data again when it is already available.

        -Updated Data Fetching Logic:
            -Modified the FutureProvider to handle two scenarios:
                --Directly returning the provided papers when using fromPapers.
                --Fetching papers from the database using the session when using fromSession.
        
        -UI Adjustments:
            --Ensured the title in the AppBar uses the conference name if available.
            --Updated the body text to reflect the title of the session or a default message when the session is not provided.

        -Testing and Validation:
            --Conducted testing to validate that both constructors work as expected.
            --Ensured proper loading indicators and messages display when data is being fetched or if no papers are available.