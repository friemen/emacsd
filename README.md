# .emacs.d

My personal configuration for [GNU Emacs](http://www.gnu.org/software/emacs/).

![Emacs](emacs.png)

## Installation

To install a current (snapshot) Emacs on Debian based distros:

1. Add [PPA](https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa) with
   `sudo apt-add-repository ppa:ubuntu-elisp/ppa`
2. Refresh your package lists with `sudo apt-get update`
3. Install packages with `sudo apt-get install emacs-snapshot emacs-snapshot-el`.


To install from a downloaded [source archive](http://ftp.gnu.org/gnu/emacs/) on Ubuntu:

1. `sudo apt-get install build-essential`
2. `sudo apt-get build-dep emacs25`
   (Perhaps you need to include source archives in your sources.list file.)
3. Unpack downloaded source archive to temp folder, cd into it
4. `./configure && make && sudo make install`


To use this configuration:

1. In case you have an existing configuration you don't want to loose make a backup of your `~/.emacs` and `~/.emacs.d`.
2. Remove `~/.emacs.d`.
3. Clone this repo using `git clone https://github.com/friemen/emacsd.git` to some place.
4. Create a softlink `ln -s ~/place/of/cloned/emacsd ~/.emacs.d`
5. Start Emacs, get something to drink.
6. Restart Emacs.

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


## Some M-x commands

Command                 | Description
---                     | ---
align-regexp            | Align within a region by regex
clojure-cheatsheet      | Open cheatsheet
comment-region          | Put region in comments
describe-mode           | Get help about active modes
ediff                   | Load and diff files
ediff-buffers           | Diff buffers
eshell                  | Create buffer with terminal
find-name-dired         | List all files in dir tree
httpd-start             | Start internal http server on http://localhost:8080/imp
impatient-mode          | Enable buffers impatient minor mode
linum-mode              | Toggle line number display on the left
magit-log-buffer-file   | Show Git log with commit touching file
magit-status            | Show Magit buffer
query-replace           | Replace all to end of buffer, ask for each
package-list-packages   | Open package manager
projectile-replace      | Replace string in project files
replace-string          | Replace all to end of buffer
revert-buffer           | Reload buffer contents from file
rgrep                   | Grep for pattern recursively in files
string-rectangle        | Insert prefix to every marked line
toggle-truncate-lines   | Turn visual line wrapping on or off
uncomment-region        | Remove comment markers for region
visual-line-mode        | Switch nice word wrap on/off

## Key bindings


File/buffer/window commands
```
C-q         Exit Emacs (or C-x C-c)
C-w         Kill current buffer (or C-x k)
C-o         Toggle window control hydra
C-^         Toggle treemacs
C-x C-f     Load file
C-x f       Open recently used file
C-x C-s     Save buffer to file
C-x C-w     Write buffer to other file
C-x C-d     Show directory of current buffer
C-x b       Switch buffer
C-Pgup      Previous buffer
C-Pgdn      Next buffer
C-Tab       Switch window
C-x C-b     List buffers
C-l         Center buffer to point
C-x g       Git status for current project
C-x l       Git log for file in current buffer
C-x o       Jump to next window
C-x 1       Delete other windows
C-x 0       Delete current window
C-x 2       Split window horizontally
C-x 3       Split window vertically
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
C-x C-x     Jump back to previous mark
```

General edit commands
```
C-z         Undo
C-k         Kill line
C-d         Kill character forward
M-d         Kill word
M-Delete    Kill word backwards
M-q         Reformat paragraph
C-c         Copy
C-x         Cut
C-v         Paste
C-Ins       Browse kill ring
C-x h       Mark whole buffer contents
C-<         Mark next like this (multiple cursors)
C->         Mark previous like this (multiple cursors)
C-M-<       Mark all like this (multiple cursors)
C-Space     Expand region
C-Enter     Set/end rectangle mark
M-S-;       Toggle comment for region
```

Misc commands
```
C-g         Cancel command / buffer (or 3x Escape)
q           Dismiss a temporary buffer that has appeared
M-g         Goto line
C-s         Search (swiper)
C-r         Replace string
C-y         Git grep
M-%         Query replace
C-x C-+     Increase font size in buffer
C-x C--     Decrease font size in buffer
C-x C-0     Reset font size in buffer
C-+         Toggle highlight symbol at point
```

Projectile (see also [project page](https://github.com/bbatsov/projectile/blob/master/doc/usage.md#interactive-commands))
```
C-c p       Open projectile hydra
```

Dired/Dired+
```
?           Show hydra
Enter       Select file/dir
Backspace   Go to parent dir
.           Toggle hidden file display
Tab         Toggle file details display
g           Refresh
m           Mark
u           Unmark
q           Close dired buffer
```

Markdown (see also [cheatsheet](http://ddloeffler.blogspot.de/2013/04/keybindings-for-emacs-markdown-mode.html))
```
C-c C-a l   Insert link
C-c C-c p   Preview in browser
```

Magit (for more see [keystroke index](https://magit.vc/manual/magit/Keystroke-Index.html#Keystroke-Index))
```
q           Close Magit buffer
g           Refresh
l l         Show log
e           Enter Ediff mode
x           Reset to commit
C-u x       Hard reset to commit
Tab         Show diff for single file
s           Stage one
u           Unstage one
S           Stage all
U           Unstage all
c c         Prepare commit
C-c C-c     Commit
P P         Push (without explicit refspec)
f u         Fetch
m m         Merge
b b         Switch branch
z z         Create stash
z p         Pop stash
z k         Kill stash
i           Add file to .gitignore
```

Paredit (for more see [cheatsheet](https://www.emacswiki.org/pics/static/PareditCheatsheet.png))
```
Tab         Reindent
C-M-u       Jump up to start of enclosing sexp
C-f         Jump forward to next sexp
C-S-f       Jump forward and adjust region
C-M-f       Jump forward+down to next sexp
C-b         Jump backward to beginning of previous sexp
C-S-b       Jump backward and adjust region
C-M-Space   Mark current sexp
C-d         Delete whitespace until next sexp except one
C-k         Kill sexp or rest until sexp ends
C-i         Reindent sexp
C-Right     Forward slurp (closing bracket to the right)
C-Left      Forward barf (closing bracket to the left)
ESC C-Right Backward slurp (opening bracket to the left)
ESC C-Left  Backward barf (opening bracket to the right)
M-(         Wrap round
M-s         Splice (unwrap)
M-S         Split sexps
M-J         Join sexps
M-r         Raise sexp
```

Hide-show code blocks (minor mode is activated where useful)
```
C-c x h     Hide all foldable code blocks in buffer
C-c x s     Show all folded code blocks in buffer
C-c x x     Toggle code folding for block at point
```

Clojure/CIDER-Mode specific (for more see [CIDER shortcuts](https://cider.readthedocs.io/en/latest/interactive_programming/))
```
C-c M-j     Start new REPL
C-c M-c     Connect to existing REPL
C-c C-c     Compile and evaluate current toplevel sexp
C-u C-c C-c As before, but show result in buffer
C-c C-f     Compile and evaluate toplevel sexp in REPL
C-c C-k     Compile and load complete buffer
C-c C-p     Recompile and load whole project
C-c C-Enter Recompile and restart system
C-c C-e     Evaluate sexp preceding point and display result in echo area
C-c l       Save sexp at point
C-c C-l     Eval saved sexp
C-c C-z     Jump to REPL buffer
C-c M-p     Copy toplevel sexp to REPL buffer
C-c M-n n   Switch REPL namespace to buffer
C-c M-m     Macroexpand-1 preceding sexp
C-c C-t t   Run single test at point
C-c C-t n   Run tests for namespace
C-c C-t p   Run tests for project
C-c C-v     Refactorings (see link below)
M-.         Jump to definition
M-,         Jump back
C-c C-d     Show docs for function
C-c C-j     Show Javadoc in browser
C-c C-i     Reindent defn
C-<         Mark all symbols in defn (multiple cursors)
C-M-<       Mark all symbols like this (multiple cursors)
Tab         Reindent, then auto-complete
```

[Clojure Refactoring shortcuts](https://github.com/clojure-emacs/clj-refactor.el/wiki)


CIDER-REPL-Mode specific (for more see [CIDER shortcuts](https://cider.readthedocs.io/en/latest/using_the_repl/))
```
Enter       Evaluate entered sexp
Tab         Complete symbol at point
C-Up        Back through REPL history
C-Down      Forward through REPL history
C-c C-b     Cancel current evaluation
C-c C-u     Clear input before point
C-c C-o     Clear previous REPL buffer output
C-u C-c C-o Clear REPL buffer output
C-c C-q     Quit CIDER session / kill REPL
C-c C-Enter Restart component system
C-c f       Start figwheel for ClojureScript REPL
C-c q       Quit ClojureScript REPL
```

Web-Mode (see also [project page](http://web-mode.org/))
```
C-7         Close tag
C-c C-i     Indent buffer
M-;         Toggle comment
C-c C-n     Jump to end/begin tag
C-c C-f     Toggle block folding
C-c C-d d   Detect tag mismatch
C-c C-e i   Insert element (interactive)
C-c C-e l   Insert link (interactive)
C-c C-a i   Insert attribute (interactive)
C-c q q     Toggle folding
```

Emacs-Lisp-Mode
```
C-c C-c     Eval top-level sexp
C-x C-e     Eval last elisp sexp
C-<         Mark all symbols in defun (multiple cursors)
C-M-<       Mark all symbols like this (multiple cursors)
```

Treemacs Mode
```
?           Show hydra
q           Close treemacs
C-^         Close treemacs
Tab         Expand / Collapse dir
Enter       Load file in buffer
```


Org-Mode (see also [refcard](http://orgmode.org/orgcard.txt))

```
* Todos
** Organize christmas party [66%]
   DEADLINE: <2014-12-05 Fri>
*** DONE Book guide for museum
*** DONE Book table restaurant
*** TODO Invite people
```

* A headline begins with `*` and starts a section.
* A section contains items, starting by default with bullet `-`.
* Checkboxes `[ ]` can be used after the bullet of an item.

```
M-Enter     Add next item
M-S-Enter   Add next TODO or [ ] item
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
C-c ^       Sort items
C-c .       Add date
C-c C-q     Define tags
C-c C-d     Add deadline to section
C-c C-c     Toggle checkbox [ ] <-> [X]
C-c C-z     Add note to section
C-c C-l     Add link
C-c / ...   Filter by ...
C-c a ...   Open agenda
```
