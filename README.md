# .emacs.d

My personal configuration for [GNU Emacs](http://www.gnu.org/software/emacs/).

![Emacs](emacs.png)

## Installation

To install a current (snapshot) Emacs on Debian based distros:

1. Add [PPA](https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa) with
   `sudo apt-add-repository ppa:ubuntu-elisp/ppa`
2. Install packages with `sudo apt-get install emacs-snapshot emacs-snapshot-el`.


To use this configuration:

1. In case you have an existing configuration you don't want to loose make a backup of your `~/.emacs` and `~/.emacs.d`.
2. Remove `~/.emacs.d`. 
3. Clone this repo using `git clone https://github.com/friemen/emacsd.git ~/.emacs.d`.
4. Start Emacs, get something to drink.
5. Restart Emacs.

## Clojure hint

If you plan to work with [Clojure](http://clojure.org) you can follow
the steps as documented in
[a blog post](http://www.falkoriemenschneider.de/a__2013-01-30__Setting%20up%20Emacs+Lein+Clojure%20in%2015%20minutes.html)
of mine.

Clojure nREPL integration is provided by
[CIDER](https://github.com/clojure-emacs/cider). To make full use of
it, the [Leiningen](http://leiningen.org/) cider-nrepl plugin must be
present, either in project.clj or ~/.lein/profiles.clj. Here's my
[profiles.clj](https://gist.github.com/friemen/5153156d765265fe5c13)
as example.


## Haskell hint

If you want to work with [Haskell](http://www.haskell.org) you can
follow the [steps that I recently took](http://www.falkoriemenschneider.de/a__2014-09-02__Setting-up-Emacs-and-Haskell.html)
to get started.


## Some M-x commands

Command | Description
--- | ---
clojure-cheatsheet | Open cheatsheet
describe-mode | Get help about active modes
ediff | Load and diff files
ediff-buffers | Diff buffers
eshell | Create buffer with terminal
httpd-start | Start internal http server on http://localhost:8080/imp
impatient-mode | Enable buffers impatient minor mode
linum-mode | Toggle line number display on the left
magit-status | Show Magit buffer
query-string | Replace all to end of buffer, ask for each
package-list-packages | Open package manager
replace-string | Replace all to end of buffer
rgrep | Grep for pattern recursively in files
string-rectangle | Insert prefix to every marked line
visual-line-mode | Switch nice word wrap on/off

## Shortcuts


File/buffer/window commands
```
C-x C-c     Exit Emacs
C-x C-f     Find file
C-x f       Open recently used file
C-x C-s     Save buffer
C-x C-w     Write buffer to other file
C-x C-d     Show directory (dired+)
C-x C-j     Open dired and go to file in current buffer
s-y         Open directory bar (speedbar)
C-x b       Switch buffer
C-tab       Switch buffer
C-x C-b     List buffers (ibuffer)
C-Escape    Kill this buffer
C-x k       Kill buffer
C-x g       Git status (magit)
C-x o       Jump to next window
C-x 1       Delete other windows
C-x 0       Delete current window
C-x 2       Split window horizontally
C-x 3       Split window vertically
C-l         Center buffer to point
C-PgUp      Goto previous tab
C-PgDown    Goto next tab
```

Movement of point
```
C-n         Line down
C-p         Line up
M-f         Word forward
M-b         Word backward
C-a         Line begin
C-e         Line end
M-<         Buffer begin
M->         Buffer end
C-c Space   Ace Jump
```

General edit commands
```
C-z         Undo
C-k         Kill line
C-d         Kill character forward
M-d         Kill word
M-delete    Kill word backwards
M-q         Reformat paragraph
C-c         Copy
C-x         Cut
C-v         Paste
C-y         Show kill ring (abort with C-g)
C-x h       Mark whole buffer contents
C-<         Mark previous like this (multiple cursors)
C->         Mark next like this (multiple cursors)
C-M-<       Mark all like this (multiple cursors)
C-Space     Expand region
C-Enter     Set/end rectangle mark
M-S-;       Toggle comment for region
```

Misc commands
```
C-g         Cancel command / buffer (or 3x Escape)
q           Dismiss a temporary buffer that has appeared
M-g g       Goto line
C-s         Regex search forwards
C-s C-w     Regex search forwards for word under point
C-r         Regex search backwards
C-r C-w     Regex search backwards for word under point
M-%         Query replace
C-x C-+     Increase font size in buffer
C-x C--     Decrease font size in buffer
C-x C-0     Reset font size in buffer
s-e p       EMMS play directory
s-e e       EMMS display playlist
```

Projectile (see also [project page](https://github.com/bbatsov/projectile#interactive-commands))
```
C-c p s     Switch project / select file
C-c p f     Select file in current project
C-c p e     Select within recently visited files in project
C-c p b     Select within open project buffers
C-c p T     Select test file in current project
C-c p D     Open project root dir for current buffer
C-c p c     Compile project
C-c p p     Execute tests for project
C-c p k     Kill all project buffers
```

Dired/Dired+
```
Enter       Select file/dir
^           Goto parent dir
C-x M-o     Toggle hidden file display
(           Toggle file details display
g           Refresh
m           Mark
u           Unmark
U           Unmark all
* .         Mark by extension
* %         Mark by regex
C           Copy marked
R           Move/Rename marked
D           Delete marked
F           Visit marked
+           Create new dir
q           Close dired buffer
```

Markdown (see also [cheatsheet](http://ddloeffler.blogspot.de/2013/04/keybindings-for-emacs-markdown-mode.html))
```
C-c C-a l   Insert link
C-c C-c p   Preview in browser
```

Magit (for more see [cheatsheet](http://daemianmack.com/magit-cheatsheet.html))
```
g           Refresh
Tab         Show diff for single file
s           Stage one
S           Stage all
u           Unstage one
U           Unstage all
c c         Prepare commit
C-c C-c     Commit
P P         Push
q           Close Magit buffer
```

Paredit (for more see [cheatsheet](https://github.com/joelittlejohn/paredit-cheatsheet))
```
TAB         Reindent
C-M-u       Jump up to start of enclosing S-expr
C-f         Jump forward to next S-expr
C-M-f       Jump forward+down to next S-expr
C-b         Jump backward to beginning of previous S-expr
C-M-Space   Mark current S-expr
C-d         Delete whitespace until next S-expr except one
C-k         Kill S-expr or rest until S-expr ends
C-Right     Forward slurp (closing bracket to the right)
C-Left      Forward barf (closing bracket to the left)
ESC C-Right Backward slurp (opening bracket to the left)
ESC C-Left  Backward barf (opening bracket to the right)
M-(         Wrap round
M-s         Splice (unwrap)
M-S         Split S-exprs
M-J         Join S-exprs
M-r         Raise S-expr
```

Clojure-Mode specific (for more see [CIDER shortcuts](https://github.com/clojure-emacs/cider#keyboard-shortcuts))
```
C-c M-j     Start REPL
C-c ,       Run tests
C-c '       View test failure messages
C-i         Reindent selected sexp
C-c C-e     Evaluate expr preceding point and display result in echo area
C-c C-c     Compile and load current toplevel sexp
C-u C-c C-c As before, but show result in buffer
C-c C-p     Evaluate preceding sexp and pretty print result
C-c C-k     Compile and load complete buffer
C-c C-z     Jump to REPL buffer
C-c M-p     Copy preceding sexp to REPL buffer
C-c M-n     Switch REPL namespace to buffer
C-c M-m     Macroexpand-1 preceding sexp
C-c C-v     Refactorings (see link below)
M-.         Jump to definition
M-/         Auto-complete word
C-c C-d     Show docs for function
C-c C-j     Show Javadoc in browser
C-c C-x n   Type check namespace (typed-clojure-mode)
C-c C-x f   Type check preceding form (typed-clojure-mode)
```

[Clojure Refactoring shortcuts](https://github.com/clojure-emacs/clj-refactor.el#usage)


CIDER-Mode specific (in REPL)
```
Tab         Complete symbol at point
C-Up        Back through REPL history
C-Down      Forward through REPL history
C-c C-c     Cancel current evaluation
C-c C-u     Clear input before point
C-c C-o     Clear previous REPL buffer output
C-c M-o     Clear REPL buffer output
, ha Tab    Kill REPL
```

Web-Mode (see also [project page](http://web-mode.org/))
```
C-7         Close tag
C-c C-i     Indent buffer
M-;         Toggle comment
C-c C-n     Jump to end/begin tag
C-c C-f     Toggle block folding
C-c C-d d   Detect tag mismatch
```

Emacs-Lisp-Mode
```
C-x C-e     Eval Elisp Sexp
```

Haskell-Mode
```
C-c C-l     Load buffer in interactive GHC
C-c C-h     Hoogle query
C-c C-c     Cabal build
C-c C-t     Show type of expression
C-c C-d     Show info about expression
C-c C-k     Clear REPL buffer output
M-.         Goto definition
```

Speedbar File-Mode
```
s-y         Open Speedbar frame
q           Close Speedbar frame
U           Move directory up
Enter       Move into / load in buffer
+           Expand dir
-           Collapse dir
D           Delete file
R           Rename file
```


Org-Mode (see also [refcard](http://orgmode.org/orgcard.txt))

```
* Todos
** Organize christmas party [66%]
   DEADLINE: <2014-12-05 Fri>
- [X] Book guide for museum
- [X] Reserve restaurant
- [ ] Notify people
```

* A headline begins with `*` and starts a section.
* A section contains items, starting by default with bullet `-`.
* Checkboxes `[ ]` can be used after the bullet of an item.

```
M-Enter     Add next item
M-S-Enter   Add next TODO item
M-Left      Decrease heading level
M-Right     Increase heading level
M-Up        Move up within level
M-Down      Move down with level
Tab         Cycle folding
S-Left      On heading:  cycle status backward
            On item:     cycle bullet style
            In calendar: previous day
S-Right     On heading:  cycle status forward
			On item:     cycle bullet style
	        In calendar: next day
S-Up        On heading:  cycle priority backward
            On item:     move up within section
S-Down      On heading: cycle priority forward
         	On item:     move down within section
C-c .       Add date
C-c C-d     Add deadline to section
C-c C-c     Toggle checkbox [ ] <-> [X]
C-c C-z     Add note to section
```

