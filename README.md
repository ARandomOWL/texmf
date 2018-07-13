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
`acronym`. Eg. `\Ac`, `\Acp`, etc.

Loading the package `acronym-abstract` will rewrite `acronym` commands within
the abstract environment to spell out the whole acronym (ie. translates `\ac`
to `\acl`).
