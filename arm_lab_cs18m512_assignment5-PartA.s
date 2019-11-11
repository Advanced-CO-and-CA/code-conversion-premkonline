/******************************************************************************
* file: arm_lab_cs18m512_assignment5.s
* author: Premkumar Sholapur
* Roll no: cs18m512
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
 *ASCII to Hex digit conversion
 */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
A_DIGIT: .byte 0x43 @('C')
H_DIGIT: .byte 0x0  @(0xC expected output)

  @ TEXT section
      .text

.globl _main

_main:
      LDR   R0, =A_DIGIT
      LDR   R1, =H_DIGIT
      LDRB  R0, [R0]
      MOV   R2, #0xFFFFFFFF @default value

      CMP   R0, #0x30
      BLT DONE
      CMPGE R0, #0x39
      SUBLE R2, R0, #0x30
      BLE DONE

      CMP   R0, #0x41
      BLT DONE
      CMPGE R0, #0x46
      SUBLE R2, R0, #0x41
      ADDLE R2, R2, #10
      BLE DONE

      CMP   R0, #0x61
      BLT DONE
      CMPGE R0, #0x66
      SUBLE R2, R0, #0x61
      ADDLE R2, R2, #10
      BLE DONE

DONE: 
      STRB  R2, [R1]
   

      

