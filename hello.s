r0 = 2
r1 = 4
r2 = 6
r3 = 8

SCREEN_DEV = 3
KEYBOARD_DEV = 0
CARRIAGE_RETURN = $0D

RAM_BANK = $0000
ROM_BANK = $0001

VERA_ADDRL = $9F20
VERA_ADDRM = $9F21

VERA_ADDRH = $9F22
VERA_ADDRH_INC_0 = $00
VERA_ADDRH_INC_1 = $10
VERA_ADDRH_INC_2 = $20
VERA_ADDRH_INC_4 = $30
VERA_ADDRH_INC_8 = $40
VERA_ADDRH_INC_16 = $50
VERA_ADDRH_INC_32 = $60
VERA_ADDRH_INC_64 = $70
VERA_ADDRH_INC_128 = $80
VERA_ADDRH_INC_256 = $90
VERA_ADDRH_INC_512 = $A0
VERA_ADDRH_INC_40 = $B0
VERA_ADDRH_INC_80 = $C0
VERA_ADDRH_INC_160 = $D0
VERA_ADDRH_INC_320 = $E0
VERA_ADDRH_INC_640 = $F0
VERA_ADDRH_DEC = $08
VERA_ADDRH_NINC = $04
VERA_ADDRH_NADDR = $02
VERA_ADDRH_ADDR_MASK = $01

VERA_DATA0 = $9F23
VERA_DATA1 = $9F24

VERA_CTRL = $9F25
VERA_CTRL_RESET = $80
VERA_CTRL_DCSEL_MASK = $3F
VERA_CTRL_DCSEL_SHIFT = 1
VERA_CTRL_ADDRSEL_0 = $00
VERA_CTRL_ADDRSEL_1 = $01

VERA_IEN = $9F26
VERA_IEN_IRQLINE_8 = $80
VERA_IEN_SCANLINE_8 = $40
VERA_IEN_AFLOW = $08
VERA_IEN_SPRCOL = $04
VERA_IEN_LINE = $02
VERA_IEN_VSYNC = $01

VERA_ISR = $9F27
VERA_ISR_SPRCOL_0 = $80
VERA_ISR_SPRCOL_1 = $40
VERA_ISR_SPRCOL_2 = $20
VERA_ISR_SPRCOL_3 = $10
VERA_ISR_AFLOW = $08
VERA_ISR_SPRCOL = $04
VERA_ISR_LINE = $02
VERA_ISR_VSYNC = $01

VERA_LINE = $9F28

;DCSEL = 0
VERA_DC_VIDEO = $9F29
VERA_DC_VIDEO_FIELD = $80
VERA_DC_VIDEO_SPRITES = $40
VERA_DC_VIDEO_L1 = $20
VERA_DC_VIDEO_L0 = $10
VERA_DC_VIDEO_240P = $08
VERA_DC_VIDEO_CHROMA_OFF = $04
VERA_DC_VIDEO_HVSYNC = $04
VERA_DC_VIDEO_OFF = $00
VERA_DC_VIDEO_VGA_30 = $01
VERA_DC_VIDEO_NTSC = $02
VERA_DC_VIDEO_RGB_15 = $03

VERA_DC_HSCALE = $9F2A
VERA_DC_VSCALE = $9F2B
VERA_DC_BORDER = $9F2C
;DCSEL = 1
VERA_DC_HSTART = $9F29
VERA_DC_HSTOP = $9F2A
VERA_DC_VSTART = $9F2B
VERA_DC_VSTOP = $9F2C

VERA_L0_CONFIG = $9F2D
VERA_L0_MAPBASE = $9F2E
VERA_L0_TILEBASE = $9F2F
VERA_L0_HSCROLL_L = $9F30
VERA_L0_HSCROLL_H = $9F31
VERA_L0_VSCROLL_L = $9F32
VERA_L0_VSCROLL_H = $9F33

VERA_L1_CONFIG = $9F34
VERA_L1_MAPBASE = $9F35
VERA_L1_TILEBASE = $9F36
VERA_L1_HSCROLL_L = $9F37
VERA_L1_HSCROLL_H = $9F38
VERA_L1_VSCROLL_L = $9F39
VERA_L1_VSCROLL_H = $9F3A

VERA_LAYER_HEIGHT_32 = $00
VERA_LAYER_HEIGHT_64 = $40
VERA_LAYER_HEIGHT_128 = $80
VERA_LAYER_HEIGHT_256 = $C0
VERA_LAYER_WIDTH_32 = $00
VERA_LAYER_WIDTH_64 = $10
VERA_LAYER_WIDTH_128 = $20
VERA_LAYER_WIDTH_256 = $30
VERA_LAYER_T256C = $08
VERA_LAYER_BITMAP = $04
VERA_LAYER_1BPP = $00
VERA_LAYER_2BPP = $01
VERA_LAYER_4BPP = $02
VERA_LAYER_8BPP = $03

VERA_SPRITE_MEM = $1FC00
VERA_SPRITE_MEMM = $FC
VERA_SPRITE_MEMH = $01
VERA_SPRITE_ADDRL = 0
VERA_SPRITE_ADDRH = 1
VERA_SPRITE_ADDRH_4BPP = $00
VERA_SPRITE_ADDRH_8BPP = $80
VERA_SPRITE_XL = 2
VERA_SPRITE_XH = 3
VERA_SPRITE_YL = 4
VERA_SPRITE_YH = 5
VERA_SPRITE_ATTRIB = 6
VERA_SPRITE_ATTRIB_COL0 = $80
VERA_SPRITE_ATTRIB_COL1 = $40
VERA_SPRITE_ATTRIB_COL2 = $20
VERA_SPRITE_ATTRIB_COL3 = $10
VERA_SPRITE_ATTRIB_OFF = $00
VERA_SPRITE_ATTRIB_BELOW_L0 = $04
VERA_SPRITE_ATTRIB_ABOVE_L0 = $08
VERA_SPRITE_ATTRIB_BELOW_L1 = $08
VERA_SPRITE_ATTRIB_ABOVE_L1 = $0C
VERA_SPRITE_ATTRIB_VFLIP = $02
VERA_SPRITE_ATTRIB_HFLIP = $01
VERA_SPRITE_PALETTE = 7
VERA_SPRITE_PALETTE_HEIGHT_8 = $00
VERA_SPRITE_PALETTE_HEIGHT_16 = $40
VERA_SPRITE_PALETTE_HEIGHT_32 = $80
VERA_SPRITE_PALETTE_HEIGHT_64 = $C0
VERA_SPRITE_PALETTE_WIDTH_8 = $00
VERA_SPRITE_PALETTE_WIDTH_16 = $10
VERA_SPRITE_PALETTE_WIDTH_32 = $20
VERA_SPRITE_PALETTE_WIDTH_64 = $30
VERA_SPRITE_SIZE = 8

.macro backup_isr
    lda $0314
    sta orig_isr
    lda $0315
    sta orig_isr+1
.endmacro

.macro restore_isr
    lda orig_isr
    sta $0314
    lda orig_isr+1
    sta $0315
.endmacro

.macro set_isr ptr
    lda #<ptr
    sta $0314
    lda #>ptr
    sta $0315
.endmacro

.macro debug_to_screen
    ldx #$01
    stx VERA_ADDRH
    ldx #$B0
    stx VERA_ADDRM
    stz VERA_ADDRL
    sta VERA_DATA0
.endmacro

.macro vera_setup_video
    stz VERA_CTRL ; set DCSEL 0
    lda #64 ; double pixels
    sta VERA_DC_HSCALE
    sta VERA_DC_VSCALE
    lda #(VERA_DC_VIDEO_SPRITES | VERA_DC_VIDEO_L0 | VERA_DC_VIDEO_240P | VERA_DC_VIDEO_VGA_30)
    sta VERA_DC_VIDEO
.endmacro

.macro vera_sprite_select num
    stz VERA_CTRL ; set ADDRSEL 0
    lda #(VERA_SPRITE_MEMH | VERA_ADDRH_INC_1)
    sta VERA_ADDRH
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM) & $FF00 >> 8
    sta VERA_ADDRM
    lda #(num * VERA_SPRITE_SIZE + VERA_SPRITE_MEM) & $FF
    sta VERA_ADDRL
.endmacro

.macro vera_sprite_select_pos num
    stz VERA_CTRL ; set ADDRSEL 0
    lda #(VERA_SPRITE_MEMH | VERA_ADDRH_INC_1)
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
    jsr $FF9F ; scan keys
    lda ROM_BANK ; backup bank
    sta scratch
    stz ROM_BANK ; set bank to 0
    jsr $CE29 ; undocumented, key code goes in A and sets flags
    ldx scratch ; restore bank, don't touch A
    stx ROM_BANK
    and #$FF ; set flags again
.endmacro

.macro get_buttons num
    jsr $FF53 ; scan buttons
    lda #num
    jsr $FF56 ; get button from controller num (0 = keyboard, 1-4 controllers)
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

.macro find_bytes ptr1, ptr2, len
    lda #<ptr1
    pha
    lda #>ptr2
    pha
    ldx #<ptr1
    ldy #>ptr2
    lda #len
    jsr find_bytes_p
.endmacro

.ZEROPAGE

scratch:
    .res $5D

.segment "LOAD_ADDR"

.word *

.CODE

start:

    sei
    ; make keyboard input make sense
    select_input #KEYBOARD_DEV
    select_output #SCREEN_DEV
    set_iso_mode

    ;print_string hello2

    vera_setup_video

    ; setup sprite
    vera_sprite_select 0
    lda #$80 ; point to charset data
    sta VERA_DATA0
    lda #($0F | VERA_SPRITE_ADDRH_4BPP)
    sta VERA_DATA0
    stz VERA_DATA0
    stz VERA_DATA0
    stz VERA_DATA0
    stz VERA_DATA0
    lda #VERA_SPRITE_ATTRIB_ABOVE_L1
    sta VERA_DATA0
    lda #(VERA_SPRITE_PALETTE_WIDTH_64 | VERA_SPRITE_PALETTE_HEIGHT_64)
    sta VERA_DATA0

    lda #(VERA_LAYER_HEIGHT_32 | VERA_LAYER_WIDTH_32 | VERA_LAYER_4BPP)
    sta VERA_L0_CONFIG
    stz VERA_L0_MAPBASE
    stz VERA_L0_TILEBASE
    stz VERA_L0_HSCROLL_L
    stz VERA_L0_HSCROLL_H
    stz VERA_L0_VSCROLL_L
    stz VERA_L0_VSCROLL_H

    backup_isr
    set_isr isr ; set interrupt handler

    lda #$01 ; VERA IRQ on VSYNC
    sta VERA_IEN

    cli ; enable interrupts and wait
:
    .byte $CB ; wait
    lda quit ; check quit flag and branch back to wait if still 0
    beq :-

    restore_isr
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

.proc isr
    ; assume this is the vblank from the VERA
    ; potentially add checks for others later
    lda #$01 ; clear VSYNC interrupt status
    sta VERA_ISR

    get_buttons 0

    bit #08
    bne :+
    dec pos_y
:
    bit #04
    bne :+
    inc pos_y
:
    bit #02
    bne :+
    dec pos_x
:
    bit #01
    bne :+
    inc pos_x
:

    vera_sprite_select_pos 0
    lda pos_x
    sta VERA_DATA0
    stz VERA_DATA0
    lda pos_y
    sta VERA_DATA0
    stz VERA_DATA0

    get_key
    cmp #'q'
    bne noquit
    inc quit
noquit:

    ply ; this is how the firmware normally returns after it's all done
    plx
    pla
    rti
.endproc

.proc find_bytes_p
    ; needle in x, y, haystack on stack, len in a
    ; result in x, 255 means not found
    ; clobbers a, x, y, scratch 0
    sta scratch
    stx loop+4
    sty loop+5
    tsx ; get the arguments off the stack
    lda $104,x
    ldy $103,x
    tax
    stx loop+1
    sty loop+2
    ldx #0
    ldy #0
loop:
    lda $FFFF,x
    cmp $FFFF,y
    bne nomatch
    iny
    tya
    cmp scratch
    beq done
    bra next
nomatch:
    ldy #0
next:
    inx
    beq err ; overflowed back to 0, and didn't find it.
    bra loop
done:
    rts
err:
    ldx #255
    rts
.endproc

.DATA

orig_isr:
    .word 0
quit:
    .byte 0
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
