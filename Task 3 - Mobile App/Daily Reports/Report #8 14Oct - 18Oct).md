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

# Day 49 (Octoper 17th):
