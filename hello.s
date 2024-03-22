r0 = 2
r1 = 4
r2 = 6
r3 = 8

SCREEN_DEV = 3
KEYBOARD_DEV = 0
CARRIAGE_RETURN = $0D

.macro screen_mode mode
    lda #mode
    clc
    jsr $FF5F
.endmacro

.macro reset_screen
    jsr $FF81
.endmacro

.macro enter_basic
    clc
    jsr $FF47
.endmacro

.macro select_output filenum
    ldx filenum
    jsr $FFC9
.endmacro
    
.macro select_input filenum
    ldx filenum
    jsr $FFC6
.endmacro
 
.macro basic_put_char
    jsr $FFD2
.endmacro

.macro wait_line
loop:
    jsr $FFCF
    cmp #CARRIAGE_RETURN
    bne loop
.endmacro

.macro set_iso_mode
    lda #$0F
    basic_put_char
.endmacro

.macro print_string ptr
    ldx #<ptr
    ldy #>ptr
    jsr print_string_p
.endmacro

.segment "LOAD_ADDR"

.word *

.CODE

start:

;    screen_mode 0
;    console_init
    select_input #KEYBOARD_DEV
    select_output #SCREEN_DEV
    set_iso_mode

    print_string hello2
    wait_line

    reset_screen
    enter_basic

.proc print_string_p
    stx loop+1
    sty loop+2
    ldx #0
loop:
    lda hello,x
    beq done
    basic_put_char
    inx
    bra loop
done:
    rts
.endproc

.RODATA

hello:
    .byte "Hello, World!", CARRIAGE_RETURN, 0

hello2:
    .byte "Hello, Commander X-16!", CARRIAGE_RETURN, 0

.segment "BASIC_RAM"

.byte 0 ; BASIC memory starts with 0 i guess
.word last_basic_line ; next basic line
.word 1 ; BASIC line number
.byte $9E ; SYS
.asciiz "$0400" ; program location as a string
;.byte 0 ; end of string
last_basic_line:
.byte 0, 0 ; last BASIC line
