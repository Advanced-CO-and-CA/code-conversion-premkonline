/******************************************************************************
* file: arm_lab_cs18m512_assignment5.s
* author: Premkumar Sholapur
* Roll no: cs18m512
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
 *Convert given eight-digit packed binary-coded-decimal number	in the BCDNUM	variable	into a 32-bit number in a NUMBER	variable
 */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
BCDNUM: .word 92529679
NUMBER: .word 0x0  @(0x0583E409)

  @ TEXT section
      .text

.globl _main

_main:
      LDR   R0, =BCDNUM
      LDR   R1, =NUMBER
      LDR   R2, [R0]
      MOV   R3, #0x10
      MOV   R4, #0
      
DIV:  CMP R2, R3
      BLLT DONE
      ADD R4, R4, #1
      SUB R2, R2, R3
      BL DIV

DONE: LSL   R4, R4, #4
      SUB   R2, R2, #6
      ADD   R4, R4, R2 
      
      STR   R4, [R1] 
      
   

      

