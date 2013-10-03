ac-coffee
=========

Emacs auto-complete source for CoffeeScript

Requirements
--------

* Node.js
* Coffee
* Emacs 24+
* auto-complete

Installation
--------

1. Clone this repo
2. In repo director, run ```npm install coffee```
3. Configure ```.emacs```

```lisp
;; My Coffee AC Source
(add-to-list 'load-path "path/to/ac-coffee/")
(require 'ac-coffee)
```

Done!
