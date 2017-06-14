:%s/\([^ ]\+\)\%u2014\n\([^ ]\+\)/\r\1\2/g
:%s/\([^ ]\+\)[-«»"]\n\([^ ]\+\)/\r\1\2/g
:%s/\%u2014/-/g
:%s/\%u201a/,/g
:%s/]/J/g
:%s/O1/Öl/g
:%s/Ols/Öls/g
:%s/'a'/ä/g
:%s/\$/s/g
:%s/é/e/g
:%s/d1/ch/g
:%s/\([a-zA-Z]\)1\([a-zA-Z]\)/\1i\2/g
:%s/\([a-zA-Z]\)5\([a-zA-Z]\)/\1s\2/g
:%s/2\(\a\|[äöüÄÖÜß]\)/z\1/g
:%s/3\([a-z]\)/s\1/g
:%s/2u/zu/g
:%s/nidit/nicht/g
:%s/sdi/sch/g
:%s/audi/auch/g
:%s/2. B./z. B./g
:%s/0\([a-z]\)/o\1/g
:%s/und\./und/g
:%s/Sidi/sich/g
:%s/Lufl/Luft/g
:%s/lidi/lich/g
:%s/Krafl/Kraft/g
:%s/afl/aft/g
:%s/äfl/äft/g
:%s/äff/äft/g
:%s/saff/saft/g
:%s/Kraff/Kraft/g
:%s/Luff/Luft/g
:%s/ruff/ruft/g
:%s/stofl/stoff/g
:%s/ off / oft /g
:%s/afi/aft/g
:%s/äfi/äft/g
:%s/Ol\([^i]\)/Öl\1/g
:%s/fce/fte/g
:%s/ﬂ/fl/g
:%s/ﬁn/fin/g
:%s/ﬁl/fil/g
:%s/aﬁ/aft/g
:%s/äﬁ/äft/g
:%s/oﬁ/off/g
:%s/Luﬁ/Luft/g
:%s/ﬁ/fi/g
:%s/ii/ü/g
:%s/breüg/breiig/g
:%s/[’‘]c/t/g
:%s/[’‘]sch/'sch/g
:%s/[’‘<>\\{}]//g
:%s/\([^.?!]\) Zu\([ \n]\)/\1 zu\2/g
:%s/rnit/mit/g
:%s/aff /aft /g
:%s/nng/ung/g
:%s/ dern / dem /g
:wq