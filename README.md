Pariemacs
========

Pariemacs consists of major modes for hacking libpari and GP scripts
in Emacs, written and maintained by Olivier Ramaré[1].  This
repository contains my personal changes, some of which may be
incorporated upstream in due course, and some will not.  The biggest
changes are to the build system, which has been changed to make it
easy to upgrade using [el-get](http://www.emacswiki.org/emacs/el-get).
Simply put the following file into your `el-get-user/recipes` folder,
run `M-x el-get-install pariemacs` and you're done:

```
(:name pariemacs
       :website "https://github.com/mhsiah/pariemacs"
       :description "Emacs integration for Pari/GP"
       :type github
       :pkgname "mhsiah/pariemacs")
```

The [upstream
branch](https://github.com/mhsiah/pariemacs/tree/upstream) mirrors
Olivier's code; the [master
branch](https://github.com/mhsiah/pariemacs/tree/master) includes my
changes.

[1] http://math.univ-lille1.fr/~ramare/ServeurPerso/GP-PARI/

