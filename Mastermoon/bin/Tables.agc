
# Because constants are held in fixed memory (ROM), we can organise them consecutively
# and use them as handy lookup tables

# For each possible digit (blank, 0-9), the 5-bit code we need to send to the DSKY.

DSPBLANK	OCT	0
DSP0		OCT	25
DSP1		OCT	3
DSP2		OCT	31
DSP3		OCT	33
DSP4		OCT	17
DSP5		OCT	36
DSP6		OCT	34
DSP7		OCT	23
DSP8		OCT	35
DSP9		OCT	37

# For each of the 21 display digits, is it left (1) or right (0) of the pair?

LEFTRIGHT       DEC     1
LR1             DEC     0
LR2             DEC     1
LR3             DEC     0
LR4             DEC     1
LR5             DEC     0
LR6             DEC     0
LR7             DEC     1
LR8             DEC     0
LR9             DEC     1
LR10            DEC     0
LR11            DEC     1
LR12            DEC     0
LR13            DEC     1
LR14            DEC     0
LR15            DEC     1
LR16            DEC     0
LR17            DEC     1
LR18            DEC     0
LR19            DEC     1
LR20            DEC     0

# For each of the 21 display digits, which pair of segments does it belong to?

SEG_0           DEC     00
SEG_1           DEC     00
SEG_2           DEC     01
SEG_3           DEC     01
SEG_4           DEC     02
SEG_5           DEC     02
SEG_6           DEC     03
SEG_7           DEC     04
SEG_8           DEC     04
SEG_9           DEC     05
SEG_10          DEC     05
SEG_11          DEC     06
SEG_12          DEC     06
SEG_13          DEC     07
SEG_14          DEC     07
SEG_15          DEC     08
SEG_16          DEC     08
SEG_17          DEC     09
SEG_18          DEC     09
SEG_19          DEC     10
SEG_20          DEC     10


# Lookup bits 10-14 to select the segement pair in Channel 10 WRITE


SEGCODE         OCT     54000
VERBLR          OCT     50000
NOUNLR          OCT     44000
TOP1            OCT     40000
TOP23           OCT     34000
TOP45           OCT     30000
MID12           OCT     24000
MID34           OCT     20000
MID5BOT1        OCT     14000
BOT23           OCT     10000
BOT45           OCT     4000



# Decimal table for easy loading into A

DIGITS          DEC     0
DEC1            DEC     1
DEC2            DEC     2
DEC3            DEC     3
DEC4            DEC     4
DEC5            DEC     5
DEC6            DEC     6
DEC7            DEC     7
DEC8            DEC     8
DEC9            DEC     9
DEC10           DEC     10
DEC11           DEC     11
DEC12           DEC     12
DEC13           DEC     13
DEC14           DEC     14
DEC15           DEC     15
DEC16           DEC     16
DEC17           DEC     17
DEC18           DEC     18
DEC19           DEC     19

# Game state constants, re-using some of the above

STAINPUT     EQUALS DIGITS
STAWAIT      EQUALS DEC1
STAWIN	     EQUALS DEC2
STALOSE      EQUALS DEC3
STAINIT	     EQUALS DEC4

# For each grid row, which segment ID does it start at?

ROW_STRT        DEC     6
ROW_STRT2       DEC     11
ROW_STRT3       DEC     16

# For each grid column, which segment ID does it start at?

COL_STRT        DEC     6
COL_STRT2       DEC     7
COL_STRT3       DEC     8
COL_STRT4       DEC     9
COL_STRT5       DEC     10

# For each grid cell, which column does it belong to (0-5 ignored)

GRID_COL        DEC     0
GRID_CM5        DEC     0
GRID_CM4        DEC     0
GRID_CM3        DEC     0
GRID_CM2        DEC     0
GRID_CM1        DEC     0
GRID_C0         DEC     0
GRID_C1         DEC     1
GRID_C2         DEC     2
GRID_C3         DEC     3
GRID_C4         DEC     4
GRID_C5         DEC     0
GRID_C6         DEC     1
GRID_C7         DEC     2
GRID_C8         DEC     3
GRID_C9         DEC     4
GRID_C10        DEC     0
GRID_C11        DEC     1
GRID_C12        DEC     2
GRID_C13        DEC     3
GRID_C14        DEC     4

# For each grid cell, which ro wdoes it belong to (0-5 ignored)

GRID_ROW        DEC     0
GRID_RM5        DEC     0
GRID_RM4        DEC     0
GRID_RM3        DEC     0
GRID_RM2        DEC     0
GRID_RM1        DEC     0
GRID_R0         DEC     0
GRID_R1         DEC     0
GRID_R2         DEC     0
GRID_R3         DEC     0
GRID_R4         DEC     0
GRID_R5         DEC     1
GRID_R6         DEC     1
GRID_R7         DEC     1
GRID_R8         DEC     1
GRID_R9         DEC     1
GRID_R10        DEC     2
GRID_R11        DEC     2
GRID_R12        DEC     2
GRID_R13        DEC     2
GRID_R14        DEC     2

# Table of 128 'random' numbers between 0-9 that we can index into

RAND1   DEC 5
RAND2   DEC 2
RAND3   DEC 8
RAND4   DEC 1
RAND5   DEC 7
RAND6   DEC 3
RAND7   DEC 0
RAND8   DEC 9
RAND9   DEC 6
RAND10  DEC 4
RAND11  DEC 1
RAND12  DEC 5
RAND13  DEC 3
RAND14  DEC 7
RAND15  DEC 8
RAND16  DEC 2
RAND17  DEC 6
RAND18  DEC 0
RAND19  DEC 4
RAND20  DEC 9
RAND21  DEC 7
RAND22  DEC 6
RAND23  DEC 2
RAND24  DEC 5
RAND25  DEC 1
RAND26  DEC 8
RAND27  DEC 3
RAND28  DEC 9
RAND29  DEC 0
RAND30  DEC 4
RAND31  DEC 6
RAND32  DEC 7
RAND33  DEC 5
RAND34  DEC 2
RAND35  DEC 9
RAND36  DEC 1
RAND37  DEC 4
RAND38  DEC 8
RAND39  DEC 3
RAND40  DEC 0
RAND41  DEC 2
RAND42  DEC 6
RAND43  DEC 7
RAND44  DEC 5
RAND45  DEC 1
RAND46  DEC 3
RAND47  DEC 9
RAND48  DEC 8
RAND49  DEC 4
RAND50  DEC 0
RAND51  DEC 5
RAND52  DEC 7
RAND53  DEC 6
RAND54  DEC 2
RAND55  DEC 8
RAND56  DEC 1
RAND57  DEC 3
RAND58  DEC 4
RAND59  DEC 9
RAND60  DEC 0
RAND61  DEC 7
RAND62  DEC 5
RAND63  DEC 2
RAND64  DEC 6
RAND65  DEC 1
RAND66  DEC 8
RAND67  DEC 4
RAND68  DEC 3
RAND69  DEC 9
RAND70  DEC 0
RAND71  DEC 6
RAND72  DEC 2
RAND73  DEC 5
RAND74  DEC 7
RAND75  DEC 8
RAND76  DEC 1
RAND77  DEC 4
RAND78  DEC 9
RAND79  DEC 3
RAND80  DEC 0
RAND81  DEC 5
RAND82  DEC 6
RAND83  DEC 7
RAND84  DEC 2
RAND85  DEC 1
RAND86  DEC 8
RAND87  DEC 9
RAND88  DEC 3
RAND89  DEC 4
RAND90  DEC 0
RAND91  DEC 7
RAND92  DEC 5
RAND93  DEC 6
RAND94  DEC 2
RAND95  DEC 8
RAND96  DEC 1
RAND97  DEC 3
RAND98  DEC 4
RAND99  DEC 9
RAND100 DEC 0
RAND101 DEC 6
RAND102 DEC 7
RAND103 DEC 5
RAND104 DEC 2
RAND105 DEC 1
RAND106 DEC 8
RAND107 DEC 3
RAND108 DEC 4
RAND109 DEC 9
RAND110 DEC 0
RAND111 DEC 7
RAND112 DEC 6
RAND113 DEC 5
RAND114 DEC 2
RAND115 DEC 8
RAND116 DEC 1
RAND117 DEC 3
RAND118 DEC 4
RAND119 DEC 9
RAND120 DEC 0
RAND121 DEC 6
RAND122 DEC 7
RAND123 DEC 5
RAND124 DEC 2
RAND125 DEC 8
RAND126 DEC 1
RAND127 DEC 3
RAND128 DEC 4
