# Billy::Goat

Goat do this for me.

<a title="By Kuebi = Armin Kübelbeck (Own work) [CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons" href="http://commons.wikimedia.org/wiki/File%3AHausziege_04.jpg"><img width="100%" alt="Hausziege 04" src="http://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hausziege_04.jpg/512px-Hausziege_04.jpg"/></a>


## Installation

```
$ gem install billygoat
```

## Usage

Getting the goat to do a task
```
> goat [skill] [task]
```

[A list of all skills and tasks goat already knows](COMMANDS.md)


Getting the goat to do the default task for a given skill
```
> goat [skill]
```

Asking the goat about the tasks it knows
```
> goat help
> goat help [skill]
> goat help [skill] [task]
```

Teaching the goat new tasks
```
> goat learn file [file name]
> goat learn directory [file path]
```

Which services have you authorized your goat to use?
```
> goat show credentials
```

Give your goat permission to use a service
```
> goat update [service] [key=value] [key=value]
> goat update github access_token=XXXXXXXX
> goat update jenkins username=XXXX password=XXXX server_url=XXXX
```

Goat knows git
```
> goat branches
> goat git commit [message]
> goat git checkout (branch)
> goat git add_tag [name]
```

Talk like a goat
```
> goat say Naaaaaaa!
+-----------+
| Naaaaaaa! |
+-----------+
    |    (_(
    +--  /_/'_____/)
         "  |      |
            |""""""|
```

## License

Copyright (c) 2015 Derrick Parkhurst (derrick.parkhurst@gmail.com),

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.