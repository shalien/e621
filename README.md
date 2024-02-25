A client library for the API of imageboards using the e621 fork of gelbooru.

## Features

- Implements all the endpoints of the e621 API : [e621 API](https://e621.net/help/show/api)
- Use Dart's native `http` package for making requests.

## Getting started

Add the package to your project by running the following command:

```bash
dart pub add e621
```

## Usage 


```dart
Future<void> main() async {
  
  final Uri url = Uri.parse('https://e621.net/');
  final String username = 'username';
  final String apiKey = 'api_key';
  
  final E621Client client = E621Client(url, username, apiKey, userAgent: 'CustomAgent/1.0.0 (by username)');
  
  // Get last 10 posts
  final List<Post> posts = await client.getPosts(limit: 10);
    
  // Print the file url of each post
  for (final Post post in posts) {
    print(post.file.url);
  }
  
  exit(0);
 }
```


## No AI project / AI free Project
This project is written WITHOUT any AI assistance.
If you fork this project and use AI please remove this section.


## Special Thanks
- **Dasa**: Your honesty and the morale boost to actually start this project.