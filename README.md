A collection of LaTeX packages -- some packaged from tex.se, others my own making.

# Using Acronyms
In the document preamble, include:

`\usepackage{eee-acronyms}`

This uses the `acronym` CTAN package to define some commonly used acronyms.
Write these acronyms in your document by writing, for example, `\ac{RAM}`. For
more `acronym` commands, see the documentation at
https://www.ctan.org/pkg/acronym. Pass the `list` option to add a list of used
acronyms to the end of the document.

The package `acronym-cap` provides capitalised versions of the commands from
`acronym`. Eg. `\Ac`, `\Acp`, etc. **NB:** as of `acronym` v1.42, `acronym-cap`
is now obsolete. `acronym-cap` still works for older versions of `acronym`, but
will not load for newer versions. Refer to the `acronym` manual.

Loading the package `acronym-abstract` will rewrite `acronym` commands within
the abstract environment to spell out the whole acronym (ie. translates `\ac`
to `\acl`).

`acronym-alwayslong` provides the command `\acronymalwayslong` which forces the
long version of the specified acronym throughout the document. ie. it converts
`\ac` to `\acl` for the specified acronym only. The short form will not appear
in the document.
