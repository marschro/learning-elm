# ELM - Development Environment Setup Steps
**_based on the install setup from James Moore https://github.com/knowthen_**



1. Install **node.js** along with **npm** https://nodejs.org/en/ (via website or homebrew)
```
brew install node
```
2. Install **Elm** with npm
```
npm install -g elm
```
3. Install the **Atom editor**
```
https://atom.io/
```
4. Install **Atom shell commands** (aka atom package manager - apm)
```
open Atom => Menu Atom => Install Shell Commands
```
5. Install the **language-elm** via apm
```
apm install language-elm
```
6. Install **elm-oracle**
```
npm install -g elm-oracle
which elm-oracle
```
Install `elm-oracle` via npm and get the path to the binary by whiching. Then open up `Atom preferences/settings`. Click `packages` then `filter by elm`. Find the `language-elm package` and click the `settings` button. Set the `elm-oracle executable path` setting to the elm-oracle path

7. Install **elm-format binary** binary from
```
https://github.com/avh4/elm-format
```
Unzip the downloaded file and move the `elm-format` executable to a location in your PATH variable, such as
```
mv ~/Downloads/elm-format /usr/local/bin/elm-format
```
8. Install the **elm-format atom package**
```
apm install elm-format
```
Start Atom App. Open Preferences => Packages => Filter by elm => choose `elm-format` package. Verify the `format on save` checkbox is `checked` in package settings.

9. Install **atom linter**
```
apm install linter
```
10. Install  **elm linter**
```
apm install linter-elm-make
which elm-make
```
Install `elm linter` via apm. Locate the path for `elm-make` by whiching.

11. In Atom App open the `linter-elm-make` settings page and set the `elm-make executable path` setting to the path that was returned by `which elm-make`


## You are ready to rumble!