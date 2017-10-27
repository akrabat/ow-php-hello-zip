# OpenWhisk PHP Hello action (zip)

An example PHP OpenWhisk action that uses multiple PHP files.

You'll find the action code is in [`actions/hello/index.php`][1].


## Running the action 

* Ensure you have a working `wsk` cli command
* Check `Makefile` and set `PACKAGE` to something different if you want to.
* Run `make setup` to create the package
* Run `make` to zip up the PHP files and upload it to OpenWhisk
* Run using: `wsk action invoke -r hello/hello`  (unless you changed the package name)


[1]: https://github.com/akrabat/ow-php-hello-zip/blob/master/actions/hello/index.php


## License

Copyright (c) 2017 Rob Allen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

(i.e. MIT, without requirement to include copyright notice if you use this code.)
