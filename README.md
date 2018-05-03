# TinTin-MUME
A collection of TinTin++ scripts for [MUME](http://mume.org "MUME Home Page"),
forked from <https://github.com/nstockton/tintin-mume>.

**Work in Progress.**

Since speed is important to play mume, these scripts implement
a modal system reminiscent of vim:
- In _quick_ mode, it is not needed to hit `enter`, each key press
  executes an action directly. This is the mainly used mode.
- In `writing` mode, one must hit enter to execute the action. This
  mode should be used sporadically, to set up variables, write emotes,
  etc.
- The macro `w` is used to switch from the `quick` mode to the
  _writing_ mode and versa.
- As in vim, the letters `h`,`j`,`k`,`l` define directions. `u` and
  `n`, are directions up and down.
- A targetting system is implemented: Use `t[a|d|p|o|m|t|w|z]` to target
  animal, dunlending, plant, orc\*, man\*, troll\*, woman\*, zaugurz\*.
  Or `t mytarget` in writing mode.

## Installation ##

You will need tintin++: <https://tintin.sourceforge.net>.

The scripts are supposed to be used with the Mume-mapperproxy by
Nstockton: <https://github.com/nstockton/mume-mapperproxy>.
The makefile can install it with the command `make mapperproxy`

### Usage ###

This directory contains a sample character file that you should
edit to add your character name, password, default wimpy, and
to configure the scripts to load. Once done, you can play with:
    tt++ my_char.tt

## Aliases ##

The following aliases are available both in the _quick_
and _writing_ modes.

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

```
a: assist
i: cast quick bolt on target
I: cast bolt on target
J: sneak
m: change mood
M: change weapon
f: flee
q: go
K: kill target
y: toggle light
z: stab
g: kill target
```

### Alertness ###

```
Ap: change alertness paranoid
An: change alertness normal
```

### Care ###

```
ba: bandage
bc: butcher corpse
br: rest
bs: sleep
bt: wake; stand
bu: burn corpse
```

### Cast ###

```
ca: armour
cb: bless
cf: create food
ci: lightning bolt
cl: cure light
cn: change spellcasting normally
cq: change spellcasting quick
cr: create light $sourcelight
ck: list keys to teleport
ct: teleport
cw: create water
c[1-9]: teleport to key number n
```

### Doors ###

```
da[h|j|k|l|u|n]: bar door $direction
db[h|j|k|l|u|n]: bash door $direction
dc[h|j|k|l|u|n]: close door $direction
dn[h|j|k|l|u|n]: knock door $direction
dk[h|j|k|l|u|n]: block door $direction
dl[h|j|k|l|u|n]: lock door $direction
dn[h|j|k|l|u|n]: unbar door $direction
do[h|j|k|l|u|n]: open door $direction
dp[h|j|k|l|u|n]: pick door $direction
dr[h|j|k|l|u|n]: break door $direction
du[h|j|k|l|u|n]: unlock door $direction
dh: pick chest; open chest; look in chest
```

### Drink ###

```
dw: drink water
```

### Escape ###

```
e[h|j|k|l|u|n]: escape direction
```

### Get ###

```
Ga: get all corpse
Gc: get all.coins all.corpse
Gl: look in corpse
G[1-9]: look in number.corpse
```

### Hide ###

```
Hq: hide quick
Ht: hide thorough
```

### Leader ###

```
Lb: toggle backride on
Lc: cast 'cure light' $leader
Lf: follow
Ln: leader none
Lp: protect leader
Lr: rescue leader
Ls: follow self
Lt: tell leader
Lw: wake leader
Lx: examine leader
```
### Look ###

```
LL: look; exit
```

### Path ###

```
p: show the path
pd: show the path to death mark
pg: get the label of the current room
pk: mark the current room
pm: show the path to the last marked room
pr: rund to dest
ps: show the path
```

### Ride ###

```
ra: aba
rb: ride behind $leader
ri: ride
rl: lead mount
rz: stand; lead; ride
```

### Track ###

```
r: track
rr: track
rh: track horse
r[o|m|t|w|]: track orc\*, man\*, troll\*
rv: track $target
```

#### score, search, scout ###

```
sc: score, stat
sa: look around
sf: flush quick
sq: reveal quick
st: reveal thorough
sr: seek rivendell
s[h|j|k|l|u|d]: scout $direction
S[h|j|k|l||u|d]: search direction
```

### Target, time ###

```
t: target %1
t[a|d|p}]: target animal, dunlending, plant
t[m|o|t|w|z]: target man\*, orc\*, troll\*, woman\*, zaugurz\*
tx: exam $target, cons $target
ti: increase the target number
tr: reset the target number to 1
t[1-9]: set the target number 

ts: time short
```

### Kill ###

```
v: kill %1
v[a|d|p]: kill animal, dunlending, plant
v[m|o|t|w|z]: kill man\*, orc\*, troll\*, woman\*, zaugurz\*
vf: kill $found
vv: kill $arrived
vl: label opponent l, target l
vi: increase target number, kill $target
vr: reset target number, kill $target
```

### Mode ###

```
w: toggle _writing_ mode on or off
```

#### Xp, exam ###

```
xa: report all information
xp: show xp
xn: report tnl
xs: report score
xt: show tp

xx: exam target
```

