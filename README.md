# Mova ( **Not Completed Yet** )
movie app demonstrates how the clean architecture and BLoC pattern can be used to build a robust and scalable mobile application that can handle multiple APIs with different endpoints. It showcases how the separation of concerns, reactive programming, and modularization can simplify complex development tasks and make code easier to maintain and extend.

## Features ✨
There is 3 section here with 3 different colors :
- 🟩 Implemented Features:

  - Now Playing :  Provides users with real-time information about currently playing movies(90%)
  - Top Rated : Displays a curated list of the highest-rated movies based on user ratings, critics' reviews, and popular demand(100%)
  - Upcoming : Showcases a list of upcoming movie releases, allowing users to stay updated on the latest releases, release dates, and movie details.(100%)
  - Details : Provides comprehensive details about a specific movie based on its unique ID. Users can access information such as genres, runtime, cast and crew, ratings, and reviews for a particular movie. (100%)

- 🟥 Features in Progress:

  - cast: Allows users to view information about the cast and crew of movies.(5%)

- ⬛ Known Features:

<br/>
<img width="" src="https://github.com/moha-b/Mova/assets/73842931/586f0c68-ea81-44e6-96a1-3900b5570bc9" />

<br/>


## Techniques used 🛠️    

<img width="300" align="right" src="https://github.com/moha-b/Mova/assets/73842931/9bcd7c9b-80a3-4933-b8e1-99ead186663b" alt="preview" />
 
- Minimum SDK level 21
- Architecture
  - Clean Architecture (Presentation layer - Data layer - Domain layer)
  - Repository pattern
  - Singleton pattern
- [Bloc](https://bloclibrary.dev/#/) - used for state management, implements the BLoC for managing app logic and state.
- [Equatable](https://pub.dev/packages/equatable) - used for comparing objects in Dart/Flutter by overriding the hashCode method to check for equality.
- [Get It](https://pub.dev/packages/get_it) - handles dependency injection/management.
- [Dartz](https://pub.dev/packages/dartz) - used for functional programming in Dart, provides tools for working with immutable data, performing side-effects, and handling errors using Either and Option types.
- [Dio](https://pub.dev/packages/dio) - used for making HTTP requests.
- [Flutter Screen Util](https://pub.dev/packages/flutter_screenutil) - used for responsive design in Flutter apps, provides a simple way to scale UI elements and layouts based on the device's screen size and pixel density using a set of utility functions and classes.
- [Cached Network Image](https://pub.dev/packages/cached_network_image) - user for automatically caches and displays images from a URL.
- [google_fonts](https://pub.dev/packages/google_fonts) - provides a set of free and open-source fonts from the Google Fonts library.
- [carousel_slider](https://pub.dev/packages/carousel_slider) - simple customizable widget for displaying a sequence of images.
- [Shimmer](https://pub.dev/packages/shimmer) - used for creating loading or placeholder animations.

