# TinTin-MUME
A collection of TinTin++ scripts for [MUME](http://mume.org "MUME Home Page"),
forked from <https://github.com/nstockton/tintin-mume>.

**Work in Progress.**

Since speed is important to play mume, these scripts implement
a modal system reminiscent of vim:
- In _quick_ mode, it is not needed to hit `enter`, each key press
  executes an action directly. This is the mainly used mode.
- In `writing` mode, one must hit enter to execute the action. This
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
The makefile can install it with the command `make mapperproxy`.

### Usage ###

This directory contains a sample character file that you should edit
to add your character name, password, default wimpy, and to configure
the scripts to load. Once done, you can play with:

```sh
    tt++ my_char.tin
```

## Aliases ##

Some aliases are supposed to be used from the character file to set up
some variables:
```
setweapon weapon1 weapon2 # to quickly switch from one to the other
setlight sourcelight # The scripts toggle light on or off automatically.
```

The following aliases are available both in the _quick_ and _writing_
modes.

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
g: go
i: cast quick 'lightning bolt' $target
I: cast 'lightning bolt' $target
J: go (see below)
K: kill target
m: change mood
M: change weapon
N: sneak
q: kill $target
y: toggle light # set up you light source with `setlight`
z: backstab $target
```

The `J` alias (or `go` in _writing_ mode), is a special command which
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

### Cast ###

Offensive spells are casted against $target.

```
ca: armour
cb: bless
cf: create food
ch: cast 'locate life' character_name # locate current location
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

To teleport easily, all the keys given by _locate life_ are recorded.
`ck` will list those recorded keys, and `ct 2` will teleport you to
the second key in that recorded list. A label can be added to a
recorded key with the command `keyl 3 my_label`. The list of keys can
be deleted (cleared) with `keyc`, while `keyd 4` will delete the key
number 4, and `keyd 2 6` will delete keys 2, 3, 4, 5 and 6.

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
ga: get all corpse
gc: get all.coins all.corpse
gf: get all (from floor)
gl: look in corpse
g[1-9]: look in number.corpse
```

### Hide ###

```
Hq: hide quick
Ht: hide thorough
```

### Leader ###

The long alias `leader leader_name` can be used to set up your
leader. The leader name is also automatically set when someone
beckons you to follow.

When a leader is set up, `autoride` is toggled on and you will mount
and lead automatically. To toggle it off, enter  `autoride`.
Similarly to `autoride`, you can use `backride` to automatically ride
behind your leader.

```
Lb: toggle backride on or off
Lc: cast 'cure light' $leader
Lf: follow $leader
Ln: set leader to none
Lp: protect $leader
Lr: rescue $leader
Ls: follow self
Lt: tell $leader
Lw: wake $leader
Lx: examine $leader
```

### Look ###

```
LL: look; exit
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
ps: set and show the path to %1
pd: show the path to death mark
pf: search for label %1
pl: get the label of the current room
pk: mark the current room
pm: show the path to the last marked room
pr: run to recorded destination
pg: go one step toward recorded destination
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
```

#### Score, search, scout ###

```
sc: score, stat
sa: look around
sf: flush quick
sq: reveal quick
st: reveal thorough
sr: seek rivendell
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

You can target something in _writing_ mode with `v something`. From
the _quick_ mode, simply type `wv something`. Once your target is set,
all offensive commands (spells, backstab, bash, hit, etc.), will
target it.

You can specify the target number with `t[1-9]`, increase that number
with `vi` or reset it to 1 with `vr`.

```
v: target %1
vb: target assassin, brigand, bandit, smuggler, thief
v[a|d|p|s]: target animal, dunlending, plant, shadow
v[m|o|t|w|z]: target man*, orc*, troll*, woman*, zaugurz*
vl: label the target `l`, target `l`.
vx: exam $target, cons $target
vi: increase the target number
vr: reset the target number to 1
v[1-9]: set the target number 
```

### Mode ###

```
Space: switch to _writing_ mode.
Tab: switch to _quick_ mode.
```

#### Xp, exam ###

```
xa: report xp and tp
xp: show xp
xn: report xp till next level
xs: report score
xt: show tp

xx: exam target
```

