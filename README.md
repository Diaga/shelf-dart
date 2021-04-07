## Requirements

- [x] Make a webserver using [Shelf](https://pub.dev/packages/shelf).
- [ ] Render HTML templates.
- [ ] Convert Dart to JS for use client-side.
- [ ] Handle REST requests.
- [x] Serve files from disk.

## Setting up server

1. Download and install [latest version of git](https://git-scm.com/downloads).
2. Clone the repository locally
     ```shell script
    $ git clone https://github.com/Diaga/shelf-dart.git
    ```
3. Setup environment
    ```shell script
    $ dart pub get
    $ npm i -g nodemon
    ```
4. Run server through nodemon to watch for changes in source files and restart server automatically
    ```shell script
    $ nodemon
    ```
   If watching for changes is not required, use the following command to run server
   ```shell script
    $ dart run
    ```

## License 
- [MIT](https://github.com/Diaga/shelf-dart/blob/master/LICENSE).
- Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
