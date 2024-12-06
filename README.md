A client library for the API of imageboards using the e621 fork of gelbooru.

[![pipeline status](https://gitlab.projetretro.io/shalien/e621/badges/main/pipeline.svg)](https://gitlab.projetretro.io/shalien/e621/-/commits/main)
[![coverage report](https://gitlab.projetretro.io/shalien/e621/badges/main/coverage.svg)](https://gitlab.projetretro.io/shalien/e621/-/commits/main)
[![Latest Release](https://gitlab.projetretro.io/shalien/e621/-/badges/release.svg)](https://gitlab.projetretro.io/shalien/e621/-/releases)


## Upgrading from >1.0.0

This version of the library use the [OpenAPI](https://e621.wiki) specification of the e621 API.

It has been rewritten from the ground up to fit the new specification, improve code quality and add new features BUT isn't backwards compatible with the previous version.

Please be mindful before upgrading your dependency.

## Features

- Implements all the endpoints of the e621 OpenAPI specification (d69c34e) : [e621 API](https://e621.wiki)
- Use Dart's native [`http`](https://pub.dev/packages/http) package for making requests alloowing for using more advanced [implementation](https://pub.dev/packages/http#choosing-an-implementation) on the fly.

## Getting started

Add the package to your project by running the following command:

```bash
# http is a required dependency since we rely on ClientException
dart pub add e621 http 
```

## Usage 


```dart
// Simple example to collect last ten post and display link

import 'package:e621/e621.dart';
import 'package:http/http.dart';

Future<void> main() async {

  /// You should see the `http`[https://pub.dev/packages/http#choosing-an-implementation](https://pub.dev/packages/http#choosing-an-implementation) package documentation for using an adequate [Client] for your platform
  final E621Client client = E621Client(host: Uri.parse('https://e621.net'), login: 'username', apiKey: 'api_key', userAgent: 'MyApp/1.0 (by username on e621)');

  final List<Post> posts;

  try {

    /// limit is optional but 10 will get the last 10 posts
    posts = await client.posts.list(limit: 10);

    /// [ClientException] is found in the `http` package
    /// it will be throw in case something went wrong with the request AT the connection time
  } on ClientException catch (e) {
    print('Failed to get posts: $e');
    return;

    /// [E621Exception] is found in the `e621` package
    /// It will throw is something went wrong with the request AFTER the connection time
  } on E621Exception catch (e) {
    print('Failed to get posts: $e');
    return;
  }

  if (posts.isEmpty) {
    print('No posts found');
    return;
  }

  for (final post in posts) {
    print('Post: ${post.id} - ${post.file.url}');
  }

}
```
## Support This Project

[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-FFDD00?style=flat-square&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/shalien)
[![Ko-fi](https://img.shields.io/badge/Support-Ko--fi-29ABE0?style=flat-square&logo=ko-fi)](https://ko-fi.com/shalien)
[![Liberapay](https://img.shields.io/badge/Donate-Liberapay-F6C915?style=flat-square&logo=liberapay)](https://liberapay.com/shalien)
[![Open Collective](https://img.shields.io/badge/Donate-Open%20Collective-007EC6?style=flat-square&logo=open-collective)](https://opencollective.com/shalien)
[![Patreon](https://img.shields.io/badge/Support-Patreon-F96854?style=flat-square&logo=patreon)](https://patreon.com/shalien)
[![PayPal](https://img.shields.io/badge/Donate-PayPal-00457C?style=flat-square&logo=paypal)](https://paypal.me/oduparc)

## License

PROJETRETRO RESTRICTED LICENSE + AI (PRL + AI)

[license@projetretro.io](mailto:license@projetretro.io) - 2024

This license cover both the use of the project itself and the use or any parts of the code and/or assets composing the
project to which this license is attached in any fashion.

The product to which this license is granted is distributed "AS IS" and without any warranty of any kind, express or
implied.
The user and/or provider of the product to an end user assumes all risk of user, damage or injury.
The user and/or provider of the product to an end user is solely responsible for determining the suitability of this
product ofr it's intended use.

By using the product attached to this license, the user and/or provider of the product to an end user agrees to the
terms of this license.
If you do not agree to all the terms of this license, do not use the product.

This license is RESTRICTIVE, it's mean that any usage EXPRESSLY not authorized by said license is FORBIDDEN.

You must :

- Provide a complete copy of this license with any distribution of the product
- Not remove any copyright, trademark or patent notices from the product or any parts
- Provide an updated version of the license with any modification of the product AS SOON AS POSSIBLE and CLEARLY NOTIFY
  the user of the modification

It's EXPRESSLY FORBIDDEN to :

- Re-license the project or any parts under any others licenses
- Use the project or any parts for any commercial (meaning generating revenue) purposes WITHOUT written authorization
  from the project owner
    - Open source projects donations are excluded from this restriction
- Use the project or any parts of the code and/or assets composing the project to which this license is attached in any
  fashion to train, generate, feed or any kind of action related to LLM or any AI related technologies

Failing to comply to the license term in a deliberate way will result in the immediate termination of the license and a
fee of 1% of the total revenue generated by the product using the project to which this license is attached in any
fashion to the author(s) of the project and/or legal actions.

## Special Thanks
- **Dasa**: Your honesty and the morale boost to actually start this project.