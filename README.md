# CleanArchitecture Flutter GitHub Repo
This project demonstrates a Flutter application built using Clean Architecture principles to fetch, store, and display data from the GitHub API. It utilizes the Bloc package for state management and sqflite for local database storage.

## Key Features
- Fetches trending GitHub repositories based on a dynamic date query.
- Stores fetched data in a local database using sqflite.
- Displays repository information in a ListView.
- Implements pull-down refresh to update data with the latest trends.
- Handles API calls and data refresh in a background isolate for performance.
- Notifies the user upon successful data refresh.

## Project Structure
The project follows a Clean Architecture structure with separation of concerns:

- src: Contains all application source code.
- config: Holds configuration files like routers and error handling.
- core: Houses core functionalities like network, error handling, and utilities.
    - api: Handles API interactions and network calls.
    - error: Defines error types and exceptions.
    - useCases: Business logic layer with use cases for data manipulation.
    - utils: Utility functions used across the application.
- features: Feature-specific code for specific functionalities.
    - home: Code related to the main home screen.
- data: Data layer components for repositories and data sources.
    - data_sources: Implementation details for data access.
    - repository: Repository interface and implementation for accessing data.
- domain: Domain layer with models and use cases.
    - model: Data model definitions for repositories.
    - use_cases: Use cases for fetching and storing data.
    - repository: Interface for data access logic.
- presentation: User interface components.
    - manager: Bloc class for managing application state.
    - pages: UI pages like the main screen.
    - widgets: Reusable UI components.
- shared: Shared resources across the application.
main.dart: Application entry point.

## Dependencies
bloc
sqflite
json_serializable
http (or dio)
Note: External packages are avoided for background threads, utilizing Dart isolates for native threading.

- Running the application
- Clone the repository.
- Install dependencies using flutter pub get.
- Configure your desired API key for GitHub API access (optional for demo).
- Run the application using flutter run.

This will launch the application, allowing you to view trending GitHub repositories. Pull down to refresh the data and receive notifications upon successful refresh.
