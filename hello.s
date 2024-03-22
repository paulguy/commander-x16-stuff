r0 = 2
r1 = 4
r2 = 6
r3 = 8

SCREEN_DEV = 3

.macro screen_mode mode
    lda #mode
    clc
    jsr $FF5F
.endmacro

.macro console_init
    lda #0
    sta r0
    sta r0+1
    sta r1
    sta r1+1
    sta r2
    sta r2+1
    sta r3
    sta r3+1
    jsr $FEDB
.endmacro

.macro console_put_char
    clc
    jsr $FEDE
.endmacro

.macro console_get_char
    jsr $FEE1
.endmacro

.macro enter_basic
    clc
    jsr $FF47
.endmacro

.macro set_file_params filenum, devnum, secaddr
    lda filenum
    ldx devnum
    ldy secaddr
    jsr $FFBA
.endmacro

.macro select_output filenum
    ldx filenum
    jsr $FFC9
.endmacro
    
.macro basic_put_char
    jsr $FFD2
.endmacro

.macro set_iso_mode
    lda #$0F
    basic_put_char
.endmacro

.segment "LOAD_ADDR"

.word *

.CODE

start:

;    screen_mode 0
;    console_init
    select_output #SCREEN_DEV
    set_iso_mode
    ldx #0
loop:
    lda hello,x
    beq done
    basic_put_char
    inx
    bra loop
done:
    enter_basic

.RODATA

hello:
    .asciiz "Hello, World!"
    .byte 0

.segment "BASIC_RAM"

.byte 0 ; BASIC memory starts with 0 i guess
.word last_basic_line ; next basic line
.word 1 ; BASIC line number
.byte $9E ; SYS
.asciiz "$0400" ; program location as a string
;.byte 0 ; end of string
last_basic_line:
.byte 0, 0 ; last BASIC line
