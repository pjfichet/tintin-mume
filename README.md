# TinTin-MUME
A collection of TinTin++ scripts for [MUME](http://mume.org "MUME Home Page"),
forked from <https://github.com/nstockton/tintin-mume>.

**Work in Progress.**

Since speed is important to play mume, these scripts implement
several macros system: one use the keypad, one use the alt key,
one use the row of numbers, and another implements a modal system
reminiscent of vim:
- In _quick_ mode, it is not needed to hit `enter`, each key press
  executes an action directly. This is the mainly used mode.
- In _writing_ mode, one must hit enter to execute the action. This
  mode should be used occasionnaly, to set up variables, write emotes,
  etc.
- the bar `Space` toggles the _writing_ mode on, while `Tab` behaves like
  the carriage returns __and__ toggles the _quick_ mode on.
- As in vim, the letters `h`,`j`,`k`,`l` define directions. `u` and
  `n`, are directions up and down.
- A targetting system is implemented: use `v[a|d|p|o|m|t|w|z]` to target
  animal, dunlending, plant, orc\*, man\*, troll\*, woman\*, zaugurz\*.
  Or `v mytarget` in writing mode.

## Installation ##

You will need tintin++: <http://tintin.sourceforge.net>.

The scripts are supposed to be used with the Mume-mapperproxy by
Nstockton: <https://github.com/nstockton/mapperproxy-mume>.
The makefile can install it with the command `make mapper`.

### Usage ###

This directory contains a sample character file that you should edit
to add your character name, password, default wimpy, and to configure
the scripts to load. Once done, if you have correctly set up the
mapper, you can play with:

```sh
    tt++ my_char.tin
```

## Personalization ##

Some aliases are supposed to be used from the character file to set up
some variables:

```
setweapon weapon1 weapon2 # to quickly switch from one to the other
setlight sourcelight # The scripts toggle light on or off automatically.
setrecipient # set your water container, to automatically fill it
```

From the character file, you should also include the aliases you want
to use. By default, only the file _tin/alias\_common.tin_, which
define the most commonly used aliases is included. You may want to
also include _tin/alias\_cleric.tin_ for a cleric, or
_tin/alias\_mage.tin_ for a mage. 

## Macros ##

There are several macro files you may want to include.

### For the numeric keypad ###

If you want your macros to be executed from the numeric
keypad, include _tin/macro\_keypad.tin_.

### For the number row ###

If you want your macros to be executed from the number row,
include _tin/macro\_number.tin_. This file has been made
for an azerty keyboard, but should be easily modified to
suit your own keyboard.

This file implements the alias `action` to set up an action
to execute on [1-9].target, when hitting the corresponding
number. `unaction` will remove these macros. For example,
if you enter `action cast 'blind'` you can blind _3.target_
by hitting `"` (key 3, on an azerty keyboard).

### For the Alt key ###

_tin/macro\_alt.tin_ define macros for the alt key (for
an azerty keyboard).

```
Alt-h: west
Alt-j: south
Alt-k: north
Alt-l: east
Alt-u: up
Alt-n: down
Alt-a: assist
Alt-z: z
Alt-f: flee
Alt-i: i
Alt-q: kill $target
Alt-o: open $door
Alt-c: close $door
```

### For the modal mode ###

To use the modal mode, one must include **both** _tin/modal.tin_ and
the the dedicated macro file he wants. For most characters,
_tin/modal\_common.tin_ is enough. Include _tin/modal\_cleric.tin_
instead for a cleric, or _tin/modal\_mage.tin_ for a mage.

The script _modalizer.py_ is used to generate these files. It takes
as argument a list of files containing aliases, and builts the macros
from those aliases. As a result, the macros are exactly the same
as your aliases.

```
python modalizer.py alias_common.tin > modal_common.tin
python modalizer.py alias_common.tin alias_cleric.tin > modal_cleric.tin
```

You should use that script if you want to set up your own aliases.
Beware that it does not check for errors. For instance, if you define
both the alias `abc` and the alias `abcd`, only the macro `abc` will
work.


## Aliases ##

### Mode ###

```
Space: switch to _writing_ mode.
Tab: switch to _quick_ mode.
```

### Directions ###

```
h: west
j: south
k: north
l: east
u: up
n: down
```

### Important ###

These single letter aliases are for the most frequently done actions.
You may need to overwrite those aliases to suit your character and
playstyle.

```
a: assist
f: flee
i: blind for clerics, bolts for mages.
z: stab for scouts, bolts for clerics, quake for mages.
m: change mood
M: change weapon
q: kill $target
,: go
```

The `,` alias (or `go` in _writing_ mode), is a special command which
behaves differently depending on the situation:
- By default, it moves one step toward the pre-defined destination
  (see the path section below),
- When tracking, it follows the track,
- When fleeing, it comes back to where you fled from,
- When your victim flees, it follows it.

### Alertness ###

```
Ap: change alertness paranoid
An: change alertness normal
```

### Bash ###

```
bb: bash assassin, brigand, bandit, smuggler, ruffian, thief
b[a|d|p]: bash animal, dunlending, shadow, plant
b[m|o|t|w|z]: bash man*, orc*, troll*, woman*, zaugurz*
bs: bash skeleton, spirit, soldier
bv: bash $target
bk[a-l]: bash target labelled k[a-l]
bl: label target and bash it.
bq: bash (when engaged)
bi: bash next.target 
br: bash 1.target
b[1-9]: bash [1-9].$target 
```

### Cast ###

Offensive spells begining by `c` are not casted against any target,
and should only be used when engaged.

#### Common spells ####

Common spells are defined in the file _tin/alias\_common.tin_.
Spells for clerics and mages are defined in the files
_tin/alias\_cleric.tin_ and _tin/alias\_mage.tin_.

```
cb: bless
cf: create food; eat mushroom.
cl: cure light
cn: change spellcasting normally
cq: change spellcasting quick
cw: create water
```

#### Cleric spells ####

```
ca: armour
cc: cure critic
cd: shield
ce: dispel evil
ch: heal
ci: blind
cm: summon
cn: cure blindness
co: word of recall
cp: remove poison
cr: breath of briskness
cs: cure serious
ct: strength
cy: sanctuary
cz: lightning bolt

c[1-9]: blind [1-9].target
[&é"'(-è_ç]: blind [1-9].target
```

#### Mage spells ####

To teleport easily, all the keys given by _locate life_ are recorded.
`ck` will list those recorded keys, and `ct 2` will teleport you to
the second key in that recorded list. A label can be added to a
recorded key with the command `keyl 3 my_label`. The list of keys can
be deleted (cleared) with `keyc`, while `keyd 4` will delete the key
number 4, and `keyd 2 6` will delete keys 2, 3, 4, 5 and 6.

```
ca: armour
ci: lightning bolt
cr: create light lantern
ck: list teleport keys
ch: locate current room (with locate life $character_name)
ct: teleport %1
c[1-9]: teleport to key 1-9
```


### Doors ###

```
da[h|j|k|l|u|n]: bar door $direction
db[h|j|k|l|u|n]: bash door $direction
dc[h|j|k|l|u|n]: close door $direction
dg[h|j|k|l|u|n]: knock door $direction
dk[h|j|k|l|u|n]: block door $direction
dl[h|j|k|l|u|n]: lock door $direction
dn[h|j|k|l|u|n]: unbar door $direction
do[h|j|k|l|u|n]: open door $direction
dp[h|j|k|l|u|n]: pick door $direction
dr[h|j|k|l|u|n]: break door $direction
du[h|j|k|l|u|n]: unlock door $direction
d[abcgklnopru]d: bar|bash|close|knock|block|lock|unbar|open|pick|break|unlock $doorname

dh: pick chest; open chest; look in chest
```

### Drink ###

```
dw: drink water; pour water $recipient
df: drink $recipient (flagon, flask...);
```

### Emotes ###

Emotes should be defined within the character file.

```
eb: ebow (eemote bows swiftly.)
ed: edie (eemote dies, with a sigh.)
ef: eflee (eemote shouts "FLEE !")
eh: ehair (eemote 's long hair flow on the wind.)
ei: eintriguing (eemote raises an eyebrow, surprised.)
el: elaugh (eemote laughs with joy.)
es: esmile (eemote smiles with amuzement.)
en: eno (eemote does not seem to agree.; say no)
ey: eyes (eemote nods softly; say yes)
```

### Get ###

```
gaa: get all
gac: get all corpse
gap: get all.coins (pennies) all.corpse
gam: gap; get all.metal all.corpse; get all.sword all.corpse
gal: look in corpse
```

### Group ###

The long alias `leader leader_name` can be used to set up your
leader. The leader name is also automatically set when someone
beckons you to follow.

When a leader is set up, `autoride` is toggled on and you will mount
and lead automatically. To toggle it off, enter  `autoride`.
Similarly to `autoride`, you can use `backride` to automatically ride
behind your leader.

```
gb: toggle backride on or off
gcb: cast 'bless' $leader
gcl: cast 'cure light' $leader
gf: follow %1
gl: label %1
gn: set leader to none
gp: protect $leader
gr: rescue $leader
gs: follow self
gt: tell group %0
gw: wake $leader
gx: examine $leader
```

Clerics also have the following aliases:

```
gcc: cure critic $leader
gch: heal $leader
gcn: cure blindness $leader
gcp: remove poison $leader
gcs: cure serious $leader
gct: strength $leader
gcy: sanctuary $leader
```

### Hide ###

```
Hq: hide quick
Ht: hide thorough
```

### Look ###

```
LL: look; exit
```

### Order to follower ###

Once you have set up your follower with `follower follower_name`,
you can use the following aliases:

```
oa: ask $follower assist
ob: bandage $follower
ocb: bless $follower
ocl: cure light $follower
oh: ask $follower health
om: ask $follower moves
or: ask $follower ride %1
ot: ask $follower time
ox: examine $follower
```

Clerics also have the following aliases:

```
occ: cure critic $follower
och: heal $follower
ocl: cure light $follower
ocn: cure blindness $follower
ocp: remove poison $follower
ocs: cure serious $follower
ocy: sanctuary $follower
```

### Path ###

These commands use the path finding capacities of the mapperproxy.
To set up a path use `ps label`, where label is the label given to
a room. The list of labels is in *data/rooms_labels.json*. The label
of the current room can be obtained with `pl`. You can also search
for a label name with `pf expr`.

Once you have set up a path, you can walk one step toward your
destination with `pg`, run toward that direction with `pr`, or show
the whole path with `ps`.

`pk` puts a mark on a room. `pm` shows the path to that room and
sets your default destination to that mark.

A mark is automaticaly put on the room you die on, so you can find
the path to that room, and set it as your default destination  with
`pd`.

```
pd: show the path to death mark
pf: search for label %1
pg: go one step toward recorded destination
pk: mark the current room
pl: get the label of the current room
pm: show the path to the last marked room
pp: set and show the path to %1
pr: run to recorded destination
ps: stop running
```

### Ride ###

```
ra: aba
rk: ride behind $leader (set backride on)
ri: ride
rl: lead mount
rz: stand; lead; ride
```

### Rest ###

```
rb: bandage
rc: butcher corpse
re: rest
rs: sleep
rt: wake; stand
ru: burn corpse
ry: toggle light on or off.
```

#### Score, search, scout, sneak###

```
sc: score, stat
sa: look around
sf: flush quick
sg: reveal ginseng
sq: reveal quick
sr: seek rivendell
ss: sneak
st: reveal thorough
s[h|j|k|l|u|d]: scout direction
S[h|j|k|l|u|d]: search direction
```

### Time ###

On login, you should have a look at a clock to synchronise with the
game time. Then, you can use `ti` to print the time.

```
ti: time short
```

### Track ###

In _quick_ mode, you will usually track you current target with `tv`
(see the targetting system below), or simply `track` with `tr`. To
track a specific target you can use `tr target` in the _writing_ mode.
From the _quick_ mode, you can use `wtr target`.

```
tr: track
th: track horse
t[m|o|t|w|z]: track man*, orc*, troll*, woman*, zaugurz*
tv: track $target
```

### Target ###

You can target something in _writing_ mode with `vv something`. From
the _quick_ mode, type `<space>vv something` instead. Once your target
is set, all offensive commands (spells, backstab, bash, hit, etc.),
will target it.

You can specify the target number with `v[1-9]`, increase that number
with `vi` or reset it to 1 with `vr`.

```
vv: target %1
vb: target assassin, brigand, bandit, smuggler, ruffian, thief
v[a|d|h|p]: target animal, dunlending, plant
v[m|o|t|w|z]: target man, orc, troll, woman, zaugurz
vv[m|o|t|w|z]: target man*, orc*, troll*, woman*, zaugurz*
v[g|h|j]: set target [g|h|j]
vf: target $found
vs: target wraith, shadow, spirit, soldier, skeleton
vk: label the target `k`, target `k`.
vl: label the target `l`, target `l`.
vx: exam $target, cons $target
vi: increase the target number
vr: reset the target number to 1
v[1-9]: set the target number 
vl: label current target
vk[a-i]: target label k[a-i]
```


#### Xp, exam ###

```
xa: report xp and tp
xp: show xp
xr: report xp till next level
xs: report score
xt: show tp

xx: exam target
```

### Shoot ###

```
ya: recover all
yf: shoot; flee
yg: go; shoot; flee
yq: shoot (when engaged)
yr: recover
yy: shoot $target
```
