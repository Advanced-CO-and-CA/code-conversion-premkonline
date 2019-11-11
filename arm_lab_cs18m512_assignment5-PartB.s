/******************************************************************************
* file: arm_lab_cs18m512_assignment5.s
* author: Premkumar Sholapur
* Roll no: cs18m512
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
 *PartB - Convert given eight ASCII	characters	8-bit binary	number	in	the	variable	NUMBER
 */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
STRING_TestA:  .byte 0x31 @('1')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
               .byte 0x30 @('0')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
            
NUMBER_TestA:  .word 0x0  @(Expected: 11010010)
ERROR_TestA:   .word 0x0  @(0x0)

STRING_TestB:  .byte 0x31 @('1')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
               .byte 0x37 @('7')
               .byte 0x31 @('1')
               .byte 0x30 @('0')
            
NUMBER_TestB:  .word 0x0  @(Expected: 0)
ERROR_TestB:   .word 0x0  @(0xFF, error)

  @ TEXT section
      .text

.globl _main

_main:
      LDR   R0, =STRING_TestA
      LDR   R1, =NUMBER_TestA
      LDR   R2, =ERROR_TestA
      
      BL CONVERT_BINARY
      
      LDR   R0, =STRING_TestB
      LDR   R1, =NUMBER_TestB
      LDR   R2, =ERROR_TestB
      
      BL CONVERT_BINARY
      
      B DONE
      
CONVERT_BINARY:
      MOV   R4, #0      @default NUMBER_VALUE
      MOV   R5, #0xFF   @default error code 

      MOV   R8, #8 

LOOP_8:
      LDRB  R3, [R0], #1
      CMP   R3, #0x30
      BLT   ERROR
      CMP   R3, #0x31
      MOVGT R4, #0
      BGT   ERROR
      LSL   R4, #4
      SUB   R3, R3, #0x30
      ADD   R4, R4, R3

      SUBS  R8, R8, #1
      BNE   LOOP_8
      MOV   R5, #0
      

ERROR:
      STR   R4, [R1]
      STR   R5, [R2]
      BLX   LR
       
DONE: 
      NOP
   

      

