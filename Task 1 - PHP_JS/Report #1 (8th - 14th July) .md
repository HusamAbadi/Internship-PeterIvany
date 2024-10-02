Daily Report of Tasks

# Day #1 (July 8th):

- Meeting and Internship Offer:
  - Met with Professor Peter Ivany and secured an internship.
  - The internship involves two tasks:
    - 1- A small PHP and JavaScript task to implement drag-and-drop functionality on a multi-row, multi-column grid template.
    - 2- A long-term learning project focused on topology optimization using MATLAB and CUDA, guided by the book "Programming Massively Parallel Processors."

# Days #2-3 (July 9th-10th):

- Starting the First Task:

  - Began working on the PHP and JavaScript task without prior knowledge of PHP.

  - Learning Phase:

    - Watched a tutorial on creating a simple to-do list with CRUD operations using PHP and MySQL.
    - Learned to access the local database using PhpMyAdmin and the "XAMPP Control Panel" to start Apache and MySQL services.
    - Understood how to make POST and GET request methods to and from the local database.

  - Project Setup:

    - Created a new project as a mockup for the required drag-and-drop functionality.
    - Faced challenges due to the lack of source code or references for the original website where the functionality needs to be applied.

  - Implementation Approach:

    - Developed a drag-and-drop functionality allowing smooth shifting of elements.
    - Ensured the list order is saved and persists after changes.

    - Technical Details:
      - Used a new table attribute called "tag_order" to maintain the current number of rows, incrementing by 1 for each new element.
      - Triggered an update function on the "drop" event.
      - Sent the updated list of items as a JSON object with the current order in a POST request to update the "tag_order" attribute in the tags table.

# Day #4 (July 11th):

-Bug Fixes and Code Optimization:

  -Fixed event listener-related bugs and issues.
  -Removed unused code blocks.
  -Simplified the code for better readability and maintenance.

# Day #5 (July 12th - Friday):

-Break Day:
  -Did not work on the project.

# Day #6 (July 13th):

-Layout and Styling Improvements:

  -Changed the layout template for storing tags from a grid to a flexbox.
  -Made it easier to shift tag blocks.
  -Adjusted tag cells to have appropriate widths based on text length, instead of having uniform widths.

# Day #7 (July 14th):

-Final Adjustments and Enhancements:

  -Ensured tag names are unique and case-sensitive using an SQL command to check for existing tags with the same name before adding a new one.
  -Separated the CSS stylesheet from the HTML file for better organization.
  -Implemented functionality to allow the dragged cell to be dropped on either side of the target cell, depending on which half of the cell is dropped on.

-CUDA:
  -Started Learning the basic concepts of Parallel-Data Processing and CUDA C Programming Language From the book "Programming Massively Parallel Processors" and throughout Youtube.

