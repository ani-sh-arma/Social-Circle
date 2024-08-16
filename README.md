# Social Circle

### API : [JSONPlaceholder](https://jsonplaceholder.typicode.com/)

### Deadline : 17th August 2024, Saturday, 8:30 PM

## Work Assignment : Social Media App using JSONPlaceholder API

#### *Objective:*
Build a simple social media app that fetches and displays data from the JSONPlaceholder API. The assignment is designed to help you learn and practice API fetching and posting, working with a singleton class, using GetX for state management, JSON parsing, async/await, Dio for HTTP requests, and exception handling.

#### *Requirements:*

1. *API Data Fetching:*
   - Fetch posts, comments, and user data from JSONPlaceholder.
   - Use Dio for making HTTP requests.
   - Handle responses, errors, and exceptions properly.

2. *Singleton Class:*
   - Create a singleton class to store and manage fetched data.
   - The singleton class should be responsible for holding and providing access to the data across different screens.

3. *UI Implementation:*
   - Display the fetched data using GetX for state management.
   - Design the following screens:
     1. *Home Screen:* Display a list of posts.
     2. *Post Details Screen:* Display details of a post, including comments.
     3. *User Profile Screen:* Display user details for the post's author.
   - Ensure that data is fetched from the singleton class, not passed from the previous screen.

4. *Error Handling:*
   - Implement exception handling for network errors, timeouts, and invalid responses.
   - Show appropriate error messages to the user when something goes wrong.

5. *Data Posting:*
   - Implement functionality to create a new post using the API.
   - Handle the response and update the UI accordingly.

6. *Asynchronous Programming:*
   - Use async/await for handling asynchronous operations.
   - Implement proper loading states while data is being fetched.

7. *JSON Parsing:*
   - Parse JSON responses into Dart models.
   - Use strong typing by defining model classes for posts, comments, and users.

#### *File Structure:*
```
plaintext
lib/
│
├── models/
│   ├── post_model.dart        // Model class for Post
│   ├── comment_model.dart     // Model class for Comment
│   ├── user_model.dart        // Model class for User
│   └── app_data.dart          // Singleton class to manage data
│
├── api/
│   └── api_service.dart       // Class for handling API calls (GET, POST, etc.)
│
├── screens/
│   ├── home_screen.dart       // Screen to display list of posts
│   ├── post_details_screen.dart // Screen to display post details and comments
│   └── user_profile_screen.dart // Screen to display user profile
│
├── exceptions/
│   └── app_exceptions.dart    // Custom exceptions for handling API errors
│
└── main.dart                  // Entry point of the application
```

#### *Guidelines:*

1. *Step 1: Set Up Models*
   - Define model classes (PostModel, CommentModel, UserModel) based on the JSON structure returned by the API.
   - Create a singleton class AppData to store and manage these models.

2. *Step 2: API Service Implementation*
   - Use Dio to implement API requests (GET, POST) inside ApiService.
   - Fetch posts, comments, and user data from the JSONPlaceholder API.
   - Handle and throw custom exceptions for different error scenarios.

3. *Step 3: Create Screens*
   - Design the HomeScreen to display a list of posts. Use GetX to manage the state.
   - Implement navigation to PostDetailsScreen when a post is clicked, and fetch post details and comments from the singleton class.
   - From PostDetailsScreen, navigate to UserProfileScreen and fetch user details using the singleton class.

4. *Step 4: Implement Data Posting*
   - Add a feature to create new posts from the HomeScreen.
   - Use Dio to send POST requests and update the UI when a post is successfully created.

5. *Step 5: Error Handling*
   - Create a custom exception class AppExceptions in the exceptions folder.
   - Handle different types of exceptions (e.g., network errors, invalid data) in the API service.
   - Display appropriate error messages to the user in the UI.

6. *Step 6: Final Testing*
   - Ensure that all screens correctly fetch and display data using the singleton class.
   - Test navigation and ensure data is not passed directly between screens.
   - Handle all edge cases for error handling and data loading.

#### *Deliverables:*

1. The complete Flutter project with the file structure as outlined above.
2. A demo showcasing how the app fetches, displays, and posts data.
3. Code documentation explaining how each part of the app works.
4. A brief report on any challenges faced during development and how they were overcome.

This assignment will give you a comprehensive understanding of how to build a complete Flutter application with API integration, state management, and proper architectural practices.