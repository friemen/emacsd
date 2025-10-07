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

1. Install additional packages like so
```
sudo apt-get -y install \
    build-essential \
    texinfo \
    libncurses-dev \
    libgnutls28-dev \
    xaw3dg-dev \
    libjpeg-dev \
    libpng-dev \
    libgif-dev \
    libgtk-3-dev \
    libsqlite3-dev \
    libgccjit0 \
    libgccjit-13-dev \
    libtiff-dev \
    libxml2-dev
```
2. `sudo apt-get -y build-dep emacs`
   (Perhaps you need to include source archives in your sources.list file.)
3. Unpack downloaded source archive to temp folder, cd into it
4. `./autogen.sh && ./configure --with-native-compilation --with-x-toolkit=gtk && make && sudo make install`


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

## E-Mail setup

E-Mail searching, reading and writing requires notmuch (indexer) and
msmtp (SMTP command), respectively. Syncing of local maildirs is done
via mbsync (IMAP) and mpop (POP3). Password managment is done via
[pass](https://passwordstore.org).

## Calendar/Diary setup

The Emacs diary uses #includes. The included diary files are generated
from iCalendar .ics files that are synced via vdirsyncer with CalDAV
compliant services like Radicale or Nextcloud.

## Some M-x commands I use often

Command                     | Description
---                         | ---
align-regexp                | Align within a region by regex
calendar                    | Open calendar and diary
comment-region              | Put region in comments
describe-mode               | Get help about active modes
display-line-numbers-mode   | Toggle line number display on the left
ediff                       | Load and diff files
ediff-buffers               | Diff buffers
eshell                      | Create buffer with terminal
find-name-dired             | List all files in dir tree
hl-line-mode                | Toggle highlighting of current line
httpd-start                 | Start internal http server on http://localhost:8080/imp
impatient-mode              | Enable buffers impatient minor mode
magit-blame                 | Show Git blame lines for current file
magit-log-buffer-file       | Show Git log with commits touching file
magit-status                | Show Magit buffer
my-css-indent-2/4           | Set css indentation width
notmuch                     | Open e-mail search overview
org-agenda                  | Open Org agenda view
org-capture                 | Capture TODO item or anything else
org-store-link              | Capture current place as link
query-replace               | Replace all to end of buffer, ask for each
package-list-packages       | Open package manager
projectile-replace          | Replace string in project files
replace-string              | Replace all to end of buffer
restclient-mode             | REST client for HTTP API testing
revert-buffer               | Reload buffer contents from file
rgrep                       | Grep for pattern recursively in files
string-rectangle            | Insert prefix to every marked line
toggle-truncate-lines       | Turn visual line wrapping on or off
uncomment-region            | Remove comment markers for region
visual-line-mode            | Switch nice word wrap on/off

## Key bindings

File/buffer/window/frame commands

```
C-q         Exit Emacs
C-w         Kill current buffer
C-x k       Ask for buffer to kill
C-o         Toggle window control hydra
C-x C-f     Open file in new buffer
C-x f       Open recently used file
C-x C-s     Save buffer to file
C-x C-w     Write buffer to other file
C-x b, F8   Switch buffer
C-Pgup      Previous buffer
C-Pgdn      Next buffer
C-Tab       Switch to next window
M-<1 2 ..>  Goto window 1, 2, 3, ..
C-x o       Jump to next window
C-x 1       Delete other windows
C-x 0       Delete current window
C-x 2       Split window horizontally
C-x 3       Split window vertically
C-x 5 2     Create new frame
C-x 5 0     Delete current frame
C-l         Center buffer to point
```

Globally available special functions

```
C-Escape    Toggle treemacs sidebar
F5          Open dashboard
C-x C-b     List buffers
C-F8        List buffers
C-x C-a     Org agenda
C-x C-l     Org store link
C-x C-q     Org capture
C-x C-d     Show directory of current buffer in dired
C-x d       Ask for start directory, then open dired
C-x t a     Add current dir to treemacs workspace
C-x C-c     Show calendar with diary-fancy-display
C-x g       Git status for current project
C-x C-.     Git blame for file in current buffer
C-x l       Git log for file in current buffer
C-x C-n     Show e-mail overview buffer *notmuch-hello*
C-x m       Select mail composition context (from address, signature etc)
C-x C-m     Compose new message
C-u C-x C-m Compose new message, ask for sender first
C-x y, F7   Insert snippet
```

Movement of point

```
C-n         Line down
C-p         Line up
M-f         Word forward
M-b         Word backward
C-a         Line begin
C-e         Line end
C-,         Ace Jump
M-<         Push point position to mark ring
M->         Jump back
```

General edit commands

```
C-z         Undo
C-Z         Redo
C-x u       Show undo tree
C-k         Kill line
C-d         Kill character forward
M-d         Kill word
M-Delete    Kill word backwards
M-q         Reformat paragraph
C-c         Copy
C-x         Cut
C-v         Paste
C-Ins       Browse kill ring
C-/         Toggle comment for region
C-x h       Mark whole buffer contents
C->         Mark next like this (multiple cursors)
C-<         Mark previous like this (multiple cursors)
C-M-.       Mark all like this (multiple cursors)
C-M-m       Multiple cursors hydra
C-4         Mark region begin
C-Space     Expand region
C-Enter     Set/end rectangle mark
```

Misc commands

```
C-g         Cancel command / buffer (or 3x Escape)
q           Dismiss a temporary buffer that has appeared
M-g         Goto line
C-s         Search (swiper)
C-r         Replace string
C-x y       Insert snippet
C-y         Git grep
M-%         Query replace
C-+         Increase font size in buffer
C--         Decrease font size in buffer
C-x C-0     Reset font size in buffer
C-;         Toggle highlight symbol at point
```

Projectile (see also [project page](https://github.com/bbatsov/projectile/blob/master/doc/usage.md#interactive-commands))

```
C-c p       Open projectile hydra
C-F12       Find project file
```

Dired

```
?           Show hydra
Enter       Visit file/dir
e           Edit file
v           View file/dir in place
o           Visit file in other window
&           Do shell command on file (e.g. xdg-open)
C-o         View file in other window
^           Go to parent dir
Backspace   Go to parent dir
.           Toggle hidden file display
Tab         Toggle file details display
s           Toggle sorting by date or by name
g           Refresh
t           Invert selection marks
m           Mark
% m         Mark using regexp
u           Unmark
U           Unmark all
k           Hide marked lines from list
M           Modify access flags (chmod)
q           Close dired buffer
```

Markdown (see also [cheatsheet](http://ddloeffler.blogspot.de/2013/04/keybindings-for-emacs-markdown-mode.html))

```
C-c C-a l   Insert link
C-c C-c p   Preview in browser
C-c C-c l   Toggle live preview in other window
```

Magit (for more see [keystroke index](https://magit.vc/manual/magit/Keystroke-Index.html#Keystroke-Index))

```
q           Close Magit buffer
g           Refresh
l l         Show log
e           Enter Ediff mode
Tab         Show diff for single file
C-u C-j     Visit worktree file in other window
s           Stage one
u           Unstage one
S           Stage all
U           Unstage all
x           Reset to commit
C-u x       Hard reset to commit
c c         Prepare commit
C-c C-c     Commit
P P         Push (without explicit refspec)
P g         Push to Gerrit review branch
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
C-M-t       Transpose sexps
```

Hide-show code blocks (minor mode is activated where useful)

```
C-c x h     Hide all foldable code blocks in buffer
C-c x s     Show all folded code blocks in buffer
C-c x x     Toggle code folding for block at point
```

Clojure/Cider-Mode specific (for more see [CIDER shortcuts](https://cider.readthedocs.io/en/latest/interactive_programming/))

```
C-c M-j     Start new REPL
C-c M-c     Connect to existing REPL
C-c C-c     Compile and evaluate current toplevel sexp
C-u C-c C-c As before, but show result in buffer
C-c C-f     Compile and evaluate toplevel sexp in REPL
C-c C-k     Compile and load complete buffer
C-c C-p     Recompile and load whole project
C-c s       Recompile and restart system
C-c C-e     Evaluate sexp preceding point and display result in echo area
C-c l       Save sexp at point
C-c C-l     Eval saved sexp
C-c C-x     Clear REPL buffer
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
C-.         Mark all symbols in defn (multiple cursors)
C-M-.       Mark all symbols like this (multiple cursors)
Tab         Reindent, then auto-complete
```

[Clojure Refactoring shortcuts](https://github.com/clojure-emacs/clj-refactor.el/wiki)


Cider-REPL-Mode specific (for more see [CIDER shortcuts](https://cider.readthedocs.io/en/latest/using_the_repl/))

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

[REST Client](https://github.com/pashky/restclient.el)

Use `# -*- restclient -*-` at the top of a .txt file to auto-start
restclient-mode when Emacs visits the file.

```
C-c C-c     Run query at point
C-c C-u     Copy query at point as a curl command
Tab         Hide/show current request body
C-c C-i     Show information on restclient variables at point
```

Emacs-Lisp-Mode

```
C-c C-c     Eval top-level sexp
C-x C-e     Eval last elisp sexp
C-.         Mark all symbols in defun (multiple cursors)
C-M-.       Mark all symbols like this (multiple cursors)
```

Treemacs Mode

```
?           Show hydra
q           Close treemacs
C-Escape    Close treemacs
Tab         Expand / Collapse dir
Enter       Load file in buffer
```

Org Mode (see also [refcard](https://orgmode.org/orgcard.txt) and [org guide](https://orgmode.org/orgguide.pdf))

Bindings in Org buffer

```
M-Enter     Add next item
M-S-Enter   Add next TODO or [ ] item
M-Left      Decrease heading level
M-Right     Increase heading level
M-Up        Move up within level
M-Down      Move down with level
Tab         Cycle folding
S-Tab       Cycle global folding
M-S-Left    Shift-left behaviour on item
M-S-Right   Shift-right behaviour on item
C-t         Define tags
C-c C-t ... Set heading TODO status keyword
C-c , ...   Set priority
C-c b       Cycle list bullet type
C-c .       Set date
C-c C-d     Set deadline date for headline
C-c C-s     Set schedule date for headline
C-c C-c     Toggle checkbox [ ] <-> [X], fix date, relayout table etc.
C-c C-z     Add note to headline
C-c C-l     Insert link
C-c / ...   Filter by (aka sparse tree) ...
C-c ^       Sort items
C-c $       Move heading to archive
C-c C-e     Export Org file to ...
F5          Toggle presentation mode (via org-tree-slide)
```

My Org [Speed Keys](https://emacsdocs.org/docs/org/Speed-Keys)

```
?           Speed Keys help
a           Org Agenda
n           Jump to next heading
p           Jump to previous heading
N           Jump to next heading with same level
P           Jump to next heading with same level
u           Jump up to parent heading
t           Select TODO keyword
s           Schedule headline
,           Set priority
0           Remove priority
1           Priority A
2           Priority B
3           Priority C
:           Set tags
```

Bindings in Org agenda buffer

```
q           Quit
g           Refresh
Tab         Jump to item in Org file
S           Save all Org buffers
.           Go to today
f           Go forward in time
b           Go backward in time
t           Set TODO status
,           Choose priority
s           Schedule item
C-c C-d     Set deadline for item
D           Toggle diary item display
I           Start clock
O           Stop clock
X           Cancel running clock
```

Org-roam

```
C-c n i    Insert node
C-c n f    Find node
C-c n l    Toggle Org-roam buffer display
```

Calendar

```
q           Close calendar
i d         Insert new diary entry
```

Notmuch E-Mail / saved searches overview aka notmuch-hello

```
?           Display help
q           Close window
m           Compose new message
C-u m       Compose new message, ask for sender first
j           Jump to query
g           Refresh view
G           Notmuch sync with POP3 and IMAP servers
```

Notmuch E-Mail / search results as list of messages and threads

```
?           Display help
q           Close window
o           Toggle ordering of messages
t           Filter by tag
E           Edit current search
Z           Toggle tree view
U           Unthreaded view
+           Add tag
-           Remove tag
g           Refresh view
G           Notmuch sync with POP3 and IMAP servers
r           Reply to sender
R           Reply to all
m           Compose new message
C-u m       Compose new message, ask for sender first
```

Notmuch E-Mail / view single message or thread of messages

```
?           Display help
q           Close window
r           Reply to sender
R           Reply to all
f           Forward message
e           Resume editing of draft
+           Add tag
-           Remove tag
w           Save all attachments
m           Compose new message
C-u m       Compose new message, ask for sender first
C-c C-l     Goto next HTTP url
C-c C-o     Open URL at point
```

Notmuch E-Mail / new message composition

```
C-c C-b     Go to body
C-c C-f C-s Go to Subject: header field
C-c C-f C-t Go to To: header field
C-c C-f C-c Go to Cc: header field
C-c C-f C-b Go to Bcc: header field
C-x C-s     Save (as draft)
C-c C-c     Send and exit
C-c C-s     Send
C-c C-d     Don't send and exit
C-c t       Replace contents with mail template
C-c C-a     Add attachment
To remove an attachment just delete the markup from the message body.
```

Python (with [Elpy](https://elpy.readthedocs.io) and
[auto-virtualenv](https://github.com/marcwebbie/auto-virtualenv))

```
C-c M-c     Launch Python shell
C-c C-z     Switch to shell buffer
C-c C-c     Eval function at point
C-c C-k     Eval whole buffer
C-c C-x     Clear REPL output
C-c C-q     Quit shell
```

JavaScript (js2-mode with [Indium](https://indium.readthedocs.io/en/latest/))

```
C-c M-c     Launch REPL, connect to Chrome or Node
C-c C-z     Switch to REPL buffer
C-c C-c     Eval function at point
C-c C-k     Eval whole buffer
C-c C-e     Eval previous statement
C-c C-x     Clear REPL output
C-c C-q     Quit REPL connection
```
