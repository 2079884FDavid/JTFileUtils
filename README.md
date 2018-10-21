# JTFileUtils
A simple Haskell library which helps handling certain file types.

## Getting started

The following instructions will show you how to incorporate this library into your git project using submodules. For more information about the functionality of submodules check out this [link](https://gist.github.com/gitaarik/8735255).

### Prerequisites/Dependencies

For JTFileUtils.JSON

    cabal install aeson

### Add the library to your project
You have an existing project:

    myproject$ tree -aL 1
    .
    ├── .git
    └── Main.hs

    1 directory, 1 file

To add this library to your `myproject` simply run the following command at the root of your repository (or wherever you keep your source code). *If you have a libraries directory (such as "lib") specifically for your project run the command inside that directory instead.*

    myproject$ git submodule add https://github.com/2079884FDavid/JTFileUtils.git

To refer to the library from your source code simply use `import JTFileUtils.[module]`

### Update to latest library release

    cd JTFileUtils
    git pull
    cd ..
    git add JTFileUtils
    git commit -m "Updated to latest JTFileUtils release"

### Checkout your repository
If your repository contains this library as a submodule run the following:

    git checkout https://myproject
    git submodule update --init


# Usage Examples

### `JTFileUtils.JSON`
**`loadJSON`** `:: FromJSON a => FilePath -> IO a`<br/>
FilePath is a string pointing to a JSON file which contains one or more objects of a type which derives `FromJSON`. The function tries to load the objects in the expected format. Imagine you have a file `Person.hs`:
```haskell
{-# LANGUAGE DeriveGeneric #-}
module Person
( Person (..)
) where

import Data.Aeson
import GHC.Generics

data Person =
  Person { firstName :: String
         , lastName  :: String
         } deriving (Generic, Show)

instance FromJSON Person
```

and a JSON file with an array of persons (`persons.json`):

```json
[
  {"firstName": "Johnny", "lastName": "Depp"},
  {"firstName": "Oliver", "lastName": "Twist"}
]
```

you can easily load this json file as follows:

```haskell
import JTFileUtils.JSON
import Person

main :: IO ()
main = do
  p <- loadJSON "persons.json" :: IO [Person]
  putStrLn (show p)
```

# Misc
Developer workflow and release management [as described](https://nvie.com/posts/a-successful-git-branching-model/) by Vincent Driessen.

Please check the [LICENSE](LICENSE) file for legal information.

Please get [in touch](http://www.jacktex.eu/about/contact.php) if you would like to contribute to this project.

### Version
v1.0
