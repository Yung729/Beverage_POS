
.MODEL small
.STACK 100
.DATA

;USERNAME - Jfy123
;Password - mesrcyTq55

;------------------------------------------------------------------Main------------------------------------------------------------------------------------------------------
LOGO            DB "                  ___________           .__  .__                               ",13,10
                DB "                  \__    ___/___ _____  |  | |__|__  __ ____                   ",13,10
                DB "                    |    |_/ __ \\__  \ |  | |  \  \/ // __ \                  ",13,10
                DB "                    |    |\  ___/ / __ \|  |_|  |\   /\  ___/                  ",13,10
                DB "                    |____| \___  >____  /____/__| \_/  \___  >                 ",13,10
                DB "                                                                               ",13,10,'$'

STRMAINMENU     DB "                    +======================================+                   ",13,10
                DB "                    |             1.  Staff                |                   ",13,10
                DB "                    |             2.  Sales                |                   ",13,10
                DB "                    |             3.  Stock                |                   ",13,10
                DB "                    |             0.  Logout               |                   ",13,10
                DB "                    +======================================+                   ",13,10,'$'
MMENUCHTXT      DB "                     ENTER YOUR CHOICE [0-3] : ",'$'
USERCHOICE      DB ?

;--------------------------------------------------------------------Sales---------------------------------------------------------------------------------------------------
STRSALESMENU    DB "                                Sales Order System                             ",13,10
                DB "                    +======================================+                   ",13,10
                DB "                    |             1.  Display Menu         |                   ",13,10
                DB "                    |             2.  Order                |                   ",13,10
                DB "                    |             3.  Summary              |                   ",13,10
                DB "                    |             0.  EXIT                 |                   ",13,10
                DB "                    +======================================+                   ",13,10,'$'
SALESCHTXT       DB "                     ENTER YOUR CHOICE [0-3] : ",'$'

STRBEVARAGEMENU DB "                                Sales Order Menu                               ",13,10
                DB "                    +======================================+                   ",13,10
                DB "                    |                 Drinks        Price  |                   ",13,10
                DB "                    |                                      |                   ",13,10
                DB "                    |             1.  Mocha         RM11   |                   ",13,10
                DB "                    |             2.  Cappuccino    RM12   |                   ",13,10
                DB "                    |             3.  Espresso      RM10   |                   ",13,10
                DB "                    |             4.  Latte         RM15   |                   ",13,10
                DB "                    |             5.  Milk Tea      RM11   |                   ",13,10
                DB "                    |                                      |                   ",13,10
                DB "                    +======================================+                   ",13,10,'$'

SPECIAL_MSG     DB "                    * Buy More Than 3 Drink in get 10% discount *              ",13,10,'$' 
SPECIAL_MSG1    DB "                    * Upgrade Drink Charge RM 2 per Drinks *                   ",13,10,'$'       

;--------------- constant of beverage -------------------------------------------------
BEVERAGEQTY      DB 0,0,0,0,0   ;beverage quantity for receipt
SUMMARYQTY       DW 0,0,0,0,0   ;beverage quantity for summary
PRICEBEVERAGE    DB 11,12,10,15,11 ;beverage price

UPGRADEDRINKPRICE          DB 0,0,0,0,0
SUMMARY_UPGRADE_DRINKPRICE DW 0,0,0,0,0

;total up variable
TOTALPRICE       DW ?
TOTALQUANTITY    DW ?

BEVERAGECHOICE   DB ?
LOOPCOUNT        DB ?
UPGRADE_CHECK    DB ? ;check the beverage is upgraded 

QUANTITY DB 0
PRICE DB ?
ORDER_COUNT DB ? ;for order no
LIMIT_QUANTITY DB ? ;calculate quantity per order
;------------------- Order variable-------------------------------------------------------------
ORDERCHTXT       DB "                     ENTER BEVERAGE CHOICE [1-5] > ",'$'
QUANTITYMSG      DB "                     ENTER QUANTITY [1-9 ONLY] > ",'$'
CONFIRMDRINK     DB "                     CONFIRM DRINK ? [Y/N] >  ",'$'
NEXTDRINKMSG     DB "                     ANY DRINKS [Y/N] >  ",'$'
CONFIRMORDERMSG  DB "                     CONFIRM ORDER [Y] / CANCEL ORDER [N] >  ",'$'
SIZEMSG          DB "                     UPGRADE BEVERAGE SIZE? [Y/N] > ",'$'
; ---------------------------- print message variable ---------------------
ORDERCANCELSTR              DB "                                        Order Canceled!                              $"
PRESSKEYCONT                DB "                         <<Press any key to continue>>                         $"   
BARSTR                      DB "     +--------------------------------------------------------------------+",13,10,'$'
ERRORSTR                    DB "                         INVALID! PLEASE ENTER AGAIN!                          $"
INGREDIENT_CHECK_STR        DB "                         INVALID! INGREDIENT NO ENOUGH!                          $"
LIMIT_CHECK_STR             DB "                         LIMITTED ORDER UP TO 20  !                          $"

;--------------------------- print receipt variable ------------------------------
STRRECEIPT          DB "                          Setapak - TEALIVE SDN BHD                            ",13,10
                    DB "     +--------------------------------------------------------------------+    ",13,10
                    DB "                                   INVOICE                                     ",13,10
                    DB "     +--------------------------------------------------------------------+    ",13,10,'$'
THANKYOU            DB "                            Thank You for Order !                              ",13,10,'$'

STRSUMMARY          DB "                                   SUMMARY                                    ",13,10
                    DB "     +--------------------------------------------------------------------+     ",13,10,'$'
TAXSTR              DB "                                                     TAX   : RM ",'$'
DISCOUNTSTR         DB "                                                  DISCOUNT : RM ",'$'                    
TOTALPRICESTR       DB "                                            TOTAL    Price : RM ",'$'
TOTALBARSTR         DB "                                                             ============",13,10,'$'
SUBTOTALSTR         DB "                                                  SUBTOTAL : RM ",'$'
TOTALQUANTITYSTR    DB "                                            TOTAL QUANTITY :    ",'$'
ORDERNO_STR         DB "      Order No : T",'$'
TOTAL_ORDER_NO_STR  DB "      Total order of the day : ",'$'

PRICESTR     DB "                                           QUANTITY           PRICE(RM) $"    
BEVERAGESTR  DB "               Mocha                          $"
BEVERAGESTR1 DB "               Cappuccino                     $"
BEVERAGESTR2 DB "               Espresso                       $"
BEVERAGESTR3 DB "               Latte                          $"
BEVERAGESTR4 DB "               Milk Tea                       $"
EMPTYSTR     DB "            $"



;-------------------- print digit vairable -----------------------------------------------------
DWfirstDigit    DW ?  
DWremainder     DW ?
DWremainder1    DW ?
remainder       DB ?
remainder1      DB ?
remainder2      DB ?
remainder3      DB ?
DIGITCHECK      DB ?   ;previous digit check
DIGITCHECK1      DB ?   ;current digit check

TEN         DB 10
HUNDRED     DB 100
THOUSAND    DW 1000
TENK        DW 10000

;------------------- Tax & Discount Variable ---------------------------------
;tax
TAX              DW ?
TAX_FPOINT       DW ?
TFPOINT1          DB ?
TFPOINT2          DB ?
TFPOINT3          DB ?
TOTAL_TAX_FPOINT1 DW ?

;discount
TOTAL_DISCOUNT          DW ?
DISCOUNT                DW ?
DISCOUNT_FPOINT         DW ?
DFPOINT1                DB ?
DFPOINT2                DB ?
DFPOINT3                DB ?
TOTAL_DISCOUNT_FPOINT1  DW ?
DISCOUNT_ROUNDUP        DB ?

;subtotal
SUBTOTAL         DW ?
SUBTOTAL_FPOINT          DW ?
SFPOINT2          DB ?
SFPOINT3          DB ?
SFPOINT4          DB ?

;total up floating point
TOTALDFPOINT    DW ?
TOTALTFPOINT    DW ?
TOTALFPOINT     DW ?
ROUNDUP         DW ?

LOOP_TEMP       DB ? ;temporary store loop count for nested loop

;------------------------------------------- Payment Variable -----------------------------------------
PAYMENTSTR DB "     Payment Method :                                 ",13,10
           DB "     1. Cash            2. QR Pay                     ",13,10,'$'
          
METHODSTR  DB "     Enter Payment Method [1-2] > $"

CASHSTR             DB 13,10,"     ENTER CASH AMOUNT [cash only] > $"
BALANCESTR          DB "                              Balance  : RM ",'$'
WALLETSTR           DB "                        Payment Charge : RM ",'$'

CASHINPUT_STR  LABEL BYTE    
CASHINPUT_MAXN       DB 5 ;index 0
CASHINPUT_ACTN       DB ? ; index 1
CASHINPUT            DB 5 DUP(?) 
CASHINPUT_BOTH       DW ?      

BALANCE       DW   ?
B_FPOINT1     DW   ?
B_FPOINT2     DB   ?
B_FPOINT3     DB   ?
B_FPOINT4     DB   ?




;---------------------------------------------------Stock Module-----------------------------------------------------------------------------------------------------

;-----------------------stock menu
STR_STOCK_MENU      DB  "                      STOCK MANAGEMENT SYSTEM",13,10
                    DB  "                    +======================================+",13,10
                    DB  "                    | 1 : VIEW                             |",13,10
                    DB  "                    | 2 : ADD                              |",13,10
                    DB  "                    | 3 : DELETE                           |",13,10
                    DB  "                    | 0 : BACK                             |",13,10
                    DB  "                    +======================================+",13,10,"$"


;-----------------------choose option
STR_CHOOSE_OPTION   DB  "                      PLEASE CHOOSE YOUR OPTION : ","$"
chooseOption        DB  ?


;-----------------------error message
STR_ERROR1          DB  "                      WRONG INPUT! PLEASE REENTER.",13,10,"$"
errorMsg1           DB  ?
STR_ERROR2          DB  "                      AMOUNT TO DELETE EXCEED CURRENT STOCK.",13,10,"$"
errorMsg2           DB  ?


;-----------------------stock view
STR_STOCK_VIEW_T    DB  "                      STOCK VIEW INVERNTORY",13,10
                    DB  "                    +======================================+",13,10,"$"
STR_STOCK_VIEW_I1   DB  "                    | COFFEE : ","$"
STR_STOCK_VIEW_I2   DB  "                    | TEA    : ","$"
STR_STOCK_VIEW_I3   DB  "                    | COCOA  : ","$"
STR_STOCK_VIEW_I4   DB  "                    | SUGAR  : ","$"
STR_STOCK_VIEW_I5   DB  "                    | MILK   : ","$"
STR_STOCK_VIEW_RB   DB  "                       |",13,10,"$"
STR_STOCK_VIEW_BB   DB  "                    +======================================+",13,10,"$"
STR_PRESS_ANY_KEY   DB  "                      PRESS ANY KEY TO CONTINUE...$"


;-----------------------stock add
STR_STOCK_ADD_T     DB  "                      STOCK ADD AMOUNT",13,10,"$"
STR_STOCK_ADD_INS   DB  "                      PLEASE ENTER AMOUNT TO ADD : ","$"
STR_STOCK_ADD_DONE  DB  "                      AMOUNT SUCCESSFULLY ADDED!",13,10,"$"


;-----------------------stock delete
STR_STOCK_DEL_T     DB  "                      STOCK DELETE AMOUNT",13,10,"$"
STR_STOCK_DEL_INS   DB  "                      PLEASE ENTER AMOUNT TO DELETE : ","$"
STR_STOCK_DEL_DONE  DB  "                      AMOUNT SUCCESSFULLY REMOVED!",13,10,"$"


;-----------------------stock add and delete
STR_STOCK_NAME_LIST DB  "                    +======================================+",13,10
                    DB  "                    | 1 : COFFEE                           |",13,10
                    DB  "                    | 2 : TEA                              |",13,10
                    DB  "                    | 3 : COCOA                            |",13,10
                    DB  "                    | 4 : SUGAR                            |",13,10
                    DB  "                    | 5 : MILK                             |",13,10
                    DB  "                    | 0 : BACK                             |",13,10
                    DB  "                    +======================================+",13,10,"$"


;-----------------------ingredient list
;in order : coffee, tea, cocoa, sugar, milk
ingredient			DW	1000,2000,3000,4000,5000
ingredient_buffer			DW	0,0,0,0,0


;-----------------------menu ingredient requirement
;in order : coffee, tea, cocoa, sugar, milk)
;in order : mocha, mocha L, cap, cap L, exp, exp L, latte, latter L, milk tea, milk tea L
MENU_ING_REQ        DB    8,  0, 10,  8, 50, 16,  0, 20, 16,100,  8,  0,  0,  8, 50, 16,  0,  0, 16,100, 12,  0,  0,  8, 50, 24,  0,  0, 16,100,  8,  0,  0,  8,100, 16,  0,  0, 16,200,  0, 10,  0,  8, 50,  0, 20,  0, 16,100



;-----------------------menu ingredient check
smallLarge          DB  ?       ;0=small 1=large
indexIngStart       DB  ?
menuCheckCan        DB  ?       ;1=can,0=cannot
TWO                 DB  2
FIVE                DB  5


;-----------------------print dw
DECIMAL             DW  10000,1000,100,10,1
DWprintIn           DW  ?


;-----------------------read dw
DWreadArr           DB  0,0,0,0,0
DWreadLen           DB  ?
DWread5SubLen       DB  ?
DWreadValid         DB  ?
DWreadOut           DW  ?


;-----------------------add dw
DWaddVal1           DW  ?
DWaddVal2           DW  ?
DWaddVal3           DW  ?
DWaddCarry          DB  ?


;-----------------------sub dw
DWsubVal1           DW  ?
DWsubVal2           DW  ?
DWsubVal3           DW  ?
DWsubCan            DB  ?


;-----------------------reg
regAX               DW  ?
regBX               DW  ?
regCX               DW  ?
regDX               DW  ?
regSI               DW  ?
regDI               DW  ?

;-------------------------------------------------------- LOGIN -------------------------------------------------------------

enterUsername DB 10,13, "                           Enter Staff ID: $"							
enterPassword DB "                           Enter Password: $"							
wrongUsername DB "                           The account is not found!$"					
wrongPassword DB 10,13, "                           The password is wrong, please re-enter again.$"		
chancesRemainingP1 DB 10,13, "                           You left $"
chancesRemainingP2 DB " time(s) to attempt your password.$"    			
successLogin DB 10,13, "                            Successfully logged in!$" 						

loginCount DB '3'
count DW 0
matchCount DW 0
;---------------------------------------------------------------------------------------------------------------------------

;--------------------------------------------------------- PAGE AFTER LOGGED IN --------------------------------------------


option          DB 10,13,"                    +======================================+                   "
                DB 10,13,"                    |        1. Add/Register Staff         |"						
		        DB 10,13,"                    |        2. Delete Staff               |"	
                DB 10,13,"                    |        0. Exit                       |"							
                DB 10,13,"                    +======================================+                   "		
		        DB "$"			

choicePrompt    DB "                           Make your selection [0 to 2 only] > $"	
invalid DB 10,13, "                     The input is INVALID! Please Try again.$" 

choice DB ?

;--------------------------------------------------------------------------------------------------------------------------

;----------------------------------------------------- REGISTER/ADD STAFF ------------------------------------------------

addStaffID DB 10,13, "Add New Staff ID(Enter 0 to GO BACK) [in 6 CHARACTERS]: $"						
addPasswordPrompt DB 10,13, "Enter A Password: $"					
confirmPassPrompt DB 10,13, "Confirm Password: $"

existedUsername DB 10,13,"The account already exists! Please create a new one.$"	
successRegister DB 10,13, "Successfully registered!$" 
failRegisterReq DB 10,13, "Username should contain 6 characters$"						
differentPass DB 10,13, "The passwords are not matched, please re-enter. $"
wrongFormat DB 10,13, "The password typed does not follow the format. Please type again.$"
newPasswordChance1 DB 10,13, "You have $"
newPasswordChance2 DB " chance(s) to confirm the password.$",13,10

blankWarning DB 10,13, "Please dont leave a blank!$"

confirmPassChanceCount DB '3', '$'
userCompareCount DW 0

;----- CONTRAINT FOR PASSWORD -----	
passwordCondition DB 10,13, "+================================"					
                  DB 10,13, "| Password Conditions:"				
				  DB 10,13, "|  -atleast 1 uppercase character"
 				  DB 10,13, "|  -atleast 1 lowercase character"
 				  DB 10,13, "|  -atleast 1 digit"
 	    		  DB 10,13, "|  -contain 9 characters"
 	    		  DB 10,13, "+================================"
				  DB "$"


;--------------------------------------------------------------------------------------------------------------------------

;------------------------------------------------------- DELETE STAFF -----------------------------------------------------  

deleteUsernamePrompt DB 10,13,"Enter Staff to be Deleted (Enter 0 to GO BACK): $"						
failedDelete DB 10,13, "The account is not found, so cant delete.$"		
foundAccount DB 10,13, "The account is exist, would u like to remove it? (Y=yes, N=no):$"			
successDelete DB 10,13, "The staff has successfully deleted!$" 									
deleteDisable DB 10,13, "You cannot delete your own! Please Try using other account.$"

yesNo DB ?

;--------------------------------------------------------------------------------------------------------------------------

;------------------------------------------------------- SHARE DATA -------------------------------------------------------
		
usernameDeleteCount DW 0  
usernameCount DW 0 

;--------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------- TEMPORARY DATABASE --------------------------------------------------

user DB "Jfy123$"
usernameArray DB 28 dup('$') 	;4*7 PASSWORD(4 ACCOUNTS)

pass DB "mercyTq55$"
passArray DB 40 dup('$')		;4*10 PASSWORD(4 ACCOUNTS)

;---------------------------------------------------------------------------------------------------------------------------

;------------------------------------------------------- ALL ARRAY ---------------------------------------------------------

;**LOGIN ACCOUNT**
	inputUsername			LABEL	BYTE
	maxUsername				DB    	7
	actUsername				DB    	?
	inputData1				DB 	  	7 dup('$')

	inputPassword			LABEL 	BYTE			
	maxPassword				DB 	 	10
	actPassword				DB  	?
	inputData2				DB  	10 dup('$')

;**REGISTER ACCOUNT**
	inputNewUsername		LABEL 	BYTE
	maxNewUsername			DB  	7
	actNewUsername			DB  	?
	inputData3				DB 		7 dup('$')

	inputNewPassword		LABEL	BYTE		
	maxNewPassword			DB  	10
	actNewPassword			DB  	?
	inputData4				DB  	10 dup('$')

	inputConfirmPassword	LABEL 	BYTE	
	maxConfirmPassword		DB  	10
	actConfirmPassword		DB  	?
	inputData5				DB  	10 dup('$')

;**DELETE ACCOUNT**
	inputDeleteUsername		LABEL	BYTE
	maxDeleteUsername		DB		7
	actDeleteUsername		DB		?
	inputData6				DB 		7 dup('$')


.CODE

;----------------------------------------------Main Module -----------------------------------------------------------------------------------------
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOVE_USERNAME:
	LEA SI, user 
	LEA DI, usernameArray + 2
	MOV CX, 6
    STORE_USERNAME_INFO_ARRAY:		;1 time only
	MOV AL, [SI]
	MOV [DI], AL

	INC SI
	INC DI

	LOOP STORE_USERNAME_INFO_ARRAY

    MOVE_PASSWORD:
	LEA SI, pass
	LEA DI, passArray + 2
	MOV CX, 9 
    STORE_PASSWORD_INFO_ARRAY:		;1 time only
	MOV AL, [SI]
	MOV [DI], AL

	INC SI
	INC DI

	LOOP STORE_PASSWORD_INFO_ARRAY

        ;prompt and read username from user
    ENTER_USERNAME:	
    CALL DISPLAY_LOGO
	MOV usernameCount, 0
	MOV AH, 09H
	LEA DX, enterUsername
	INT 21H

    USERNAME_INPUT:
	MOV AH, 0AH
	LEA DX, inputUsername
	INT 21H

	CALL PRINT_NEW_LINE

	JMP STRING_LOOP

    INCREASE_COUNT:
	INC usernameCount
	INC matchCount
    STRING_LOOP:	
	CMP usernameCount, 4
	JE  BORROW_INVALID_ACC

	LEA SI, inputUsername + 2 
	LEA DI, usernameArray + 2 

	MOV AX, 0				;CLEAR
	MOV AX, usernameCount
	MOV CX, 7
	MUL CX
	ADD DI, AX

	MOV CX, 6
    ;compare the input username with the existed/stored one  	
    COMPARE_USERNAME:
	MOV AL, [SI]
	CMP AL, [DI]
	JNE INCREASE_COUNT	

	INC SI
	INC DI

	LOOP COMPARE_USERNAME
	JMP ENTER_PASSWORD

    BORROW_INVALID_ACC:
	JMP INVALID_ACC
    ;after verifying the correct username
    ENTER_PASSWORD:
	MOV AH, 09H
	LEA DX, enterPassword
	INT 21H

	MOV AH, 0AH
	LEA DX, inputPassword
	INT 21H
	
	LEA SI, inputPassword + 2
	LEA DI, passArray + 2

	MOV AX, 0			;CLEAR
	MOV AX, matchCount	;0 1 2 3
	MOV CX, 10			
	MUL CX				;0 x 10		
	ADD DI, AX          ;passArray + 2 + 0 x 10

	MOV CX, 9
    COMPARE_PASSWORD:
	MOV AL, [SI]
	CMP AL, [DI]
	JNE INVALID_PASSWORD

	INC SI
	INC DI

	LOOP COMPARE_PASSWORD
	JMP SUCCESS_LOGIN

    SUCCESS_LOGIN:
	MOV AH, 09H
	LEA DX, successLogin
	INT 21H

	JMP MENU_START

    ;if account is not found
    INVALID_ACC:
	MOV usernameCount, 0  ;CLEAR ALL
	MOV matchCount, 0	  
	MOV AH, 09H
	LEA DX, wrongUsername
	INT 21H

	CALL PRINT_NEW_LINE

	DEC CX
	JMP EXIT_PROGRAM			 



    ;if password of the account is incorrect
    INVALID_PASSWORD:
	MOV AH, 09H
	LEA DX, wrongPassword
	INT 21H

	DEC loginCount 

	MOV AH, 09H 
	LEA DX, chancesRemainingP1
	INT 21h

	MOV AH, 02H
	MOV DL, loginCount
	INT 21H 

	MOV AH,09H
	LEA DX, chancesRemainingP2
	INT 21H 

	CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE

	CMP loginCount, '0'
	JE BORROW_EXIT 

	JMP ENTER_PASSWORD	;after 3 times attempt, return back to the previous menu ;DONT FORGET TO CHANGE
    
    BORROW_ENTER_USERNAME:
    JMP ENTER_USERNAME
    BORROW_EXIT:		;USED TO JUMP TO EXIT(TOO FAR)
	JMP EXIT_PROGRAM		

    MENU_START:   
    CALL DISPLAY_MENU

    CHECK_DIGIT1:
		CMP USERCHOICE,30H
		JL INVALID1

		CMP USERCHOICE,33H
		JG INVALID1
	
	    JMP CHECK_STAFF	

	INVALID1:
		CALL DISP_ERROR
        CALL SYSTEM_PAUSE
		JMP MENU_START
    CHECK_STAFF:
        CMP USERCHOICE, '1'
        JZ  Staff
    CHECK_SALE:
        CMP USERCHOICE, '2'
        JZ  Sales
    CHECK_STOCK:
        CMP USERCHOICE, '3'
        JZ  Stock
    CHECK_EXIt:
        CMP USERCHOICE, '0'
        JZ  BORROW_ENTER_USERNAME
    Staff:
        CALL STAFF_MENU
        JMP MENU_START
    Sales:
        CALL SALES_MENU
        JMP MENU_START
    Stock:
        CALL PROC_STOCK_MENU  
        JMP MENU_START      
    EXIT_PROGRAM:
        MOV AX, 4C00H
        INT 21H
MAIN ENDP

DISPLAY_MENU PROC

    CALL DISPLAY_LOGO
    MOV DX, OFFSET STRMAINMENU
    MOV AH, 9
    INT 21H

    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, MMENUCHTXT
    INT 21H

    CALL READ_USERCHOICE ;read menu choice
    RET
DISPLAY_MENU ENDP

DISPLAY_LOGO PROC

    CALL CLEAR_SCREEN
    CALL PRINT_NEW_LINE
    MOV AH,09H
    mov bh,00
    mov bl,0DH
    mov cx,400
    int 10h
    LEA DX, LOGO
    
    INT 21H

    RET
DISPLAY_LOGO ENDP


;-------------------------------- Staff Module --------------------------------------------------------------------------------------------------------------------------------
STAFF_MENU PROC
    
    ;after successfully logged in
    MAKE_SELECTION:
    CALL DISPLAY_LOGO

	MOV AH, 09H 
	LEA DX, option
	INT 21H 

	CALL PRINT_NEW_LINE

	MOV AH, 09H 
	LEA DX, choicePrompt
	INT 21H 

	MOV AH, 01H  
	INT 21H 
	MOV choice, AL

	CMP choice, '1'
	JE BORROW_ADD_USER
	CMP choice, '2'
	JE BORROW_DELETE_USER
    CMP choice, '0'
	JE BORROW_EXIT_PROC

	MOV AH, 09H 
	LEA DX, invalid
	INT 21H 

    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE
    CALL PRINT_PRESS_ANY_KEY

	JMP MAKE_SELECTION

    BORROW_ADD_USER:		;TOO FAR TO ADD_USER(PASS IN TO JUMP TO ADD_USER)
	JMP ADD_USER
    BORROW_DELETE_USER: 	;TOO FAR TO DELETE_USER(PASS IN TO JUMP TO DELETE_USER)
	JMP DELETE_USER
    BORROW_EXIT_PROC:
    JMP EXIT_PROC

    BLANK_WARNING:
	MOV AH, 09H
	LEA DX, blankWarning
	INT 21H 
	JMP ADD_USER
	CALL PRINT_NEW_LINE

    LESS_THAN_6_CHAR:
	MOV AH, 09H
	LEA DX, failRegisterReq
	INT 21H 
    CALL PRINT_NEW_LINE

    ADD_USER:
	MOV AX, 0
	MOV userCompareCount, AX
	MOV AH, 09H
	LEA DX, addStaffID
	INT 21H 

	MOV AH, 0AH 
	LEA DX, inputNewUsername
	INT 21H 

    CALL PRINT_NEW_LINE

	LEA SI, inputNewUsername + 1		;check the length of string
	MOV AL, [SI]
	CMP AL, 0							;length of string = 0 or 0 char
	JE BLANK_WARNING

	LEA SI, inputNewUsername + 2

    CHECK_EXIT_1:
	MOV AL, [SI]
	CMP AL, '0'
	JNE CHECK_ARRAY_NUMCHAR

	INC SI

	MOV AH, [SI]
	CMP AH, 0DH
	JE  BORROW_MAKE_SELECTION_1
    
    CHECK_ARRAY_NUMCHAR:
	LEA SI, inputNewUsername + 1		;check the length of string
	MOV AL, [SI]
	CMP AL, 6							;length of string < 6 
	JL LESS_THAN_6_CHAR
	JMP COMPARE_NEW_USERNAME
    
    BORROW_MAKE_SELECTION_1:
	JMP MAKE_SELECTION
    
    NEW_USERNAME_COUNT:
	INC userCompareCount
    
    COMPARE_NEW_USERNAME:
	CMP userCompareCount, 4
	JE  ACCEPT_NEW_PASSWORD  

	LEA SI, inputNewUsername + 2
	LEA DI, usernameArray + 2 
	MOV AX, userCompareCount
	MOV CX, 7			
	MUL CX				;0 x 7		
	ADD DI, AX          ;usernameArray + 2 + 0 x 7

	MOV CX, 6
    
    COMPARE_NEW_USERNAME_ARRAY:	
	MOV AL, [SI]
	CMP AL, [DI]
	JNE NEW_USERNAME_COUNT				;if found 1 of them is not same

	INC SI
	INC DI

	LOOP COMPARE_NEW_USERNAME_ARRAY
    
    EXISTED_USER:
	MOV AH, 09H 
	LEA DX, existedUsername
	INT 21H 

	CALL PRINT_NEW_LINE

	JMP ADD_USER

    ;after comparing the new username with existed username
    ACCEPT_NEW_PASSWORD:		;store into array
    CALL PRINT_NEW_LINE
	MOV confirmPassChanceCount, '3'
	MOV AH, 09H 
	LEA DX, passwordCondition
	INT 21H 
	
	MOV AH, 09H 
	LEA DX, addPasswordPrompt
	INT 21H 

	MOV AH, 0AH 
	LEA DX, inputNewPassword
	INT 21H 

	LEA SI, inputNewPassword + 2
	MOV DL, '0'
	MOV BL, '0'
	MOV CL, '0'
    
    CHECK_VALIDATE_PASSWORD:		
	MOV AL, [SI]
	CMP AL, '$'						   ;CHECK WHETHER IT IS A NULL
	JE  DONE_CHECKING

    
    CHECK_DIGIT:
	CMP AL, '0'
	JL 	CHECK_UPPERCASE
	CMP AL, '9'
	JG 	CHECK_UPPERCASE
	INC DL								;USE TO CHECK AT DONE_CHECKING PART
    
    CHECK_UPPERCASE:
	CMP AL, 'A'
	JL 	CHECK_LOWERCASE
	CMP AL, 'Z'
	JG  CHECK_LOWERCASE
	INC BL
    
    CHECK_LOWERCASE:
	CMP AL, 'a'
	JL 	CHECK_NEXT_CHAR
	CMP AL,	'z'
	JG  CHECK_NEXT_CHAR
	INC CL
    
    CHECK_NEXT_CHAR:
	INC SI
	JMP CHECK_VALIDATE_PASSWORD
    
    DONE_CHECKING:
	CMP DL, '0'						;at check_digit
	JE ERROR_VALIDATE_PASSWORD
	CMP BL, '0'						;at check_uppercase
	JE ERROR_VALIDATE_PASSWORD
	CMP CL, '0'						;at check_lowercase
	JE ERROR_VALIDATE_PASSWORD
	LEA SI, inputNewPassword + 1
	MOV AL, [SI]					;must contain 9 char
	CMP AL, 9
	JL  ERROR_VALIDATE_PASSWORD
	JMP CONFIRM_PASSWORD
    
    ERROR_VALIDATE_PASSWORD:
	MOV AH, 09H 
	LEA DX, wrongFormat
	INT 21H 
	CALL PRINT_NEW_LINE
	JMP ACCEPT_NEW_PASSWORD
	
    CONFIRM_PASSWORD: 
	MOV AH, 09H 
	LEA DX, confirmPassPrompt
	INT 21H 

	MOV AH, 0AH 
	LEA DX, inputConfirmPassword
	INT 21H 

	LEA SI, inputNewPassword + 2
	LEA DI, inputConfirmPassword + 2
	MOV CX, 9 
    
    COMPARE_NEW_PASSWORD:
	MOV AL, [SI]
	CMP AL, [DI]
	JNE WRONG_PASSWORD

	INC SI
	INC DI 

	LOOP COMPARE_NEW_PASSWORD
	JMP SUCCESS_REGISTER
    
    WRONG_PASSWORD:
	CALL PRINT_NEW_LINE

	MOV AH, 09H 
	LEA DX, differentPass
	INT 21H 

	MOV AH, 09H 
	LEA DX, newPasswordChance1
	INT 21H 

	MOV AH, 09H
	LEA DX, confirmPassChanceCount 
	INT 21H 

	MOV AH, 09H 
	LEA DX, newPasswordChance2
	INT 21H 

	CMP confirmPassChanceCount, '0'
	JE  BORROW_ACCEPT_NEW_PASSWORD

	DEC confirmPassChanceCount

	JMP CONFIRM_PASSWORD
    
    BORROW_ACCEPT_NEW_PASSWORD:
	JMP ACCEPT_NEW_PASSWORD
    
    SUCCESS_REGISTER:
	INC count
	MOV AH, 09H
	LEA DX, successRegister
	INT 21H 

    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE
    CALL PRINT_PRESS_ANY_KEY

	MOV AX, 0
	LEA SI, inputNewUsername + 2
	LEA DI, usernameArray + 2 
	MOV AX, count		;1 (starting from 1)...
	MOV CX, 7			
	MUL CX				;1 x 7	...	
	ADD DI, AX          ;usernameArray + 2 + 1 x 7...

	MOV CX, 6
    
    STORE_NEW_USERNAMEARRAY:
	MOV AL, [SI]
	MOV [DI], AL

	INC SI
	INC DI

	LOOP STORE_NEW_USERNAMEARRAY

	MOV AX, 0
	LEA SI, inputConfirmPassword + 2
	LEA DI, passArray + 2 
	MOV AX, count		;1 (follows username array sequence)...
	MOV CX, 10			
	MUL CX				;1 x 10...
	ADD DI, AX          ;usernameArray + 2 + 1 x 10...

	MOV CX, 9
    
    STORE_NEW_PASSWORDARRAY:	
	MOV AL, [SI]
	MOV [DI], AL

	INC SI 
	INC DI 

	LOOP STORE_NEW_PASSWORDARRAY

	JMP MAKE_SELECTION

    
    BORROW_MAKE_SELECTION_3:
	JMP MAKE_SELECTION
    
    DELETE_USER: ;cannot delete own account
	MOV AX, 0
	MOV usernameDeleteCount,AX
	MOV AH, 09H
	LEA DX, deleteUsernamePrompt
	INT 21H 

	MOV AH, 0AH 
	LEA DX, inputDeleteUsername 
	INT 21H
	
	LEA DI, inputDeleteUsername + 2
    
    CHECK_EXIT_2:
	MOV AH, [DI]
	CMP AH, '0'
	JNE CHECK_DELETE

	INC DI

	MOV AH, [DI]
	CMP AH, 0DH
	JE  BORROW_MAKE_SELECTION_3

    CHECK_DELETE:
	LEA SI, inputUsername + 2
	LEA DI, inputDeleteUsername + 2
	MOV CX, 7
    DELETE_ACCOUNT_DISABLE:				;CANNOT DELETE OWN ACCOUNT
	MOV AL, [SI]
	CMP AL, [DI]
	JNE DELETE_ACCOUNT_ENABLE

	INC SI
	INC DI

	LOOP DELETE_ACCOUNT_DISABLE
	JMP SELF_ACCOUNT

    CHECK_AVAILABILITY:
	MOV AX, usernameCount
	CMP AX, usernameDeleteCount
	JE  SELF_ACCOUNT

	JMP CONFIRM_DELETE		

    TRY_ANOTHER_ACCONT:
	INC usernameDeleteCount

    DELETE_ACCOUNT_ENABLE:
	CMP usernameDeleteCount, 4
	JE  NOT_FOUND

	LEA SI,	inputDeleteUsername + 2
	LEA DI, usernameArray + 2	

	MOV AX, 0
	MOV AX, usernameDeleteCount		
	MOV CX, 7			
	MUL CX							;e.g 0 x 7		
	ADD DI, AX          			;e.g usernameArray + 2 + 0 x 7

	MOV CX, 6
    CHECK_ACCOUNT_FOUND:
	MOV AL, 0
	MOV AL, [SI]
	CMP AL, [DI]
	JNE TRY_ANOTHER_ACCONT

	INC SI	
	INC DI

	LOOP CHECK_ACCOUNT_FOUND
	JMP CHECK_AVAILABILITY

    NOT_FOUND:
	MOV AH, 09H
	LEA DX, failedDelete
	INT 21H 
    CALL PRINT_NEW_LINE
	JMP DELETE_USER
    SELF_ACCOUNT:
	MOV AH, 09H
	LEA DX, deleteDisable
	INT 21H 
    CALL PRINT_NEW_LINE
	JMP DELETE_USER
    CONFIRM_DELETE:
	MOV AH, 09H
	LEA DX, foundAccount
	INT 21H 

	MOV AH, 01H
	MOV AL, yesNo
	INT 21H 

	CMP AL, 'Y' 
	JE  DELETE_USERNAME_DETAILS
	CMP AL, 'y'
	JE  DELETE_USERNAME_DETAILS
	CMP AL, 'N'
	JE  BORROW_MAKE_SELECTION_2
	CMP AL, 'n'
	JE  BORROW_MAKE_SELECTION_2

	MOV AH, 09H
	LEA DX, invalid
	INT 21H 
	JMP CONFIRM_DELETE
    BORROW_MAKE_SELECTION_2:
	JMP MAKE_SELECTION
    DELETE_USERNAME_DETAILS: 
	LEA SI, usernameArray + 2
	MOV AX, 0
	MOV AX, usernameDeleteCount		
	MOV CX, 7			
	MUL CX							;e.g 0 x 7		
	ADD SI, AX          			;e.g usernameArray + 2 + 0 x 7

	MOV CX, 6
    REPLACE_USERNAME:
	MOV AH, '$'  
	MOV [SI], AH
	
	INC SI

	LOOP REPLACE_USERNAME

    DELETE_PASS_DETAILS:
	MOV AX, 0
	LEA SI, usernameArray + 2
	MOV AX, usernameDeleteCount		
	MOV CX, 10			
	MUL CX							;e.g 0 x 10		
	ADD SI, AX          			;e.g usernameArray + 2 + 0 x 10

	MOV CX, 9
    REPLACE_PASSWORD:
	MOV AH, '$'  
	MOV [SI], AH
	
	INC SI

	LOOP REPLACE_PASSWORD
    ;END REPLACE_PASSWORD
	MOV AH, 09H
	LEA DX, successDelete
	INT 21H 

    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE
    CALL PRINT_PRESS_ANY_KEY
    
	JMP MAKE_SELECTION
    EXIT_PROC:
    RET
STAFF_MENU ENDP

;-----------------------------------------------Sales Main Module -------------------------------------------------------------------------------------------
SALES_MENU PROC
    SALES_MENU_START:
    CALL DISPLAY_LOGO
    MOV DX, OFFSET STRSALESMENU 
    MOV AH, 09H
    INT 21H
 
    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, SALESCHTXT ;prompt read sale menu message
    INT 21H

    CALL READ_USERCHOICE

    CHECK_DIGIT3:
		CMP USERCHOICE,30H
		JL INVALID3

		CMP USERCHOICE,33H
		JG INVALID3
	
	    JMP CHECK_MENU	
	INVALID3:
		CALL DISP_ERROR
        CALL SYSTEM_PAUSE
		JMP SALES_MENU_START

    CHECK_MENU:
    CMP USERCHOICE, '1'
    JZ  START_MENU

    CHECK_SUMMARY:
    CMP USERCHOICE, '2'
    JZ  START_ORDER

    CHECK_ORDER:
    CMP USERCHOICE, '3'
    JZ  START_SUMMARY

    CHECK_BACK:
    CMP USERCHOICE, '0'
    JZ  CALL_BACK_SALES_MENU

    START_MENU:
    CALL DISPLAY_LOGO
    CALL DISPLAY_BEVERAGE_MENU
    CALL SYSTEM_PAUSE
    JMP SALES_MENU_START

    START_ORDER:
    CALL ORDER
    JMP SALES_MENU_START

    START_SUMMARY:
    CALL SUMMARY
    JMP SALES_MENU_START

    CALL_BACK_SALES_MENU:

    RET
SALES_MENU ENDP

ORDER PROC
    CALL CLEAR_QUANTITY
    
        LEA DI,ingredient_buffer
        MOV CX,5
        CLEAR_INGREDIENT:
        MOV DX,0
        MOV [DI],DX                     ;add to buffer

        INC DI
        INC DI
    
        LOOP CLEAR_INGREDIENT

    ORDER_START:     
    CALL DISPLAY_LOGO
    CALL DISPLAY_BEVERAGE_MENU
    CALL DISPLAY_SPECIAL_MSG
    
    CALL BEVERAGE_INPUT ;input beverage choice
    CALL QUANTITY_INPUT ;input beverage quantity

    SIZE_INPUT:     
        CALL PRINT_NEW_LINE
        MOV AH,09H	
		LEA DX,SIZEMSG		
		INT 21H

        CALL READ_USERCHOICE

		CMP USERCHOICE,"Y"
		JE SIZE_UPGRADE		
		CMP USERCHOICE,"y"
		JE SIZE_UPGRADE
        CMP USERCHOICE,"N"
		JE NO_SIZE_UPGRADE		
		CMP USERCHOICE,"n"
		JE NO_SIZE_UPGRADE
	
	    JMP INVALID_YES_NO4

	INVALID_YES_NO4: 
		CALL DISP_ERROR
		JMP SIZE_INPUT

    SIZE_UPGRADE: 
        MOV UPGRADE_CHECK,1
        CALL ADD_UPGRADE_DRINK
        MOV smallLarge,1
        JMP CONFIRM_DRINK

    NO_SIZE_UPGRADE:
        MOV UPGRADE_CHECK,0
        MOV smallLarge,0
	CONFIRM_DRINK:
        CALL PRINT_NEW_LINE
        MOV AH,09H	
		LEA DX,CONFIRMDRINK		
		INT 21H 

        CALL READ_USERCHOICE

        CMP USERCHOICE,"Y"
		JE INGREDIENT_CHECK		
		CMP USERCHOICE,"y"
		JE INGREDIENT_CHECK
        CMP USERCHOICE,"N"
		JE DEDUCT_UPSIZE		
		CMP USERCHOICE,"n"
		JE DEDUCT_UPSIZE

        JMP INVALID_YES_NO1
    
    DEDUCT_UPSIZE:

        CMP UPGRADE_CHECK,1
        JE APPLY_DEDUCT
        JNE NO_APPLY_DEDUCT

        APPLY_DEDUCT:
        CALL DEDUCT_UPGRADE_DRINK        ; decuct RM 2 that added

        NO_APPLY_DEDUCT:
        JMP ANY_DRINK

    INVALID_YES_NO1:
		CALL DISP_ERROR
		JMP CONFIRM_DRINK

    INGREDIENT_CHECK:
        XOR AH,AH
        MOV AL,QUANTITY
        SUB AL,30H
        MOV CX,AX
        MOV LOOP_TEMP,CL ;9

        CHECK_EVERY_BEVERAGE:
            
            CALL PROC_MENU_CHECK
            
            MOV CL,LOOP_TEMP ;9
            DEC LOOP_TEMP ;8

        LOOP CHECK_EVERY_BEVERAGE 

        CMP menuCheckCan,1
        JE ADD_QUANTITY
        JNE INVALID_INGREDIENT

    INVALID_INGREDIENT:
        
        CALL DEDUCT_UPGRADE_DRINK
        CALL DISP_ERROR_INGRE
        CALL SYSTEM_PAUSE
        JMP BACK_ORDER_AGAIN

    ADD_QUANTITY:
        MOV AH, 0     
        MOV AL, BEVERAGECHOICE  
        SUB AL, 31h  ; Convert the ASCII character to a numeric value
        LEA SI, BEVERAGEQTY  

        ADD SI,AX 
        MOV AL, QUANTITY
        SUB AL,30H
        ADD [SI], AL  ; Add the quantity to the corresponding beverage's quantity
        JMP ANY_DRINK
    
    ANY_DRINK:
        CALL PRINT_NEW_LINE
        MOV AH,09H	
		LEA DX,NEXTDRINKMSG		;PROMPT USER TO ENTER THE BEVERAGE
		INT 21H 

        CALL READ_USERCHOICE
        CMP USERCHOICE,"Y"
		JE LIMIT_CHECK		
		CMP USERCHOICE,"y"
		JE LIMIT_CHECK
        CMP USERCHOICE,"N"
		JE CONFIRM_ORDER		
		CMP USERCHOICE,"n"
		JE CONFIRM_ORDER

        JMP INVALID_YES_NO2

    INVALID_YES_NO2:
		CALL DISP_ERROR
		JMP ANY_DRINK

    LIMIT_CHECK:
        CALL LIMIT_ORDER
        CMP LIMIT_QUANTITY,20
        JL BACK_ORDER_AGAIN
        JGE INVALID_LIMIT

    INVALID_LIMIT:
        CALL DISP_ERROR_LIMIT 


    CONFIRM_ORDER:
        CALL PRINT_NEW_LINE
        MOV AH,09H	
		LEA DX,CONFIRMORDERMSG		;PROMPT USER TO ENTER THE BEVERAGE
		INT 21H 

        CALL READ_USERCHOICE

        CMP USERCHOICE,"Y"
		JE SAVE_ORDER		
		CMP USERCHOICE,"y"
		JE SAVE_ORDER
        CMP USERCHOICE,"N"
		JE CANCEL_ORDER		
		CMP USERCHOICE,"n"
		JE CANCEL_ORDER

        JMP INVALID_YES_NO3

    INVALID_YES_NO3:
		CALL DISP_ERROR
		JMP CONFIRM_ORDER
        
    SAVE_ORDER:
        MOV AH, 0     ; Clear the AH register
        
        LEA SI,BEVERAGEQTY  
        LEA DI,SUMMARYQTY

        MOV CX,5
        COPY_QUANTITY:
        MOV AL,[SI]
        ADD [DI],AX
        INC SI
        INC DI
        INC DI
        LOOP COPY_QUANTITY

        INC ORDER_COUNT
        CALL ADD_SUMMARY_UPDRADE_DRINK
    
        JMP GO_RECEIPT
    CANCEL_ORDER:
        CALL PRINT_ORDERCANCEL_MSG

        CALL SYSTEM_PAUSE
        CALL CLEAR_QUANTITY
        
        LEA SI,ingredient
        LEA DI,ingredient_buffer
        MOV CX,5

        ADD_BACK_INGREDIENT:

        MOV DX,[DI]

        ADD [SI],DX                     ;add to buffer

        INC SI
        INC SI
        INC DI
        INC DI
    
        LOOP ADD_BACK_INGREDIENT 

        JMP SKIP2

    
    BACK_ORDER_AGAIN:
        JMP ORDER_START 
    GO_RECEIPT:
        
        CALL CLEAR_SCREEN
        CALL DISPLAY_RECEIPT

    SKIP2:
		RET	 
ORDER ENDP     

;----------------------- Receipt -------------------------------------------------------
DISPLAY_RECEIPT PROC
    
    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, STRRECEIPT
    INT 21H

    CALL PRINT_ORDER_NO ;print order no

    MOV AH, 09H
    LEA DX, PRICESTR
    INT 21H

    CALL PRINT_NEW_LINE

    LEA SI,BEVERAGEQTY  ; AL to SI (SI = numeric beverage choice) 
    LEA DI,PRICEBEVERAGE

    MOV TOTALPRICE,0
    MOV TOTALQUANTITY,0
    MOV SUBTOTAL,0

    MOV CX,5 
    CALCULATE_PRICE:
    MOV LOOPCOUNT,CL
    CALL PRINT_EACH_BEVERAGE

    mov AH,00
    mov AL,[SI]
    CALL PRINT_FOUR_DIGIT ;print quantity each beverage
    CALL PRINT_EMPTY_STR

    MOV AL,[SI]
    ADD TOTALQUANTITY,AX
    MOV BL,[DI]
    MUL BL
    CALL ADD_PRICE_TO_CURRENT

    XOR DH,DH
    ADD AX,DX
    ADD TOTALPRICE,AX   

    CALL PRINT_FOUR_DIGIT ;print price each beverage

    CALL PRINT_NEW_LINE

    INC SI ;next beverage quantity
    INC DI ;next beverage price

    LOOP CALCULATE_PRICE
 ;-------------------------
    CALL PRINT_BAR

    CALL PRINT_TOTALQTY
    CALL PRINT_NEW_LINE
    CALL PRINT_TOTALPRICE
    CALL PRINT_NEW_LINE

    CALL PRINT_DICOUNT_TAX

    CALL PRINT_NEW_LINE
    CALL PRINT_BAR
 ;--------------------------    
    CALL PRINT_TQNOTE

    CMP TOTALQUANTITY,0   ;check it is empty order
    JG PROCEED_PAYMENT    ;if no empty proceed
    JGE EMPTY_ORDER       ;if empty deduct order count

    PROCEED_PAYMENT:
    CALL PAYMENT
    JMP END_RECEIPT
    
    EMPTY_ORDER:
    DEC ORDER_COUNT

    END_RECEIPT:
    CALL SYSTEM_PAUSE
    
    
    RET
DISPLAY_RECEIPT ENDP

SUMMARY PROC
    CALL CLEAR_SCREEN
    CALL PRINT_NEW_LINE
    MOV DX, OFFSET STRSUMMARY
    MOV AH, 9
    INT 21H

    CALL PRINT_TOTALORDER_NO

    MOV AH, 09H
    LEA DX, PRICESTR
    INT 21H

    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE

    LEA SI,SUMMARYQTY  ; AL to SI (SI = numeric beverage choice) 
    LEA DI,PRICEBEVERAGE

    MOV TOTALPRICE,0
    MOV TOTALQUANTITY,0
    MOV SUBTOTAL,0
    MOV CX,5

    CALCULATE_SUMMARY_PRICE:
    MOV LOOPCOUNT,CL
    CALL PRINT_EACH_BEVERAGE

    mov AH,00
    mov AX,[SI]
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_EMPTY_STR

    MOV AX,[SI]
    ADD TOTALQUANTITY,AX
    MOV BH,00
    MOV BL,[DI]
    MUL BX
    CALL ADD_SUMMARYPRICE_TO_CURRENT
    ADD AX,DX ;summary upgrade price + current each beverage price

    ADD TOTALPRICE,AX  

    CALL PRINT_FOUR_DIGIT
    CALL PRINT_NEW_LINE

    INC SI
    INC SI ;next beverage quantity
    INC DI ;next beverage price

    LOOP CALCULATE_SUMMARY_PRICE
 ;--------------------------   
    CALL PRINT_BAR
    CALL PRINT_NEW_LINE

    CALL PRINT_TOTALQTY
    CALL PRINT_NEW_LINE
    CALL PRINT_TOTALPRICE
    CALL PRINT_NEW_LINE


    CALL SUMMARY_DICOUNT_TAX

    CALL PRINT_NEW_LINE
    CALL PRINT_BAR
 ;-----------------------------
    CALL PRINT_TQNOTE

    CALL SYSTEM_PAUSE
    RET
SUMMARY ENDP
;---------------------------Payment-----------------------------------------------------
PAYMENT PROC
   
    PAYMENT_START:
    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, PAYMENTSTR
    INT 21H

    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, METHODSTR
    INT 21H

    CALL READ_USERCHOICE

    CHECK_DIGIT5:
		CMP USERCHOICE,31H
		JL INVALID5

		CMP USERCHOICE,32H
		JG INVALID5
	
	    JMP CHECK_CASH	
	INVALID5:
		CALL DISP_ERROR
		JMP PAYMENT_START

    CHECK_CASH:
        CMP USERCHOICE, '1'
        JZ  CASH
    CHECK_QRPAY:
        CMP USERCHOICE, '2'
        JZ  QRPAY
   
    CASH:
        CALL CASH_FUNCTION
        JMP RETURN
    QRPAY:
        CALL QRPAY_FUNCTION
        JMP RETURN

    RETURN:        
    RET

PAYMENT ENDP

QRPAY_FUNCTION PROC
    QRPAY_START:

        CALL PRINT_NEW_LINE
        CALL PRINT_BAR

        MOV AH, 09H
        mov bh,00
        mov bl,02
        mov cx,53
        int 10h
        LEA DX, WALLETSTR   
        INT 21H

        MOV AX,SUBTOTAL
        CALL PRINT_FOUR_DIGIT
        CALL PRINT_SUBTOTAL_FPOINT


        CALL PRINT_NEW_LINE
        CALL PRINT_BAR
        RET


    RET        
QRPAY_FUNCTION ENDP

CASH_FUNCTION PROC
    CASH_START:
        MOV CASHINPUT_BOTH,0
        CALL PRINT_NEW_LINE
        MOV AH, 09H
        LEA DX, CASHSTR  ;promt input cash amount
        INT 21H

        MOV AH,0AH              ;INPUT CASH AS STRING
        LEA DX,CASHINPUT_STR
        INT 21H
	
	    MOV CH,0
	    MOV CL,CASHINPUT_ACTN
	    MOV SI,0
	    
	    CHECK_STRING_DIGIT:
		    CMP CASHINPUT[SI],30H
		    JL INVALID_CASH_INPUT1

		    CMP CASHINPUT[SI],39H
		    JG INVALID_CASH_INPUT1
	
		    INC SI
	
	    LOOP CHECK_STRING_DIGIT
    JMP RESUME3 

    INVALID_CASH_INPUT1:
        CALL DISP_ERROR
		JMP CASH_START

    RESUME3:  
          
        CMP CASHINPUT_ACTN,4
        JE FOUR_CHAR
        CMP CASHINPUT_ACTN,3
        JE THREE_CHAR
        CMP CASHINPUT_ACTN,2
        JE TWO_CHAR
        CMP CASHINPUT_ACTN,1
        JE ONE_CHAR

            FOUR_CHAR:
	        CALL FOUR_CHAR_CAL
            JMP RESUME2
            
            THREE_CHAR:
            CALL THREE_CHAR_CAL
            JMP RESUME2
            
            TWO_CHAR:
            MOV SI,1
            XOR AH,AH
            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            ADD CASHINPUT_BOTH,AX
	
		    DEC SI

            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL TEN
            MOV AH,00
            ADD CASHINPUT_BOTH,AX
            JMP RESUME2
            
            ONE_CHAR:
            MOV SI,0
            XOR AH,AH
            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            ADD CASHINPUT_BOTH,AX
        
        RESUME2:
        CALL BALANCE_FPOINT

        MOV AX,SUBTOTAL
        MOV BX,CASHINPUT_BOTH
        CMP BX,AX
        JLE  INVALID_CASH_INPUT

        ADD BX,ROUNDUP
        SUB BX,AX
        
        MOV BALANCE,BX

        CALL PRINT_BALANCE
        CALL PRINT_BALANCE_FPOINT

        RET

    INVALID_CASH_INPUT:
        MOV CASHINPUT_BOTH,0
        CALL DISP_ERROR
		JMP CASH_START

    RET        
CASH_FUNCTION ENDP

FOUR_CHAR_CAL PROC
    
    MOV SI,3
            XOR AH,AH
            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            ADD CASHINPUT_BOTH,AX
	
		    DEC SI

            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL TEN
            MOV AH,00
            ADD CASHINPUT_BOTH,AX
	
		    DEC SI

            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL HUNDRED
            MOV AH,00
            ADD CASHINPUT_BOTH,AX

            DEC SI

            XOR AH,AH
            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL THOUSAND
            XOR DX,DX
            ADD CASHINPUT_BOTH,AX


            RET
FOUR_CHAR_CAL ENDP

THREE_CHAR_CAL PROC
    MOV SI,2
            XOR AH,AH
            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MOV AH,00
            ADD CASHINPUT_BOTH,AX
	
		    DEC SI

            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL TEN
            MOV AH,00
            ADD CASHINPUT_BOTH,AX
	
		    DEC SI

            MOV AL,CASHINPUT[SI]
            SUB AL,30H
            MUL HUNDRED
            ADD CASHINPUT_BOTH,AX
            RET

THREE_CHAR_CAL ENDP

BALANCE_FPOINT PROC
    ;total up tax fpoint
    MOV AX,1000
    MOV BX,TOTALFPOINT

    CMP BX,AX
    JL ROUNDUP_APPLY1
    JMP RESUME5
    ROUNDUP_APPLY1:
    mov ROUNDUP,-1
    JMP RESUME6

    RESUME5:
    mov ROUNDUP,0
    RESUME6:
    SUB AX,BX
    XOR DX,DX
    div THOUSAND
    mov B_FPOINT1,DX

    MOV AX,B_FPOINT1
    div HUNDRED
    mov B_FPOINT3,AH
    mov B_FPOINT2,AL

    mov AH,00  ;clear ah
    mov AL,B_FPOINT3
    div TEN
    mov B_FPOINT4,AH
    mov B_FPOINT3,AL
    
    RET
BALANCE_FPOINT ENDP

;----------------------------------------------- Calculate Tax and Discount -----------------------------------------------------------------------------------------------
CAL_TAX PROC
    
    XOR DX,DX
    MOV AX,TOTALPRICE
    MOV BX,5  ;5%
    MUL BX
    MOV BX,100
    DIV BX
    
    MOV TAX,AX
  
    MOV AX,DX
    ADD TOTAL_TAX_FPOINT1,AX

    DIV HUNDRED
    MOV TFPOINT3,AL
    MOV TFPOINT1,AH

    MOV AH,00
    MOV AL,TFPOINT1
    DIV TEN
    MOV TFPOINT1,AL
    MOV TFPOINT2,AH

    RET

CAL_TAX ENDP

CAL_DISCOUNT PROC
    XOR DX,DX
    MOV AX,TOTALPRICE
    MOV BX,10  ;10 %
    MUL BX
    MOV BX,100
    DIV BX

    MOV DISCOUNT,AX

    ADD TOTAL_DISCOUNT,AX

    MOV AX,DX
    ADD TOTAL_DISCOUNT_FPOINT1,AX 
 
    ;discount floating point
    DIV HUNDRED
    MOV DFPOINT3,AL
    MOV DFPOINT1,AH

    MOV AH,00
    MOV AL,DFPOINT1
    DIV TEN
    MOV DFPOINT1,AL
    MOV DFPOINT2,AH

    RET
CAL_DISCOUNT ENDP

SUMMARY_DISCOUNT PROC 
    MOV AX,TOTAL_DISCOUNT_FPOINT1
     
    CMP AX,100
    JGE ROUNDUP_APPLY2
    JMP RESUME7

    ROUNDUP_APPLY2:
    SUB TOTAL_DISCOUNT_FPOINT1,100
    mov DISCOUNT_ROUNDUP,1
    JMP RESUME8

    RESUME7:
    mov DISCOUNT_ROUNDUP,0
     
    RESUME8: 
    ;discount floating point
    MOV AX,TOTAL_DISCOUNT_FPOINT1
    DIV HUNDRED
    MOV DFPOINT3,AL
    MOV DFPOINT1,AH

    MOV AH,00
    MOV AL,DFPOINT1
    DIV TEN
    MOV DFPOINT1,AL
    MOV DFPOINT2,AH

    MOV AL,DISCOUNT_ROUNDUP
    XOR AH,AH
    ADD TOTAL_DISCOUNT,AX
    

    RET
SUMMARY_DISCOUNT ENDP

SUMMARY_DICOUNT_TAX PROC
    ;-------------Set Value empty----------------
    MOV DISCOUNT,0
    MOV DFPOINT1,0
    MOV DFPOINT2,0
    MOV DFPOINT3,0

    CALL CAL_TAX

    MOV AH, 09H
    LEA DX, TAXSTR  ;print tax string message
    INT 21H

    MOV AX,TAX
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_TAX_FPOINT

    CALL SUMMARY_DISCOUNT    
    
    CALL PRINT_NEW_LINE
    
    MOV AH, 09H
    LEA DX, DISCOUNTSTR  ;print discout string message
    INT 21H


    MOV AX,TOTAL_DISCOUNT
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_DISCOUNT_FPOINT


     CALL TOTAL_UP_FPOINT ;sum all floating point
    
    ;subtotal
    MOV AX,TOTALPRICE
    MOV BX,TAX
    ADD AX,BX  ;  totalprice + tax

    MOV BX,TOTAL_DISCOUNT
    SUB AX,BX  ;  totalprice - DISCOUNT

    MOV BX,ROUNDUP
    ADD AX,BX
    MOV SUBTOTAL,AX

    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, TOTALBARSTR
    INT 21H

    MOV AH, 09H
    LEA DX, SUBTOTALSTR
    INT 21H

    MOV AX,SUBTOTAL
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_SUBTOTAL_FPOINT

    RET
SUMMARY_DICOUNT_TAX ENDP

PRINT_DICOUNT_TAX PROC
    MOV DISCOUNT,0
    MOV DFPOINT1,0
    MOV DFPOINT2,0
    MOV DFPOINT3,0
    
    MOV AH, 09H
    LEA DX, TAXSTR
    INT 21H
    MOV AH,00

    CALL CAL_TAX

    MOV AX,TAX
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_TAX_FPOINT

    ;-------------------------- discount ---------------------------------------------------------
    CMP TOTALQUANTITY,3
    JG DISCOUNT_APPLY

    JMP RESUME1

    DISCOUNT_APPLY:
    CALL CAL_DISCOUNT

    RESUME1:
    CALL PRINT_NEW_LINE
    

    MOV AH, 09H
    LEA DX, DISCOUNTSTR
    INT 21H

    MOV AX,DISCOUNT
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_DISCOUNT_FPOINT

    ;---------------------- Subtotal --------------------------------------------------------
    CALL TOTAL_UP_FPOINT
    
    ;subtotal
    MOV AX,TOTALPRICE
    MOV BX,TAX
    ADD AX,BX  ;  totalprice + tax

    MOV BX,DISCOUNT
    SUB AX,BX  ;  totalprice - DISCOUNT

    MOV BX,ROUNDUP
    ADD AX,BX
    MOV SUBTOTAL,AX

    CALL PRINT_NEW_LINE
    MOV AH, 09H
    LEA DX, TOTALBARSTR
    INT 21H

    MOV AH, 09H
    LEA DX, SUBTOTALSTR
    INT 21H

    MOV AX,SUBTOTAL
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_SUBTOTAL_FPOINT

    
    RET
PRINT_DICOUNT_TAX ENDP

;--------------------------------------------- Upgrade Drink -> Price + RM2 -------------------------------------------------------------------------------------------------
ADD_SUMMARY_UPDRADE_DRINK PROC

    LEA SI,UPGRADEDRINKPRICE  
    LEA DI,SUMMARY_UPGRADE_DRINKPRICE

    MOV CX,5
    ADD_SUMMARY_UPSIZE:
        MOV BL, [SI]
        XOR BH,BH
        ADD [DI], BX  
        MOV BX,[DI] 

        INC SI
        INC DI 
        INC DI
    LOOP ADD_SUMMARY_UPSIZE  

    RET
ADD_SUMMARY_UPDRADE_DRINK ENDP

ADD_UPGRADE_DRINK PROC

    XOR AH,AH    
    MOV AL, BEVERAGECHOICE  
    SUB AL, 31h  ; Convert to numeric index choice
    LEA SI, UPGRADEDRINKPRICE

    ADD SI,AX
    MOV AL, 2
    MOV BL, QUANTITY
    SUB BL,30H
    MUL BL
    ADD [SI], AL  ; Add the upgraded drink price to array    

    RET
ADD_UPGRADE_DRINK ENDP
    
DEDUCT_UPGRADE_DRINK PROC
    XOR AH,AH      
    MOV AL, BEVERAGECHOICE  
    SUB AL, 31h  ; Convert to numeric index choice
    LEA SI, UPGRADEDRINKPRICE

    ADD SI,AX
    MOV AL, 2
    MOV BL, QUANTITY
    SUB BL,30H
    MUL BL
    SUB [SI], AL  ; Add the quantity to the corresponding beverage's quantity    

    RET
DEDUCT_UPGRADE_DRINK ENDP

CLEAR_UPGRADE_DRINK PROC

    MOV UPGRADEDRINKPRICE[0],0
    MOV UPGRADEDRINKPRICE[1],0
    MOV UPGRADEDRINKPRICE[2],0
    MOV UPGRADEDRINKPRICE[3],0
    MOV UPGRADEDRINKPRICE[4],0

    RET
CLEAR_UPGRADE_DRINK ENDP

ADD_PRICE_TO_CURRENT PROC
    
    CMP LOOPCOUNT,5
    JE ADD_1
    CMP LOOPCOUNT,4
    JE ADD_2
    CMP LOOPCOUNT,3
    JE ADD_3
    CMP LOOPCOUNT,2
    JE ADD_4
    CMP LOOPCOUNT,1
    JE ADD_5
    
    ADD_1:
    MOV DL,UPGRADEDRINKPRICE[0]
    RET
    ADD_2:
    MOV DL, UPGRADEDRINKPRICE[1]  
    RET
    ADD_3:
    MOV DL, UPGRADEDRINKPRICE[2]   
    RET
    ADD_4:
    MOV DL, UPGRADEDRINKPRICE[3]    
    RET
    ADD_5:
    MOV DL, UPGRADEDRINKPRICE[4]  
    RET

ADD_PRICE_TO_CURRENT ENDP

ADD_SUMMARYPRICE_TO_CURRENT PROC
    
    CMP LOOPCOUNT,5
    JE ADDSUMMARY_1
    CMP LOOPCOUNT,4
    JE ADDSUMMARY_2
    CMP LOOPCOUNT,3
    JE ADDSUMMARY_3
    CMP LOOPCOUNT,2
    JE ADDSUMMARY_4
    CMP LOOPCOUNT,1
    JE ADDSUMMARY_5
    
    ADDSUMMARY_1:
    MOV DX,SUMMARY_UPGRADE_DRINKPRICE[0]
    RET
    ADDSUMMARY_2:
    MOV DX, SUMMARY_UPGRADE_DRINKPRICE[2]   
    RET

    ADDSUMMARY_3:
    MOV DX, SUMMARY_UPGRADE_DRINKPRICE[4]    
    RET

    ADDSUMMARY_4:
    MOV DX, SUMMARY_UPGRADE_DRINKPRICE[6]     
    RET

    ADDSUMMARY_5:
    MOV DX, SUMMARY_UPGRADE_DRINKPRICE[8]    
    RET

ADD_SUMMARYPRICE_TO_CURRENT ENDP

;------------------------------------------------------------------ Sales Modules Tools --------------------------------------------------------------------------------------

LIMIT_ORDER PROC ;calculate current order quantity
    
    MOV AH,0
    MOV LIMIT_QUANTITY,0
    LEA SI, BEVERAGEQTY  

    MOV CX,5

    ADD_LIMIT_QUANTITY:

        MOV AL,[SI]
        ADD LIMIT_QUANTITY,AL

        INC SI
    LOOP ADD_LIMIT_QUANTITY
    RET
LIMIT_ORDER ENDP

CLEAR_QUANTITY PROC
    MOV AH, 0     ; Clear the AH register
    LEA SI, BEVERAGEQTY  ; AL to SI (SI = numeric beverage choice)

    MOV CX,5 ;loop 5 time
    CLEAR_QTY:
    MOV [SI],AH
    INC SI
    LOOP CLEAR_QTY

    CALL CLEAR_UPGRADE_DRINK
        

    RET
CLEAR_QUANTITY ENDP

PRINT_ORDERCANCEL_MSG PROC
        MOV AH,09H
        mov bh,00
        mov bl,04
        mov cx,70
        INT 10H
        LEA DX,ORDERCANCELSTR		;PROMPT ORDER CANCEL MESSAGE
		INT 21H 

        REt
PRINT_ORDERCANCEL_MSG ENDP

PRINT_EMPTY_STR PROC
    MOV AH,09H
    LEA DX, EMPTYSTR 
    INT 21H
    MOV AH,00
    RET

PRINT_EMPTY_STR ENDP

PRINT_BAR PROC
    MOV AH,09H
    mov bh,00
    mov bl,0BH
    mov cx,75
    int 10h
    LEA DX,BARSTR  
    INT 21H
    MOV AH,00
    RET

PRINT_BAR ENDP

PRINT_TQNOTE PROC
    MOV AH,09H
    mov bh,00
    mov bl,02H
    mov cx,75
    int 10h
    LEA DX,THANKYOU  
    INT 21H
    MOV AH,00
    RET

PRINT_TQNOTE ENDP

HIDE_ZERO PROC
    
    ;20040
    CMP DX,00H
    JE CHECK_OCCUR
    JNE CHECK_NO_OCCUR
     
    CHECK_OCCUR:
    MOV DIGITCHECK1,0 ;current
    JMP FINAL_CHECK

    CHECK_NO_OCCUR:
    MOV DIGITCHECK1,1 ;current
    JMP FINAL_CHECK

    FINAL_CHECK:
    CMP DIGITCHECK,1
    JE NOT_NULL
    JNE FINAL_CHECK1

    FINAL_CHECK1:
    CMP DIGITCHECK1,0
    JE NULL
    JNE NOT_NULL
 
    NULL:
    MOV AL,DIGITCHECK1
    MOV DIGITCHECK,AL
    mov DX,207

    NOT_NULL:
    MOV AL,DIGITCHECK1
    MOV DIGITCHECK,AL
    RET
HIDE_ZERO ENDP

PRINT_FOUR_DIGIT PROC
    MOV DIGITCHECK,1

    XOR DX,DX
    div TENK
    mov Dwremainder,DX
    mov DWfirstDigit,AX

    MOV AX,Dwremainder
    XOR DX,DX
    div THOUSAND
    mov Dwremainder1,DX
    mov Dwremainder,AX

    MOV AX,Dwremainder1
    div HUNDRED
    mov remainder1,AH
    mov remainder,AL

    mov AH,00  ;clear ah
    mov AL,remainder1
    div TEN
    mov remainder2,AH
    mov remainder1,AL

    mov dX,DWfirstDigit ;print first digit 
    CMP DX,00H
    JE NULL1
    JNE NOT_NULL1
    NULL1:
    mov DX,207
    MOV DIGITCHECK,0
    NOT_NULL1:
    add dX,30h
    mov ah,02h
    int 21h
    
    mov dX,Dwremainder ;print second digit
    CALL HIDE_ZERO
    add dX,30h
    mov ah,02h
    int 21h
    
    mov dl,remainder ;print third digit
    CALL HIDE_ZERO
    add dl,30h
    int 21h

    mov dl,remainder1 ;print forth digit
    CALL HIDE_ZERO
    add dl,30h
    int 21h

    mov dl,remainder2 ;print five digit
    add dl,30h
    int 21h

    RET
PRINT_FOUR_DIGIT ENDP


READ_USERCHOICE PROC

    MOV AH, 01H ; ASK FOR INPUT
    INT 21H     ; STORE IN AL
    MOV USERCHOICE, AL
    RET
READ_USERCHOICE ENDP

BEVERAGE_INPUT PROC
    BEVERAGE_INPUT_START:
        CALL PRINT_NEW_LINE
		MOV AH,09H	
		LEA DX,ORDERCHTXT		
		INT 21H
		
		MOV AH, 01H
        INT 21H
        MOV BEVERAGECHOICE, AL   ;input beverage choice
    CHECK_DIGIT4:
		CMP BEVERAGECHOICE,31H   ; check between 1-5
		JL INVALID4

		CMP BEVERAGECHOICE,35H
		JG INVALID4
	
	    JMP SKIP	
	INVALID4:
		CALL DISP_ERROR
		JMP BEVERAGE_INPUT_START
    SKIP:
        RET
BEVERAGE_INPUT ENDP

QUANTITY_INPUT PROC
        QUANTITY_INPUT_START:    
        CALL PRINT_NEW_LINE
        MOV AH,09H	
		LEA DX,QUANTITYMSG		
		INT 21H
    
		MOV AH, 01H
        INT 21H
        MOV QUANTITY, AL ;input quantity input
    CHECK_DIGIT2:
		CMP QUANTITY,31H   ; check quantity between 1-9
		JL INVALID2

		CMP QUANTITY,39H
		JG INVALID2
	
	    JMP SKIP1	
	INVALID2:
		CALL DISP_ERROR
		JMP QUANTITY_INPUT_START
    
    SKIP1:
    RET
QUANTITY_INPUT ENDP

PRINT_NEW_LINE PROC
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    RET
PRINT_NEW_LINE ENDP

SYSTEM_PAUSE PROC
	CALL PRINT_NEW_LINE
	
	MOV AH,09H
	LEA DX,PRESSKEYCONT
	INT 21H

	MOV AH,01H
	INT 21H
	
	CALL CLEAR_SCREEN
	
	RET

SYSTEM_PAUSE ENDP

DISP_ERROR PROC
    CALL PRINT_NEW_LINE
    CALL PRINT_NEW_LINE
	MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,70
    int 10h
	LEA DX,ERRORSTR
	INT 21H
	
	CALL PRINT_NEW_LINE 	
    RET  
DISP_ERROR ENDP

DISP_ERROR_INGRE PROC

	CALL PRINT_NEW_LINE 	
    CALL PRINT_NEW_LINE
	MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,70
    int 10h
	LEA DX,INGREDIENT_CHECK_STR
	INT 21H
	
    RET  
DISP_ERROR_INGRE ENDP

CLEAR_SCREEN PROC
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    RET
CLEAR_SCREEN ENDP

;-------------------------------------------------------- RECEIPT & SUMMARY REPORT COMPONENT ------------------------------------------------------------------------------------
PRINT_TOTALQTY PROC
    
    MOV AH,09H
    LEA DX, TOTALQUANTITYSTR 
    INT 21H
    
    MOV AX,TOTALQUANTITY
    CALL PRINT_FOUR_DIGIT
    RET
PRINT_TOTALQTY ENDP

PRINT_TOTALORDER_NO PROC
    
    MOV AH,09H
    LEA DX, TOTAL_ORDER_NO_STR 
    INT 21H
    
    XOR AH,AH
    MOV AL,ORDER_COUNT
    CALL PRINT_FOUR_DIGIT
    CALL PRINT_NEW_LINE
    RET
PRINT_TOTALORDER_NO ENDP

PRINT_ORDER_NO  PROC
    MOV AH,09H
    LEA DX, ORDERNO_STR 
    INT 21H

    XOR AH,AH
    MOV AL,ORDER_COUNT

    XOR DX,DX
    div THOUSAND
    mov Dwremainder1,DX
    mov Dwremainder,AX

    MOV AX,Dwremainder1
    div HUNDRED
    mov remainder1,AH
    mov remainder,AL

    mov AH,00  ;clear ah
    mov AL,remainder1
    div TEN
    mov remainder2,AH
    mov remainder1,AL

    mov dX,Dwremainder ;print first digit 
    add dX,30h
    mov ah,02h
    int 21h
    
    mov dl,remainder ;print third digit
    add dl,30h
    int 21h

    mov dl,remainder1 ;print forth digit
    add dl,30h
    int 21h

    mov dl,remainder2 ;print five digit
    add dl,30h
    int 21h

    CALL PRINT_NEW_LINE
    RET

PRINT_ORDER_NO ENDP

PRINT_TOTALPRICE PROC
    MOV AH,09H
    LEA DX, TOTALPRICESTR 
    INT 21H

    MOV AX,TOTALPRICE
    CALL PRINT_FOUR_DIGIT
    RET
PRINT_TOTALPRICE ENDP

PRINT_BALANCE PROC

    CALL PRINT_BAR
    CALL PRINT_NEW_LINE

    MOV AH,09H
    mov bh,00
    mov bl,02
    mov cx,53
    int 10h
    LEA DX, BALANCESTR 
    INT 21H

    MOV AX,BALANCE
    CALL PRINT_FOUR_DIGIT
    
    RET
PRINT_BALANCE ENDP

PRINT_EACH_BEVERAGE PROC
    MOV AH, 09H
    CMP LOOPCOUNT,5
    JE PRINT_1
    CMP LOOPCOUNT,4
    JE PRINT_2
    CMP LOOPCOUNT,3
    JE PRINT_3
    CMP LOOPCOUNT,2
    JE PRINT_4
    CMP LOOPCOUNT,1
    JE PRINT_5
    
    PRINT_1:   
    LEA DX, BEVERAGESTR 
    INT 21H
    RET
    PRINT_2:
    LEA DX, BEVERAGESTR1 
    INT 21H
    RET
    PRINT_3:
    LEA DX, BEVERAGESTR2 
    INT 21H
    RET
    PRINT_4:
    LEA DX, BEVERAGESTR3 
    INT 21H
    RET
    PRINT_5:
    LEA DX, BEVERAGESTR4 
    INT 21H
    RET    
PRINT_EACH_BEVERAGE ENDP

DISPLAY_BEVERAGE_MENU PROC
    CALL PRINT_NEW_LINE
	
    MOV AH, 09H
    LEA DX, STRBEVARAGEMENU
    INT 21H
    
    RET
DISPLAY_BEVERAGE_MENU ENDP

DISPLAY_SPECIAL_MSG PROC
    CALL PRINT_NEW_LINE
	
    MOV AH, 09H
    mov bh,00
    mov bl,02H
    mov cx,65
    int 10h
    LEA DX, SPECIAL_MSG
    INT 21H 

    mov bh,00
    mov bl,02H
    mov cx,60
    int 10h
    LEA DX, SPECIAL_MSG1
    INT 21H
    
    RET
DISPLAY_SPECIAL_MSG ENDP

DISP_ERROR_LIMIT PROC
	CALL PRINT_NEW_LINE 	
    CALL PRINT_NEW_LINE
	MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,70
    int 10h
	LEA DX,LIMIT_CHECK_STR
	INT 21H
	
    RET  
DISP_ERROR_LIMIT ENDP

;-------------------------------------------------------------- Sales's Floating Point -------------------------------------------------------------------------------------------

TOTAL_UP_FPOINT PROC
    ;total up tax fpoint
    MOV TOTALDFPOINT,0
    MOV TOTALTFPOINT,0
    MOV TOTALFPOINT,0
    
    MOV AL,TFPOINT1
    MOV BL,HUNDRED
    MUL BL
    ADD TOTALTFPOINT,AX

    MOV AL,TFPOINT2
    MOV BL,TEN
    MUL BL
    ADD TOTALTFPOINT,AX

    MOV AL,TFPOINT3
    ADD TOTALTFPOINT,AX

    ;total up discount fpoint
    MOV AL,DFPOINT1
    MUL HUNDRED
    ADD TOTALDFPOINT,AX

    MOV AL,DFPOINT2
    MUL TEN
    ADD TOTALDFPOINT,AX

    MOV AL,DFPOINT3
    ADD TOTALDFPOINT,AX

    ;add both fpoint
    MOV AX,TOTALTFPOINT
    MOV BX,TOTALDFPOINT
    CMP AX,BX
    JL ROUNDUP_APPLY
    JMP RESUME
    ROUNDUP_APPLY:
    mov ROUNDUP,-1
    ADD TOTALFPOINT,1000
    JMP RESUME4

    RESUME:
    mov ROUNDUP,0
    
    
    RESUME4:  
    MOV BX,TOTALDFPOINT
    ADD TOTALFPOINT,AX
    SUB TOTALFPOINT,BX

    MOV AX,TOTALFPOINT
    XOR DX,DX
    div THOUSAND
    mov SUBTOTAL_FPOINT,DX

    MOV AX,SUBTOTAL_FPOINT
    div HUNDRED
    mov SFPOINT3,AH
    mov SFPOINT2,AL

    mov AH,00  ;clear ah
    mov AL,SFPOINT3
    div TEN
    mov SFPOINT4,AH
    mov SFPOINT3,AL

    
    RET
TOTAL_UP_FPOINT ENDP

PRINT_TAX_FPOINT PROC ;tax

    mov DL,250 ;print first digit
    mov ah,02h
    int 21h

    mov dl,TFPOINT1 ;print first digit
    add dl,30h
    int 21h

    mov dl,TFPOINT2 ;print first digit
    add dl,30h
    int 21h

    mov dl,TFPOINT3 ;print first digit
    add dl,30h
    int 21h

    RET
PRINT_TAX_FPOINT ENDP

PRINT_DISCOUNT_FPOINT PROC ;discount

    mov DL,250 ;print first digit
    mov ah,02h
    int 21h

    mov dl,DFPOINT1 ;print first digit
    add dl,30h
    int 21h

    mov dl,DFPOINT2 ;print first digit
    add dl,30h
    int 21h

    mov dl,DFPOINT3 ;print first digit
    add dl,30h
    int 21h

    RET
PRINT_DISCOUNT_FPOINT ENDP

PRINT_SUBTOTAL_FPOINT PROC ;subtotal

    mov DL,250 ;print .
    mov ah,02h
    int 21h

    mov dl,SFPOINT2 ;print 
    add dl,30h
    int 21h

    mov dl,SFPOINT3 ;print 
    add dl,30h
    int 21h

    mov dl,SFPOINT4 ;print 
    add dl,30h
    int 21h

    RET
PRINT_SUBTOTAL_FPOINT ENDP

PRINT_BALANCE_FPOINT PROC 

    mov DL,250 ;print .
    mov ah,02h
    int 21h

    mov dl,B_FPOINT2 ;print 
    add dl,30h
    int 21h

    mov dl,B_FPOINT3 ;print 
    add dl,30h
    int 21h

    mov dl,B_FPOINT4 ;print 
    add dl,30h
    int 21h

    CALL PRINT_NEW_LINE
    CALL PRINT_BAR
    ;-----------------------

    RET
PRINT_BALANCE_FPOINT ENDP

;-----------------------------------  stock module ---------------------------------------------------------------------------------------------------------------------

PROC_MENU_CHECK PROC
    MOV menuCheckCan,1

    XOR AX,AX           ;to correct array start position in MENU_ING_REQ
    MOV AL,BEVERAGECHOICE
    SUB AL,30H
    DEC AL
    MUL TWO
    ADD AL,smallLarge
    MUL FIVE
    MOV indexIngStart,AL
    
    LEA SI,ingredient
    LEA BX,MENU_ING_REQ
    LEA DI,ingredient_buffer
    ADD BL,indexIngStart
    MOV CX,5

    LABEL_MENU_CHECK_ING_LESS_REQ:
    
    MOV AX,[SI]
    MOV DX,[BX]
    MOV DH,0

    CMP AX,DX
    JB LABEL_MENU_CHECK_CANNOT      ;if cannot, exit

    XOR DH,DH
    ADD [DI],DX                     ;add to buffer
    SUB AX,DX                       ;if can, deduct from ingredient
    MOV [SI],AX

    INC SI
    INC SI
    INC DI
    INC DI
    INC BX
    LOOP LABEL_MENU_CHECK_ING_LESS_REQ

    JMP LABEL_MENU_CHECK_CANNOT_SKIP

    LABEL_MENU_CHECK_CANNOT:
    MOV menuCheckCan,0

    LABEL_MENU_CHECK_CANNOT_SKIP:
    
    RET
PROC_MENU_CHECK ENDP

PROC_STOCK_MENU PROC

    MOV errorMsg1,0

 LABEL_STOCK_MENU:
    CALL DISPLAY_LOGO
    CALL PRINT_STOCK_MENU

    XOR AL,AL
    CMP errorMsg1,AL
    JE LABEL_STOCK_MENU_SKIP_ERROR_MSG_1
    CALL PRINT_ERROR_MSG_1
    MOV errorMsg1,0
 LABEL_STOCK_MENU_SKIP_ERROR_MSG_1:

    CALL PROC_CHOOSE_OPTION

    CMP chooseOption,"1"
    JE LABEL_STOCK_MENU_1

    CMP chooseOption,"2"
    JE LABEL_STOCK_MENU_2

    CMP chooseOption,"3"
    JE LABEL_STOCK_MENU_3

    CMP chooseOption,"0"
    JE EXIT_STOCK_MENU

    MOV errorMsg1,1

    JMP LABEL_STOCK_MENU

 LABEL_STOCK_MENU_1:
    CALL PROC_STOCK_VIEW
    JMP LABEL_STOCK_MENU

 LABEL_STOCK_MENU_2:
    CALL PROC_STOCK_ADD
    JMP LABEL_STOCK_MENU

 LABEL_STOCK_MENU_3:
    CALL PROC_STOCK_DELETE
    JMP LABEL_STOCK_MENU

 EXIT_STOCK_MENU:

    RET
PROC_STOCK_MENU ENDP
;-------------------------------------------------------PRINT ERROR MESSAGE 1
PRINT_ERROR_MSG_1 PROC
    MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,49
    int 10h
    LEA DX,STR_ERROR1
    INT 21H

    RET
PRINT_ERROR_MSG_1 ENDP
;-------------------------------------------------------PRINT ERROR MESSAGE 2
PRINT_ERROR_MSG_2 PROC
    MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,49
    int 10h
    LEA DX,STR_ERROR2
    INT 21H

    RET
PRINT_ERROR_MSG_2 ENDP
;-------------------------------------------------------PRINT STOCK MENU
PRINT_STOCK_MENU PROC
    MOV AH,09H
    
    LEA DX,STR_STOCK_MENU
    INT 21H

    RET
PRINT_STOCK_MENU ENDP
;-------------------------------------------------------GENERAL CHOOSE OPTION CHAR
PROC_CHOOSE_OPTION PROC
    MOV AH,09H
    LEA DX,STR_CHOOSE_OPTION
    INT 21H

    MOV AH,01H
    INT 21h
    MOV chooseOption,AL

    CALL PRINT_NEW_LINE

    RET
PROC_CHOOSE_OPTION ENDP
;-------------------------------------------------------STOCK VIEW
PROC_STOCK_VIEW PROC

    CALL DISPLAY_LOGO

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_T
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_I1
    INT 21H
    MOV AX,ingredient
    MOV DWprintIn,AX
    CALL PROC_DW_PRINT
    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_RB
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_I2
    INT 21H
    MOV AX,[ingredient+2]
    MOV DWprintIn,AX
    CALL PROC_DW_PRINT
    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_RB
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_I3
    INT 21H
    MOV AX,[ingredient+4]
    MOV DWprintIn,AX
    CALL PROC_DW_PRINT
    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_RB
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_I4
    INT 21H
    MOV AX,[ingredient+6]
    MOV DWprintIn,AX
    CALL PROC_DW_PRINT
    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_RB
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_I5
    INT 21H
    MOV AX,[ingredient+8]
    MOV DWprintIn,AX
    CALL PROC_DW_PRINT
    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_RB
    INT 21H

    MOV AH,09H
    LEA DX,STR_STOCK_VIEW_BB
    INT 21H

    CALL PRINT_PRESS_ANY_KEY

    RET
PROC_STOCK_VIEW ENDP
;-------------------------------------------------------press any key
PRINT_PRESS_ANY_KEY PROC
    MOV AH,09H
    LEA DX,STR_PRESS_ANY_KEY
    INT 21H

    MOV AH,01H
    INT 21H

    RET
PRINT_PRESS_ANY_KEY ENDP
;-------------------------------------------------------STOCK ADD
PROC_STOCK_ADD PROC

    MOV errorMsg1,0

 LABEL_STOCK_ADD:
    CALL DISPLAY_LOGO
    
    MOV AH,09H
    LEA DX,STR_STOCK_ADD_T
    INT 21H

    CALL PRINT_STOCK_NAME_LIST

    XOR AL,AL
    CMP errorMsg1,AL
    JE LABEL_STOCK_ADD_SKIP_ERROR_MSG_1
    CALL PRINT_ERROR_MSG_1
    MOV errorMsg1,0
 LABEL_STOCK_ADD_SKIP_ERROR_MSG_1:

    CALL PROC_CHOOSE_OPTION
    MOV AL,chooseOption
    SUB AL,49               ;"0" + 1 = 49

    CMP AL,4                ;"char 1 until 5" - "0" - 1 = (value 0-4), easy only single input check
    JBE LABEL_STOCK_ADD_VALID_CHOICE

    ADD AL,49
    CMP AL,"0"
    JE EXIT_STOCK_ADD

    MOV errorMsg1,1
    
    JMP LABEL_STOCK_ADD

 LABEL_STOCK_ADD_VALID_CHOICE:
    MOV AH,09H
    LEA DX,STR_STOCK_ADD_INS
    INT 21H

    CALL PROC_DW_READ
    CMP DWreadValid,1
    JE LABEL_STOCK_ADD_PROCESS

    MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,49
    int 10h
    LEA DX,STR_ERROR1
    INT 21H
    JMP LABEL_STOCK_ADD_VALID_CHOICE

 LABEL_STOCK_ADD_PROCESS:

    MOV BH,chooseOption
    SUB BH,"0"                      ;change char to number
    LEA DI,ingredient
    MOV BL,1
    MOV CX,5
 LABEL_STOCK_ADD_ARRAY_SWITCH:     ;loop through array to chooseOption ingredient array element
    CMP BL,BH
    JE LABEL_STOCK_ADD_ARRAY_SWITCH_DONE_READY_TO_ADD

    INC BL
    INC DI
    INC DI
    LOOP LABEL_STOCK_ADD_ARRAY_SWITCH

 LABEL_STOCK_ADD_ARRAY_SWITCH_DONE_READY_TO_ADD:
    MOV AX,[DI]
    ADD AX,DWreadOut
    MOV [DI],AX

    MOV AH,09H
    mov bh,00
    mov bl,02H
    mov cx,48
    int 10h
    LEA DX,STR_STOCK_ADD_DONE
    INT 21H

    CALL PRINT_PRESS_ANY_KEY

 EXIT_STOCK_ADD:

    RET
PROC_STOCK_ADD ENDP
;-------------------------------------------------------STOCK ADD AND DELETE PRINT
PRINT_STOCK_NAME_LIST PROC
    MOV AH,09H
    LEA DX,STR_STOCK_NAME_LIST
    INT 21H
    RET
PRINT_STOCK_NAME_LIST ENDP
;-------------------------------------------------------STOCK DELETE
PROC_STOCK_DELETE PROC

    MOV errorMsg1,0    

 LABEL_STOCK_DEL:
    CALL DISPLAY_LOGO

    MOV AH,09H
    LEA DX,STR_STOCK_DEL_T
    INT 21H

    CALL PRINT_STOCK_NAME_LIST

    XOR AL,AL
    CMP errorMsg1,AL
    JE LABEL_STOCK_DEL_SKIP_ERROR_MSG_1
    CALL PRINT_ERROR_MSG_1
    MOV errorMsg1,0
 LABEL_STOCK_DEL_SKIP_ERROR_MSG_1:

    CALL PROC_CHOOSE_OPTION
    MOV AL,chooseOption
    SUB AL,49               ;"0" + 1 = 49

    CMP AL,4                ;"char 1 until 5" - "0" - 1 = (value 0-4), easy only single input check
    JBE LABEL_STOCK_DEL_VALID_CHOICE

    ADD AL,49
    CMP AL,"0"
    JE EXIT_STOCK_DEL

    MOV errorMsg1,1

    JMP LABEL_STOCK_DEL

 LABEL_STOCK_DEL_VALID_CHOICE:
    MOV AH,09H
    LEA DX,STR_STOCK_DEL_INS
    INT 21H

    CALL PROC_DW_READ
    CMP DWreadValid,1
    JE LABEL_STOCK_DEL_PROCESS

    MOV AH,09H
    mov bh,00
    mov bl,04
    mov cx,49
    int 10h
    LEA DX,STR_ERROR1
    INT 21H
    JMP LABEL_STOCK_DEL_VALID_CHOICE

 LABEL_STOCK_DEL_PROCESS:

    MOV BH,chooseOption
    SUB BH,"0"                      ;change char to number
    LEA DI,ingredient
    MOV BL,1
    MOV CX,5
 LABEL_STOCK_DEL_ARRAY_SWITCH:     ;loop through array to chooseOption ingredient array element
    CMP BL,BH
    JE LABEL_STOCK_DEL_ARRAY_SWITCH_DONE_CHECK_AMOUNT_LOGIC

    INC BL
    INC DI
    INC DI
    LOOP LABEL_STOCK_DEL_ARRAY_SWITCH

 LABEL_STOCK_DEL_ARRAY_SWITCH_DONE_CHECK_AMOUNT_LOGIC:
    MOV AX,[DI]
    CMP AX,DWreadOut
    JAE LABEL_STOCK_DEL_CHECK_AMOUNT_LOGIC_SKIP   ;ingredient >= amount

    MOV AH,09H                      ;reask amount to delete
    mov bh,00
    mov bl,04
    mov cx,60
    int 10h
    LEA DX,STR_ERROR2
    INT 21H
    JMP LABEL_STOCK_DEL_VALID_CHOICE

 LABEL_STOCK_DEL_CHECK_AMOUNT_LOGIC_SKIP:
    SUB AX,DWreadOut
    MOV [DI],AX

    MOV AH,09H
    mov bh,00
    mov bl,02H
    mov cx,50
    int 10h
    LEA DX,STR_STOCK_DEL_DONE
    INT 21H

    CALL PRINT_PRESS_ANY_KEY

 EXIT_STOCK_DEL:

    RET
PROC_STOCK_DELETE ENDP
;-------------------------------------------------------save all reg
PUSHA PROC
    MOV regAX,AX
    MOV regBX,BX
    MOV regCX,CX
    MOV regDX,DX
    MOV regSI,SI
    MOV regDI,DI
    RET
PUSHA ENDP
;-------------------------------------------------------retrieve all reg
POPA PROC
    MOV AX,regAX
    MOV BX,regBX
    MOV CX,regCX
    MOV DX,regDX
    MOV SI,regSI
    MOV DI,regDI
    RET
POPA ENDP
;-------------------------------------------------------read dw
PROC_DW_READ PROC
    MOV DWreadValid,1

    LEA DI,DWreadArr

    MOV CX,5
 LABEL_DW_READ_GET_CHAR:
    MOV AH,01H
    INT 21H

    CMP AL,13               ;exit if ENTER pressed
    JE LABEL_DW_READ_GET_CHAR_DONE

    CMP AL,"0"               ;reject if not 0-9
    JB LABEL_DW_READ_INVALID_CHAR

    CMP AL,"9"               ;reject if not 0-9
    JA LABEL_DW_READ_INVALID_CHAR

    SUB AL,"0"

    MOV [DI],AL
    
    INC DI
    LOOP LABEL_DW_READ_GET_CHAR

    CALL PRINT_NEW_LINE

 LABEL_DW_READ_GET_CHAR_DONE:
    CMP CX,5
    JE LABEL_DW_READ_INVALID

    MOV DWread5SubLen,CL
    MOV AX,5                ;calc DWreadLen
    SUB AX,CX
    MOV DWreadLen,AL

    CMP DWreadLen,5
    JE LABEL_DW_READ_SHIFT_ARR_LEAD_ZERO_SKIP

    JMP LABEL_DW_READ_INVALID_SKIP
 LABEL_DW_READ_INVALID_CHAR:
    CALL PRINT_NEW_LINE
 LABEL_DW_READ_INVALID:
    MOV DWreadValid,0
    MOV DWreadOut,0
    JMP LABEL_DW_READ_END
 LABEL_DW_READ_INVALID_SKIP:

    XOR CH,CH
    MOV CL,DWread5SubLen
 LABEL_DW_READ_SHIFT_ARR:        ;right shift array DWreadArr on DWread5SubLen
    PUSH CX

    MOV AH,[DWreadArr+4]
    LEA SI,DWreadArr+3
    MOV CX,4
 LABEL_DW_READ_SHIFT_ARR_ONE:    ;loop once
    MOV AL,[SI]
    MOV [SI+1],AL
    DEC SI
    LOOP LABEL_DW_READ_SHIFT_ARR_ONE
    MOV [DWreadArr],AH

    POP CX
    LOOP LABEL_DW_READ_SHIFT_ARR    ;loop outer shift

    LEA DI,DWreadArr
    MOV CL,DWread5SubLen
 LABEL_DW_READ_LEAD_ZERO:            ;add leading zero
    MOV BYTE PTR [DI],0
    INC DI
    LOOP LABEL_DW_READ_LEAD_ZERO
    
 LABEL_DW_READ_SHIFT_ARR_LEAD_ZERO_SKIP:

    LEA SI,DWreadArr
    LEA DI,DECIMAL
    MOV DWreadOut,0
    MOV CX,5
 LABEL_DW_READ_CONV_DW:      ;finally add
    MOV AX,[SI]
    MOV AH,0
    MOV DX,[DI]
    MUL DX
    ADD DWreadOut,AX

    CMP DX,0
    JNE LABEL_DW_READ_INVALID

    INC SI
    INC DI
    INC DI
    LOOP LABEL_DW_READ_CONV_DW

 LABEL_DW_READ_END:

    RET
PROC_DW_READ ENDP
;-------------------------------------------------------print dw
;dividend DX : AX / DECIMAL = quotient AX + remainder DX
PROC_DW_PRINT PROC
    CALL PUSHA

    LEA SI,DECIMAL      ;load DECIMAL array
    
    MOV CX,5
 LABEL_DW_PRINT:
    MOV AX,DWprintIn
    XOR DX,DX

    MOV BX,[SI]         ;load DECIMAL value to divide
    DIV BX
	
	MOV DWprintIn,DX    ;load remainder as new dividend

    MOV AH,02h          ;print quotient
    MOV DL,AL
    ADD DL,"0"
    INT 21H

    INC SI              ;double increase for dw
    INC SI
    LOOP LABEL_DW_PRINT

    CALL POPA
    RET
PROC_DW_PRINT ENDP
;-------------------------------------------------------add dw
PROC_DW_ADD PROC
    XOR BL,BL

    MOV AX,DWaddVal1
    ADD AX,DWaddVal2
    JC LABEL_DW_ADD_CARRY

    JMP LABEL_DW_ADD_CARRY_SKIP

 LABEL_DW_ADD_CARRY:
    MOV BL,1

 LABEL_DW_ADD_CARRY_SKIP:    ;BL remains 0
    MOV DWaddCarry,BL
    MOV DWaddVal3,AX

    RET
PROC_DW_ADD ENDP
;-------------------------------------------------------sub dw
PROC_DW_SUB PROC
    XOR BL,BL

    MOV AX,DWsubVal1
    SUB AX,DWsubVal2
    JNC LABEL_DW_SUB_CAN

    JMP LABEL_DW_ADD_CANNOT

 LABEL_DW_SUB_CAN:
    MOV BL,1

 LABEL_DW_ADD_CANNOT:    ;BL remains 0
    MOV DWsubCan,BL
    MOV DWsubVal3,AX

    RET
PROC_DW_SUB ENDP



END MAIN
G105.asm
Displaying G105.asm.