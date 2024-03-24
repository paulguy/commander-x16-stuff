r0 = 2
r1 = 4
r2 = 6
r3 = 8

SCREEN_DEV = 3
KEYBOARD_DEV = 0
CARRIAGE_RETURN = $0D

RAM_BANK = $0000
ROM_BANK = $0001

VERA_CTRL = $9F25
VERA_ADDRL = $9F20
VERA_ADDRM = $9F21
VERA_ADDRH = $9F22
VERA_DATA0 = $9F23
VERA_DATA1 = $9F24
;DCSEL = 0
VERA_DC_VIDEO = $9F29
VERA_DC_HSCALE = $9F2A
VERA_DC_VSCALE = $9F2B
VERA_DC_BORDER = $9F2C
;DCSEL = 1
VERA_DCSEL_1 = $02
VERA_DC_HSTART = $9F29
VERA_DC_HSTOP = $9F2A
VERA_DC_VSTART = $9F2B
VERA_DC_VSTOP = $9F2C

VERA_SPRITE_MEM = $1FC00
VERA_SPRITE_SIZE = 8
VERA_SPRITE_MEMM = $FC
VERA_SPRITE_MEMH = $01

VERA_AUTOINCREMENT_1 = $10

.macro vera_setup_video
    stz VERA_CTRL ; set DCSEL 0
    lda #64 ; double pixels
    sta VERA_DC_HSCALE
    sta VERA_DC_VSCALE
    lda #$71 ; all layers on, VGA out, try not to break BASIC... for now
    sta VERA_DC_VIDEO
.endmacro

.macro vera_sprite_select num
    stz VERA_CTRL ; set ADDRSEL 0
    lda #VERA_SPRITE_MEMH|VERA_AUTOINCREMENT_1
    sta VERA_ADDRH
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM) & $FF00 >> 8
    sta VERA_ADDRM
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM) & $FF
    sta VERA_ADDRL
.endmacro

.macro vera_sprite_select_pos num
    stz VERA_CTRL ; set ADDRSEL 0
    lda #VERA_SPRITE_MEMH|VERA_AUTOINCREMENT_1
    sta VERA_ADDRH
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM + 2) & $FF00 >> 8
    sta VERA_ADDRM
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM + 2) & $FF
    sta VERA_ADDRL
.endmacro

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

.macro get_key
    lda ROM_BANK
    sta scratch
    stz ROM_BANK ; set bank to 0
    jsr $CE29 ; undocumented, key code goes in A and sets flags
    ldx scratch ; restore bank, don't touch A
    stx ROM_BANK
    and #$FF ; set flags again
.endmacro

.macro get_buttons num
    lda #num
    jsr $FF56
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

.ZEROPAGE

scratch:
    .res $5D

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

    vera_setup_video
    vera_sprite_select 0
    lda #$80 ; point to charset data
    sta VERA_DATA0
    lda #$0F ; 4bpp mode, upper pointer bits
    sta VERA_DATA0
    lda pos_x
    sta VERA_DATA0
    stz VERA_DATA0
    lda pos_y
    sta VERA_DATA0
    stz VERA_DATA0
    lda #$0C ; frontmost priority, no other attributes
    sta VERA_DATA0
    lda #$F0 ; make it big and obvious, use the base palette
    sta VERA_DATA0

loop:
    get_buttons 0

    bit #08
    bne :+
    dec pos_y
    jmp done
:
    bit #04
    bne :+
    inc pos_y
    jmp done
:
    bit #02
    bne :+
    dec pos_x
    jmp done
:
    bit #01
    bne :+
    inc pos_x
    jmp done
:

done:
    vera_sprite_select_pos 0
    lda pos_x
    sta VERA_DATA0
    stz VERA_DATA0
    lda pos_y
    sta VERA_DATA0
    stz VERA_DATA0

    get_key
    cmp #'q'
    beq noloop
    jmp loop
noloop:

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

.DATA

pos_x:
    .byte 10
pos_y:
    .byte 10

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
