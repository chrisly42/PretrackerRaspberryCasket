; vasmm68k_mot.exe -devpac -Fbin -o ..\binaries\raspberry_casket.bin -opt-allbra drop_in_replacement.asm

PRETRACKER_SUPPORT_V1_5 = 0
PRETRACKER_PARANOIA_MODE = 0
PRETRACKER_DUBIOUS_PITCH_SHIFT_FOR_DELAYED_TRACK = 0
PRETRACKER_KEEP_JUMP_TABLE = 1
PRETRACKER_SONG_END_DETECTION = 0
PRETRACKER_PROGRESS_SUPPORT = 0
PRETRACKER_FASTER_CODE = 1
PRETRACKER_VOLUME_TABLE = 1
PRETRACKER_BUGFIX_CODE = 1
PRETRACKER_DONT_TRASH_REGS = 1
PRETRACKER_COPPER_OUTPUT = 0

        opt     p+,o+
        
        include "raspberry_casket.asm"