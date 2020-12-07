check.double = {on}
delete.field = {file}
delete.field = {annote}
delete.field = {abstract}
delete.field = {mendeley-tags}
preserve.key.case = {on}
sort = {on}
### URL Rewrites
# Replace '{\_}', '{_}' and '\_' with '_'
rewrite.rule = {url # "{\\_}\|{_}\|\\_" # "_"}
# Replace '{'$\sim$'}', '$\sim$' or '{~}' with '~'
rewrite.rule = {url # "{$\\sim$}\|$\\sim$\|{~}" # "~"}
# Remove braces from month field
rewrite.rule = {month # "{\|}" # ""}
