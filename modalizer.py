#/usr/bin/env python
"""
Compile a list of aliases into a set of macros.
    #alias {abc} {blah blah}
becomes:
    #macro {a} {#if {"$MODE" == "" } {mode a}};
    #macro {b} {#if {"$MODE" == "a" } {mode ab}};
    #macro {c} {#if {"$MODE" == "ab" } {abc; mode}};
"""


import sys
if len(sys.argv) < 2:
    sys.exit("Usage: " + sys.argv[0] + " <file> [<file>]")

import re

#dictionary of macros, containing list functions
macro={}
modes={}

for f in sys.argv[1:]:
    g = open(f, "r").read()
    pattern = re.compile(r'#alias\s{([^}]*)}')
    for alias in re.findall(pattern, g):
        for i in range(len(alias)):
            if alias[i] not in macro:
                macro[alias[i]] = {}
            if i == 0:
                # first letter
                if len(alias)>1:
                    # several letters
                    string = '{"$MODE" == ""} {mode ' + alias[i] + '};'
                else:
                    # single letter
                    string = '{"$MODE" == ""} {' + alias[i] + '; mode};'
            elif i+1 == len(alias):
                # last letter
                string = '{"$MODE" == "' + alias[:i] + '"} {' + alias + '; mode};'
            else:
                # middle letter
                j = i+1
                string = '{"$MODE" == "' + alias[:i] + '"} {mode ' + alias[:j] + '};'
            if string not in macro[alias[i]]:
                macro[alias[i]][alias[:i]] = string

print("#alias {modalmacros} {")
for key in sorted(macro):
    print("\t#macro {" + key + "} {")
    first = True
    for mode in sorted(macro[key]):
        if first:
            print("\t\t#if " + macro[key][mode])
            first = False
        else:
            print("\t\t#elseif " + macro[key][mode])
    print("\t\t#else mode;")
    print("\t};")
print("};")

