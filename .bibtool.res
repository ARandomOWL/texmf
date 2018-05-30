delete.field = {file}
preserve.key.case = {on}
sort = {on}
### URL Rewrites
# Replace '{\_}', '{_}' and '\_' with '_'
rewrite.rule = {url # "{\\_}\|{_}\|\\_" # "_"}
# Replace '{'$\sim$'}', '$\sim$' or '{~}' with '~'
rewrite.rule = {url # "{$\\sim$}\|$\\sim$\|{~}" # "~"}
