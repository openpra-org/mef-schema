## SAPHIRE Version 7 MAR-D Data Interchange Formats

| File Extension | Data Name / Type Description                                                                                  | Lexer/Parser Support | Verified Examples |
|:--------------:|:--------------------------------------------------------------------------------------------------------------|:--------------------:|:-----------------:|
| `.FAD`         | Project Names and Descriptions                                                                                |                      |                   |
| `.FAA`         | Project Attribute File                                                                                        |                      |                   |
| `.FAY`         | Project Recovery Rules                                                                                        |                      |                   |
| `.FAS`         | System (Fault Tree) Recovery Rules                                                                            |                      |                   |
| `.FAP`         | Project Partition Rules                                                                                       |                      |                   |
| `.FAT`         | Project Textual Information                                                                                   |                      |                   |
| `.BED`         | Basic Event Names and Descriptions                                                                            |                      |                   |
| `.BEI`         | Basic Event Rate Information                                                                                  |                      |                   |
| `.BEA`         | Basic Event Attribute Codes                                                                                   |                      |                   |
| `.BET`         | Basic Event Transformations                                                                                   |                      |                   |
| `.BEC`         | Basic Event Compound Information (Version 7 only)                                                             |                      |                   |
| `.FMD`         | Failure Mode Descriptions                                                                                     |                      |                   |
| `.CTD`         | Component Type Descriptions                                                                                   |                      |                   |
| `.STD`         | System Type Descriptions                                                                                      |                      |                   |
| `.LCD`         | Location Descriptions                                                                                         |                      |                   |
| `.TTD`         | Class Attribute Descriptions                                                                                  |                      |                   |
| `.FTD`         | Fault Tree Names and Descriptions                                                                             |                      |                   |
| `.DLS`         | Fault Tree Graphics (binary, DLS format)                                                                      |                      |                   |
| `.FTL`         | Fault Tree Logic                                                                                              |                      |                   |
| `.FTC`         | Fault Tree Cut Sets                                                                                           |                      |                   |
| `.FTA`         | Fault Tree Attributes                                                                                         |                      |                   |
| `.FTY`         | Fault Tree Recovery Rules                                                                                     |                      |                   |
| `.FTT`         | Fault Tree Textual Information                                                                                |                      |                   |
| `.PID`         | Fault Tree Graphical P&ID (binary, PID format)                                                                |                      |                   |
| `.ETD`         | Event Tree Names and Descriptions                                                                             |                      |                   |
| `.ETA`         | Event Tree Attributes                                                                                         |                      |                   |
| `.ETG`         | Event Tree Graphics                                                                                           |                      |                   |
| `.ETL`         | Event Tree Logic                                                                                              |                      |                   |
| `.ETR`         | Event Tree Rules                                                                                              |                      |                   |
| `.ETT`         | Event Tree Textual Information                                                                                |                      |                   |
| `.ETY`         | Event Tree Recovery Rules                                                                                     |                      |                   |
| `.ETP`         | Event Tree Partition Rules                                                                                    |                      |                   |
| `.ESD`         | End State Names and Descriptions                                                                              |                      |                   |
| `.ESI`         | End State Information                                                                                         |                      |                   |
| `.EST`         | End State Textual Information                                                                                 |                      |                   |
| `.ENC`         | End State Cut Sets                                                                                            |                      |                   |
| `.SQD`         | Sequence Names and Descriptions                                                                               |                      |                   |
| `.SQC`         | Sequence Cut Sets                                                                                             |                      |                   |
| `.SQA`         | Sequence Attributes                                                                                           |                      |                   |
| `.SQL`         | Sequence Logic                                                                                                |                      |                   |
| `.SQT`         | Sequence Textual Information                                                                                  |                      |                   |
| `.SQY`         | Sequence Recovery Rules                                                                                       |                      |                   |
| `.SQP`         | Sequence Partition Rules                                                                                      |                      |                   |
| `.GTD`         | Gate Description                                                                                              |                      |                   |
| `.GTA`         | Gate Attributes                                                                                               |                      |                   |
| `.CSD`         | Change Set Description                                                                                        |                      |                   |
| `.CSI`         | Change Set Information                                                                                        |                      |                   |
| `.CSA`         | Change Set Attributes (Version 7 only)                                                                        |                      |                   |
| `.HID`         | Histogram Description                                                                                         |                      |                   |
| `.HII`         | Histogram Information                                                                                         |                      |                   |
| `.SLD`         | Slice Descriptions                                                                                            |                      |                   |
| `.SLB`         | Slice Basic Events                                                                                            |                      |                   |
| `.SLI`         | Slice Basic Information                                                                                       |                      |                   |
| `.SLA`         | Slice Basic Attributes (Version 7 only)                                                                       |                      |                   |
| `.DNF`         | Sequence Cut Sets (SETS format, disjunctive normal form)                                                      |                      |                   |
| `.SET`         | Fault Tree Logic (SETS format)                                                                                |                      |                   |
| `.DES`         | Basic Event Descriptions (SETS format)                                                                        |                      |                   |
| `.VBK`         | Basic Event Failure Rates (SETS format)                                                                       |                      |                   |

## .FAD — Project Names and Descriptions

**File Name:** `xxxxxx.FAD`  
**File Format:**  
```
name,description[,A]
```
- `name`: 24 character Project name (upper-case alphanumeric, no spaces in the middle)
- `description`: 120 character Project description (can have upper/lower case, no commas)
- `A`: 1 character; if included, indicates alternate description

**General Format Rules:**
- All name references must be upper-case alphanumeric. Lower-case will be converted to upper-case. No spaces in the middle of names.
- Descriptions can have both upper- and lower-case. No commas allowed.
- Commas are used as field delimiters.
- File is standard ASCII text, single spaced.
- `^EOS` signals End of Section.

---

## .FAA — Project Attribute File

**File Name:** `xxxxxx.FAA`  
**File Format:**  
```
project=
name,mission,newSum,co,loc,type,design,vendor,AE,OpDate,QualDate
```
- `name`: 24 character Project name
- `mission`: Floating point, default mission time in hours
- `newSum`: Floating point, new sequence frequency sum
- `co`: 10 character Company name
- `loc`: 16 character Location name
- `type`: 3 character Facility type
- `design`: 10 character Facility design
- `vendor`: 5 character Vendor name
- `AE`: 10 character Architectural Engineer
- `OpDate`: (yyyy/mm/dd) Operational date
- `QualDate`: (yyyy/mm/dd) Qualification date

---

## .FAY — Project Recovery Rules

**File Name:** `xxxxxxxx.FAY`  
**File Format:**  
```
project =
-- recovery rule text --
```
- `project`: 24 character Project name

---

## .FAS — System (Fault Tree) Recovery Rules

**File Name:** `xxxxxxxx.FAS`  
**File Format:**  
```
project =
-- recovery rule text --
```
- `project`: 24 character Project name

---

## .FAP — Project Partition Rules

**File Name:** `xxxxxxxx.FAP`  
**File Format:**  
```
project =
-- partition rule text --
```
- `project`: 24 character Project name

---

## .FAT — Project Textual Information

**File Name:** `xxxxxx.FAT`  
**File Format:**  
```
Project [,A] =
-- text --
```
- `project`: 24 character Project name
- `A`: 1 character; if included, indicates alternate description

---

## .BED — Basic Event Names and Descriptions

**File Name:** `xxxxxx.BED`  
**File Format:**  
```
project =
name,description[,A]
. . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Event primary name
- `description`: 120 character Alphanumeric description
- `A`: 1 character; if included, indicates alternate description

---

## .BEI — Basic Event Rate Information

**File Name:** `xxxxxx.BEI`  
**File Format:**  
```
project =
name, calc, udC, udT, udV, prob, lambda, tau, mission, init, Flag, udV2
. . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Basic event name (mandatory)
- `calc`: 1 character Calculation type (see manual for codes)
- `udC`: 24 characters Uncertainty correlation class
- `udT`: 1 character Uncertainty distribution type (L, N, B, D, G, C, E, U, H, M, S, O, T)
- `udV`: Floating point Uncertainty distribution value
- `prob`: Floating point Probability value
- `lambda`: Floating point Basic event failure rate per hr.
- `tau`: Floating point Time to repair in hours
- `mission`: Floating point Mission time
- `init`: Boolean Initiating event flag (Y/N)
- `Flag`: 1-character process flag
- `udV2`: Floating point Uncertainty distribution value #2

---

## .BEA — Basic Event Attribute Codes

**File Name:** `xxxxxx.BEA`  
**File Format:**  
```
project =
name,Aname,type,sys,fail,loc,compID,Gname,train,att1,..,att16
. . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Event name (mandatory)
- `Aname`: 24 character Alternate event name
- `type`: 3 character Event component type
- `sys`: 3 character Event component system
- `fail`: 3 character Failure mode
- `loc`: 3 character Component location
- `compID`: 7 character Component ID
- `Gname`: 24 character Event group identifier
- `train`: 3 character Train identifier
- `att1..att16`: Class attribute (Y/N)

---

## .BET — Basic Event Transformations

**File Name:** `xxxxxx.BET`  
**File Format:**  
```
project =
name1,level,type
bename1, bename2, . . . ,
. . . , benameN
^EOS
name2,level,type
bename1, bename2, . . . ,
. . . , benameN
^EOS
```
- `project`: 24 character Project name
- `name`: 24 character Event name
- `level`: 3 character Transformation level (0..99)
- `type`: 4 character Transformation type (AND, OR, ZOR, blank)
- `bename1..N`: 24 character Event name

---

## .BEC — Basic Event Compound Information (Version 7 only)

**File Name:** `xxxxxx.BEC`  
**File Format:**  
```
project =
name1,level,type
bename1, bename2, . . . ,
. . . , benameN
^EOS
name2,level,type, library, procedure
bename1, bename2, . . . ,
. . . , benameN
^EOS
```
- `project`: 24 character Project name
- `name`: 24 character Event name
- `level`: 3 character (0 or blank)
- `type`: 4 character (COM)
- `library`: 60 character name of plug in library
- `procedure`: 60 character name of procedure from plug in library
- `bename1..N`: 24 character Event name

---

## .FMD — Failure Mode Descriptions

**File Name:** `xxxxxx.FMD`  
**File Format:**  
```
project =
fail,altFail,description[,A]
. . . , . . .
```
- `project`: 24 character Project name
- `fail`: 5 character Failure mode primary identifier
- `altFail`: 5 character Failure mode alternate identifier
- `description`: 120 character Failure mode description
- `A`: 1 character; if included, indicates alternate description

---

## .CTD — Component Type Descriptions

**File Name:** `xxxxxx.CTD`  
**File Format:**  
```
project =
comp, altComp, description [,A]
. . . , . . .
```
- `project`: 24 character Project name
- `comp`: 5 character Component type primary identifier
- `altComp`: 5 character Component type alternate identifier
- `description`: 120 character Component type description
- `A`: 1 character; if included, indicates alternate description

---

## .STD — System Type Descriptions

**File Name:** `xxxxxx.STD`  
**File Format:**  
```
project =
sys,altSys,description[,A]
. . . , . . .
```
- `project`: 24 character Project name
- `sys`: 5 character System primary identifier
- `altSys`: 5 character System alternate identifier
- `description`: 120 character System description
- `A`: 1 character; if included, indicates alternate description

---

## .LCD — Location Descriptions

**File Name:** `xxxxxx.LCD`  
**File Format:**  
```
project =
loc,altLoc,description[,A]
. . . , . . .
```
- `project`: 24 character Project name
- `loc`: 5 character Location primary identifier
- `altLoc`: 5 character Location alternate identifier
- `description`: 120 character Location description
- `A`: 1 character; if included, indicates alternate description

---

## .TTD — Class Attribute Descriptions

**File Name:** `xxxxxx.TTD`  
**File Format:**  
```
project =
attr,altAttr,description[,A]
. . . , . . .
```
- `project`: 24 character Project name
- `attr`: 5 character Class attribute primary name
- `altAttr`: 5 character Class attribute alternate name
- `description`: 120 character Class attribute description
- `A`: 1 character; if included, indicates alternate description

---

## .FTD — Fault Tree Names and Descriptions

**File Name:** `xxxxxx.FTD`  
**File Format:**  
```
project =
name,description[,s][,A]
. . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Fault tree primary name
- `description`: 120 character Fault tree description
- `s`: 1 character; if included, indicates fault tree is a sub-tree
- `A`: 1 character; if included, indicates alternate description

---

## .DLS — Fault Tree Graphics

**File Name:** `xxxxxx.DLS`  
**File Format:**  
- IRRAS 2.5/4.0/5.0, SAPHIRE 6.0/7.0 Fault Tree Graphics file (DLS format, binary)
- Loaded and output as is, no conversion performed

---

## .FTL — Fault Tree Logic

**File Name:** `xxxxxx.FTL`  
**File Format:**  
```
project, fault tree =
* gatename1,description
gatename1 gatetype input1 input2 . . . inputn
. . . . . . . . . . . . . . .
* gatenamen,description
gatenamen gatetype input1 input2 . . . inputn
. . .
```
- `project`: 24 character Project name
- `fault tree`: 24 character Fault tree name
- `gatename`: 24 character Gate name
- `gatetype`: 4 character Gate type (AND, OR, TBL, TRAN, NAND, NOR, N/M, CONT)
- `input`: 24 character inputs to the gate (event or gate names)
- `description`: 120 character gate name descriptions included as comment

**General Rules:**
- A gate definition cannot exceed 255 characters (use CONT gate to break up definitions)
- A line beginning with an asterisk (*) is a comment
- For each gate name a comment should be included giving the gate description

---

## .FTC — Fault Tree Cut Sets

**File Name:** `xxxxx.FTC`  
**File Format:**  
```
project, fault tree, analysis =
eventname * eventname +
eventname * eventname * eventname *
eventname +
eventname * eventname.
^EOS
project, fault tree2 =
```
- `project`: 24 character Project name
- `fault tree`: 24 character Fault tree name
- `analysis`: 1 character Analysis type (1=Random, 2=Fire, 3=Flood, 4=Seismic, 5-8=Reserved, 9-16=User-defined)
- `eventname`: 24 character Event names in the cut set

**General Rules:**
- Asterisk (*) separates cut set events. Spaces are ignored.
- Plus sign (+) separates cut sets.
- Period (.) denotes the end of a sequence.
- Slash (/) precedes complemented events.
- Event names max 24 characters including "/".
- Line beginning with * is a comment.

---

## .FTA — Fault Tree Attributes

**File Name:** `xxxxx.FTA`  
**File Format:**  
```
project, analysis =
name,level,mission,mincut,proCut,sample,seed,sizCut,sys,cuts,events,value1,..,value9
. . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . , . . . ,
```
- `project`: 24 character Project name
- `analysis`: 1 character Analysis type (see .FTC)
- `name`: 24 character Fault tree name
- `level`: Integer 2 (0 = top level tree)
- `mission`: Floating point Mission time
- `mincut`: Floating point Mincut upper bound
- `proCut`: Floating point Probability cut off value
- `sample`: Integer 4 Sample size
- `seed`: Integer 8 Random number seed
- `sizCut`: Integer 2 Size cut off value
- `sys`: 3 character System identifier
- `cuts`: Integer 5 Base number of cut sets
- `events`: Integer 5 Base number of events
- `value1..9`: Floating point Base uncertainty values

---

## .FTY — Fault Tree Recovery Rules

**File Name:** `xxxxxxxx.FTY`  
**File Format:**  
```
project =
-- recovery rule text --
```
- `project`: 24 character Project name

---

## .FTT — Fault Tree Textual Information

**File Name:** `xxxxxx.FTT`  
**File Format:**  
```
project, fault tree [,A]=
-- text --
^EOS
project, fault tree2 =
. . .
```
- `project`: 24 character Project name
- `fault tree`: 24 character Fault tree name
- `A`: 1 character; if included, indicates alternate text

---

## .PID — Fault Tree Graphical P&ID

**File Name:** `xxxxxxxx.PID`  
**File Format:**  
- IRRAS 4.0/5.0, SAPHIRE 6.0 and 7.0 P&ID Graphics file (PID Format, binary)
- Loaded and output as is; no conversion performed

---

## .ETD — Event Tree Names and Descriptions

**File Name:** `xxxxxx.ETD`  
**File Format:**  
```
project =
name,description[,s][,A]
. . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Event tree name
- `description`: 120 character Event tree description
- `s`: 1 character; if included, indicates event tree is a transfer tree
- `A`: 1 character; if included, indicates alternate description

---

## .ETA — Event Tree Attributes

**File Name:** `xxxxxx.ETA`  
**File Format:**  
```
project =
name,init
. . . , . . .
```
- `project`: 24 character Project name
- `name`: 24 character Event tree name
- `init`: 24 character Initiating Event

---

## .ETG — Event Tree Graphics

**File Name:** `xxxxxx.ETG`  
**File Format:**  
- See file format for the Event Tree Logic (.ETL)

---

## .ETL — Event Tree Logic

**File Name:** `xxxxxx.ETL`  
**File Format:**  
```
project, event tree, init event [,T] =
^TOPS
* 1 | 2 | 3 | 4 | 5 | this is a comment
ABCDE BCDEF CDEFG DEFGH EFGHI
^LOGIC
+1 +2 3 +4 +5
5
4 5
2 +3 4 5
3 +4 +5
5
4 5
1 +2 3 4 5
2 +3 +4 5
4 5
4 5
4 5
3 4 5
^SEQUENCES
Y/N, header#1, Y/N, header#2, ...
Y/N, sequence#1, Y/N, end state#1, ...
...
^TEXT
SIZE s
JUST j
COLOR j
XY xvalue,yvalue
"120 character line of text"
...
^PARMS
START yvalue
WINDOW x1,y1,x2,y2
HEADER x1,x2,x3,x4
^EOS
project, event tree2 =
(additional event trees)
```
- See manual for detailed field definitions and rules.

---

## .ETR — Event Tree Rules

**File Name:** `xxxxxxxx.ETR`  
**File Format:**  
```
project, event tree =
-- event tree rule text
. . .
^EOS
project, event tree2
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name

---

## .ETT — Event Tree Textual Information

**File Name:** `xxxxxx.ETT`  
**File Format:**  
```
project, event tree [,A]=
-- text --
^EOS
project, event tree2 =
-- text --
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `A`: 1 character; if included, indicates alternate description

---

## .ETY — Event Tree Recovery Rules

**File Name:** `xxxxxxxx.ETY`  
**File Format:**  
```
project, event tree =
-- recovery rule text --
^EOS
project, event tree2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name

---

## .ETP — Event Tree Partition Rules

**File Name:** `xxxxxxxx.ETP`  
**File Format:**  
```
project, event tree =
-- partition rule text --
^EOS
project, event tree2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name

---

## .ESD — End State Names and Descriptions

**File Name:** `xxxxxx.ESD`  
**File Format:**  
```
project =
name,description[,A]
. . . , . . .
```
- `project`: 24 character Project primary name
- `name`: 24 character End state primary name
- `description`: 120 character End state description
- `A`: 1 character; if included, indicates alternate description

---

## .ESI — End State Information

**File Name:** `xxxxxx.ESI`  
**File Format:**  
```
project =
Name, E-QMethod, E-QPasses, R-QMethod, R-QPasses,
. . . . . , . . . . . . ., . . . . . . ., . . . . . . . ., . . . . . . .,
```
- `project`: 24 character Project name
- `name`: 24 character End state name
- `e-Qmethod`: 1 character End state default quantification method
- `e-Qpasses`: Integer 3 End state default min/max quantification passes
- `r-QMethod`: 1 character Quantification method used for current results
- `r-Qpasses`: Integer 3 Min/max quantification passes used for current results

---

## .EST — End State Textual Information

**File Name:** `end-state.EST`  
**File Format:**  
```
project, end state[, A]=
-- text --
```
- `project`: 24 character Project name
- `end state`: 24 character End state name
- `A`: 1 character; if included, indicates alternate description

---

## .ENC — End State Cut Sets

**File Name:** `xxxxxx.ENC`  
**File Format:**  
```
project, event tree, end state =
eventname * eventname +
eventname * eventname * eventname *
eventname +
eventname * eventname.
^EOS
project, event tree2, end state =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `end state`: 24 character End state name
- `eventname`: 24 character Event names in the cut set

**General Rules:**
- Asterisk (*) separates events in a cut set. Spaces are ignored.
- Plus sign (+) separates cut sets.
- Period (.) denotes the end of the end state cut sets.
- Slash (/) precedes complemented events.
- Event names max 24 characters including "/".
- Line beginning with * is a comment.

---

## .SQD — Sequence Names and Descriptions

**File Name:** `xxxxxx.SQD`  
**File Format:**  
```
project,eventree =
name,description[,A]
. . . , . . .
^EOS
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `name`: 24 character Sequence name
- `description`: 120 character Sequence description
- `A`: 1 character; if included, indicates alternate description

---

## .SQC — Sequence Cut Sets

**File Name:** `xxxxxx.SQC`  
**File Format:**  
```
project, event tree, sequence, analysis =
eventname * eventname +
eventname * eventname * eventname *
eventname +
eventname * eventname.
^EOS
project, event tree2, sequence2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `sequence`: 24 character Sequence name
- `analysis`: 1 character Analysis type (see .FTC)
- `eventname`: 24 character Event names in the cut set

**General Rules:**
- Asterisk (*) separates events in a cut set. Spaces are ignored.
- Plus sign (+) separates cut sets.
- Period (.) denotes the end of the sequence.
- Slash (/) precedes complemented events.
- Event names max 24 characters including "/".
- Line beginning with * is a comment.

---

## .SQA — Sequence Attributes

**File Name:** `xxxxxx.SQA`  
**File Format:**  
```
project, event tree, analysis =
name,endstate,mincut,mission,procut,sample,seed,size,cuts,
events,value1, . . . ,value9,default flags, used flags
. . . , . . . , . . . , . . . , . . . , . . . , . . . , . . .
^EOS
project, event tree2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `analysis`: 1 character Analysis type (see .FTC)
- `name`: 24 character Sequence name
- `endstate`: 24 character End State name
- `mincut`: Floating point Mincut upper bound
- `mission`: Floating point Mission time in hours
- `procut`: Floating point Probability cut off value
- `sample`: Integer 4 Sample size
- `seed`: Integer 8 Random number seed
- `size`: Integer 2 Size cut off value
- `cuts`: Integer 5 Base number of cut sets
- `events`: Integer 5 Base number of events
- `value1..9`: Floating point Base uncertainty values
- `default flags`: 24 character Default flag set for this sequence
- `used flags`: 24 character Flag set used to generate these cut sets

---

## .SQL — Sequence Logic

**File Name:** `xxxxxxxx.SQL`  
**File Format:**  
```
project, event tree, sequence=
sys1 sys2 /sys3 sys4
. . .
^EOS
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `sequence`: 24 character Sequence name
- `sys`: 24 character Fault tree name

---

## .SQT — Sequence Textual Information

**File Name:** `xxxxxx.SQT`  
**File Format:**  
```
project, event tree, sequence[, A]=
--- text ---
^EOS
project, event tree2, sequence2=
--- text ---
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `sequence`: 24 character Sequence name
- `A`: 1 character; if included, indicates alternate description

---

## .SQY — Sequence Recovery Rules

**File Name:** `xxxxxxxx.SQY`  
**File Format:**  
```
project, event tree, sequence =
-- recovery rule text --
^EOS
project, event tree, sequence2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `sequence`: 24 character Sequence name

---

## .SQP — Sequence Partition Rules

**File Name:** `xxxxxxxx.SQP`  
**File Format:**  
```
project, event tree, sequence =
-- partition rule text --
^EOS
project, event tree, sequence2 =
```
- `project`: 24 character Project name
- `event tree`: 24 character Event tree name
- `sequence`: 24 character Sequence name

---

## .GTD — Gate Description

**File Name:** `xxxxxx.GTD`  
**File Format:**  
```
project=
name,description[,A]
```
- `project`: 24 character Project name
- `name`: 24 character Gate name
- `description`: 120 character Gate description
- `A`: 1 character; if included, indicates alternate description

---

## .GTA — Gate Attributes

**File Name:** `xxxxxx.GTA`  
**File Format:**  
```
project=
name,attribute
```
- `project`: 24 character Project name
- `name`: 24 character Gate name
- `attribute`: 4 character Gate type

---

## .CSD — Change Set Description

**File Name:** `xxxxxx.CSD`  
**File Format:**  
```
project=
name,description[,A]
...,...
```
- `project`: 24 character Project name
- `name`: 24 character Change set name
- `description`: 120 character Change set description
- `A`: 1 character; if included, indicates alternate description

---

## .CSI — Change Set Information

**File Name:** `xxxxxx.CSI`  
**File Format:**  
```
project,change=
^PROBABILITY
eventname,calc,udT,prob,lambda,tau,udV,udC,mission,init
^CLASS
eventname,group,compType,compId,system,location,failMode,train,init,att1,..att16
calcType,udT,prob,lambda,tau,udV,udC,mission,init
^EOS
project,change2=
```
- See manual for detailed field definitions and rules.

---

## .CSA — Change Set Attributes (Version 7 only)

**File Name:** `xxxxxx.CSA`  
**File Format:**  
```
project=
name,altName
...,...
```
- `project`: 24 character Project name
- `name`: 24 character Change set primary name
- `altName`: 24 character Change set alternate name

---

## .HID — Histogram Description

**File Name:** `xxxxxxxx.HID`  
**File Format:**  
```
project =
name, type, subtype, description[, A]
```
- `project`: 24 character Project name
- `name`: 24 character Histogram primary name
- `type`: 1 character Histogram type (H=Hazard, U=Uncertainty, F=Fragility)
- `subtype`: 1 character Histogram subtype (P=Percent, A=Area, R=Range, H=Hazard)
- `description`: 120 character Histogram description
- `A`: 1 character; if included, indicates alternate description

---

## .HII — Histogram Information

**File Name:** `xxxxxxxx.HII`  
**File Format:**  
```
project, name1=
type, subtype
bin1 value1, bin1 value2
bin2 value1, bin2 value2
...
bin20 value1, bin20 value2
^EOS
project, name2 =
```
- `project`: 24 character Project name
- `nameN`: 24 character Histogram primary name
- `type`: 1 character Histogram type (see .HID)
- `subtype`: 1 character Histogram subtype (see .HID)
- `bin value1`: Exponential first value for bin
- `bin value2`: Exponential second value for bin

---

## .SLD — Slice Descriptions

**File Name:** `xxxxxxxx.SLD`  
**File Format:**  
```
project =
name, description[, A]
```
- `project`: 24 character Project name
- `name`: 24 character Slice name
- `description`: 120 character Slice description
- `A`: 1 character; if included, indicates alternate description

---

## .SLB — Slice Basic Events

**File Name:** `xxxxxxxx.SLB`  
**File Format:**  
```
project, slice =
eventname + eventname + eventname + .
^EOS
project, slice2 =
```
- `project`: 24 character Project name
- `slice`: 24 character Slice name
- `eventname`: 24 character Event names in the slice
- `+` or `*`: 1 character Slice logic: +=or , *= and

**General Rules:**
- Plus (+) or asterisk (*) between event names represent the logic in a slice. Spaces are ignored. All logic must be the same in a slice.
- Period (.) denotes the end of the slice.
- Slash (/) precedes complemented events.
- Event names max 24 characters including "/".
- Line beginning with * is a comment.

---

## .SLI — Slice Basic Information

**File Name:** `xxxxxxxx.SLI`  
**File Format:**  
```
project, slice =
eventname , delta, factor
...,...
^EOS
project, slice2 =
```
- `project`: 24 character Project name
- `slice`: 24 character Slice name
- `eventname`: 24 character Event names in the slice
- `delta`: Floating point Delta value that is factored
- `factor`: 1 character Factor flag: F=multiply, Blank=add

---

## .SLA — Slice Basic Attributes (Version 7 only)

**File Name:** `xxxxxx.SLA`  
**File Format:**  
```
project=
name,altName
...,...
```
- `project`: 24 character Project name
- `name`: 24 character Slice primary name
- `altName`: 24 character Slice alternate name

---

## .DNF — Sequence Cut Sets (SETS format, disjunctive normal form)

**File Name:** `xxxxxx.DNF.`  
**File Format:**  
```
sequence-name =
eventName * eventName +
eventName * eventName.
```
**General Rules:**
- Asterisk (*) separates event names. Spaces are ignored.
- Plus sign (+) separates cut sets.
- Period (.) denotes the end of a sequence.
- Asterisk (*) in the first column denotes a comment.

---

## .SET — Fault Tree Logic (SETS format)

**File Name:** `xxxxxx.SET.`  
**File Format:**  
```
FAULT TREE$ fault tree name.
COMMENT$ descriptive material $
gate type $ gate name. IN$ input 1, input 2, . . . , input n.
OUT$ output 1, output 2, . . . , output n.
event type $event name. OUT$ output 1, . . . , output n.
```
- See manual for detailed field definitions and rules.

---

## .DES — Basic Event Descriptions (SETS format)

**File Name:** `xxxxxxx.DES.`  
**File Format:**  
```
name $ description $
name $ description $
```
- `name`: event name
- `description`: description of event

---

## .VBK — Basic Event Failure Rates (SETS format)

**File Name:** `xxxxxxx.VBK.`  
**File Format:**  
```
VALUE BLOCK$ value-block-name
prob $ name-list$
prob $ name-list$
```
- `prob`: point value probability estimate
- `name-list`: list of event names separated by commas

---

**General Format Rules (applies to all files unless otherwise stated):**
- All name references must be upper-case alphanumeric. Lower-case will be converted to upper-case. No spaces in the middle of names.
- Descriptions can have both upper- and lower-case. No commas allowed in the description.
- Commas are used as field delimiters in most formats and can be used as placeholders for unknown fields. Any number of leading and trailing field spaces can be inserted.
- File is standard ASCII text, single spaced, upper- and lower-case.
- `^EOS` signals the End of Section so that multiple names in the same project can be collected in one file.

---