********************************************************************************
********************************************************************************
********************************************************************************
*******                                                                *********
*******                  TOTAL SYSTEM SERVICES, INC.                   *********
*******                                                                *********
*******                    ALL RIGHTS RESERVED                         *********
*******                                                                *********
********************************************************************************
********************************************************************************
********************************************************************************
******* COPYBOOK NAME:  CPRCTPCB                                       *********
*******                                                                *********
******* PURPOSE:  CURRENT TRANSACTIONS TO POST (CTP) RECORD COPYBOOK.  *********
*******                                                                *********
******* LENGTH:  2000 BYTES                                            *********
*******                                                                *********
******* SPECIAL NOTES:                                                 *********
*******   1.  THE ATP-R01-REC GROUP IN CPRACBCB IS A COPY OF THIS      *********
*******       COPYBOOK.  WHENEVER CHANGES ARE MADE TO THIS COPYBOOK,   *********
*******       THE ATP-R01-REC GROUP IN CPRACBCB SHOULD BE MODIFIED     *********
*******       TO REFLECT/MIRROR THE CHANGES.                           *********
*******                                                                *********
*******   2.  THIS COPYBOOK IS THE COBOL VERSION OF THIS RECORD LAYOUT.*********
*******       TS2CTPCB IS THE ASSEMBLER VERSION OF THIS RECORD LAYOUT. *********
*******       WHENEVER CHANGES ARE MADE TO THIS COPYBOOK, TS2CTPCB     *********
*******       SHOULD BE MODIFIED TO REFLECT/MIRROR THE CHANGES.        *********
*******                                                                *********
********************************************************************************
*******                M O D I F I C A T I O N    L O G                *********
********************************************************************************
******* - PROJECT A42569, GP5SE3, 09/09/2003                           *********
*******   DELETED COMMENTED OUT FIELDS.  IMPROVED READABILITY AND      *********
*******   INTERNAL DOCUMENTATION.  EXPANDED COPYBOOK LENGTH BY 500     *********
*******   BYTES.                                                       *********
*******                                                                *********
******* - PROJECT A55683, GP5SE3, 09/06/2005                           *********
*******   DELETED OBSOLETE CTP-R01-CONVERSION-RATE AND CTP-R01-        *********
*******   CONVERSION-RDF FIELDS AND RETURNED SPACE TO FILLER.          *********
*******                                                                *********
******* - PROJECT B64180, GP5NJF, 11/01/2005                           *********
*******   ADDEDD NEW FIELD CTP-ACCOUNT-IDENTIFIER AT THE END AND       *********
*******   REDUCED FILLER.                                              *********
*******                                                                *********
******* - PROJECT B04561, GP5V1S, 04/27/2006                           *********
*******   REEDFINED EXISTING CTP-R01-PAYMENT-IND FIELD AS EXCESS PAY-  *********
*******   MENT ALLOCATION METHOD.                                      *********
*******                                                                *********
******* - PROJECT B19383, GP5TJF, 05/22/2008                           *********
*******   ADDED NEW FILED CTP-R01-NETWORK-SOURCE AND ITS 88 LEVELS     *********
*******   REDUCED FILLER BY 1.                                         *********
*******                                                                *********
******* - PROJECT B21331, GP5TIL, 10/22/2008                           *********
*******   ADDED NEW FIELD CTP-R01-CHIP-CARD-SOURCE-CODE                *********
*******   REDUCED FILLER BY 1.                                         *********
*******                                                                *********
******* - PROJECT B21725, GP5TIL, 02/24/2009                           *********
*******   ADDED NEW FIELDS CTP-R01-PAY-TYPE CTP-R01-PAY-SOURCE         *********
*******   REDUCED FILLER BY 6.                                         *********
******* - PROJECT B24779, GP5LXT, 03/12/2009                           *********
*******   ADDED NEW FIELDS CTP-R01-TRNSIT-ROU-N & CTP-R01-BANK-ACT-NUM *********
*******   REDUCED FILLER BY 12.                                        *********
******* - PROJECT B26618, GP5PSG, 07/08/2009                           *********
*******   ADDED 88 LEVEL VALUE CTP-R01-DIR-PAY-PRIN-ONLY-IND           *********
*******                                                                *********
******* - PROJECT B24259, GP5TIL, 04/15/2009                           *********
*******   ADDEDD NEW FIELD CTP-R01-ADR-OPRID  FROM FILLER              *********
*******                                                                *********
******* - PROJECT B30559, GP5SJM, 08/14/2010                           *********
*******   ADDEDD NEW FIELD CTP-R01-COMMON-PROG-PART-IND AND             ********
*******   CTP-R01-GRATUITY-AMT FROM FILLER.                             ********
*******                                                                *********
******* - PROJECT B31944, GP5TLM, 11/12/2010                           *        
*******   ADDED NEW 88 LEVEL FIELDS TO CTP-R01-USER-OPTION FOR PRE-PAID*        
*******   LOAD LIMITS                                                  *        
*******                                                                *        
******* - PROJECT B32983, GP5TLM, 04/2011                              *        
*******   ADD NEW FIELDS FOR CURRENCY CONVERSION                       *        
*******                                                                *        
******* - PROJECT B39356, GP5SCJ, 01/2012                              *        
*******   ADDED NEW FIELD CTP-R01-TRANSIT-PROG                         *        
*******                                                                *        
******* - PROJECT REQ6214, GP5RSM 10/2012                              *        
*******   ADDED NEW FIELDS FOR EDIT PACKAGE                            *        
******* - PROJECT REQ18376, GP5TAG 2013.10                             *        
*******   ADDED NEW 88-LEVELS FOR INCREMENTAL AUTHS                    *        
******* - PROJECT REQ30666, GP5RSM 04/2014                             *        
*******   ADDED NEW FIELD  FOR EDIT PACKAGE                            *        
******* - PROJECT REQ131748 GP5TAG 2014.06                             *        
*******   ADDED REDEFINES FOR USE IN REVERSAL MATCH N FLAG             *        
******* - PROJECT WRK35204-2, GP5SCJ 10/2014                           *        
*******   ADDED NEW FIELDS FOR EDIT PACKAGE                            *        
******* - PROJECT REQ47950 GP5CZF 2015.01                                       
******* - ADDED NEW VALUES 4111,4112,4131 AND DELETED 4412                      
******* - FROM VISA TABLE                                                       
******* - PROJECT PRJ50249-1, GP5SCJ 02/2014                           *        
*******   REMOVE UNNEEDED FIELDS                                       *        
******* - PROJECT WRK47752-2, GP5SCJ 04/2015                           *        
*******   ADDED NEW FIELDS FOR EDIT PACKAGE                            *        
******* - PROJECT WRK55918-8, GP5SCJ, 09/02/2015                       *        
*******   ADD NEW FIELD FOR PRJ55918                                   *        
******* - PROJECT PRJ58025-1, GP5SCJ 10/2015                           *        
*******   REMOVE CTP-R01-INTERNATIONAL-FEE-IND FOR EDIT PACKAGE        *        
******* - PROJECT PRJ60414-2, GP5TAG 08/2016                           *        
*******   ADD CTP-MNF-POS-TRAN-STAT FOR MC PREAUTH PROCESSING          *        
******* - PROJECT R116148, GP5KYM 10/2016                                       
*******   ADD CTP-R01-WALLET-ID FOR EDIT PACKAGE                                
******* - PROJECT R168174, GP5KFH 04/2017                                       
*******   EP17.1 - INCLUDE ADDITIONAL TNE MERCHANTS FOR VISA ONLY               
******* - PROJECT R168234, GP5KYM 04/2017                                       
*******   ADD CTP-R01-BUSINESS-APP-ID FOR EDIT PACKAGE                          
******* - PROJECT R225581, GP5TAG 10/2017 EP 17.2                               
*******   ADD MCC 4121 TO 88-LEVEL CTP-TNE-MCC-VS EDIT PACKAGE                  
******* - PROJECT R334432, GP5SN1 07/2018 EP 18.10                      01131000
*******   REMOVE CTP-R01-CHGBK-RIGHTS-ID                                01132000
******* - PROJECT R334432, GP5SN1 09/2018 EP 18.10                      01131000
*******   REMOVE CTP-R01-ORIGNATRS-NAME                                 01132000
******* - PROJECT R392696, GP5TAG 09/2019 EP 19.10                      01131000
*******   CHANGE 88-LEVELS FOR CTP-R01-MERCHANT-CATEGORY-CODE           01132000
******* - PROJECT R145241, GP5SZN 2020.06 EP 20.06                      01131000
*******   ADD CTP-R01-CONVERSION-RATE-IND                               01132000
********************************************************************************
======*=========================================================================
      *    CTP RECORD DATA AREA.                                                
======*=========================================================================
         01 CTP-R01-REC.              
             10 CTP-R01-CLIENT-NUM                 PIC 9(4).                    
             10 CTP-R01-TRANSMISSION-ID            PIC X(8).                    
             10 CTP-R01-RECORD-TYPE                PIC 9(4).                    
               88 CTP-R01-IS-DETAIL              VALUE 0001 THRU 9997.          
             10 CTP-R01-REJECT-FLAG                PIC XX.                      
               88 CTP-R01-DETAIL-REJECTED        VALUE 'AA' THRU 'ZZ',          
                                                       '01' THRU '99'.          
               88 CTP-R01-DETAIL-OK              VALUE ' '.                     
             10 CTP-R01-ACCT-NUMB                  PIC X(19).                   
             10 CTP-R01-DATABASE-ID                PIC X(8).                    
             10 CTP-R01-DATABASE-AREA              PIC S9(3) COMP-3.            
             10 CTP-R01-ROOT-ANCHOR-POINT          PIC X(4).                    
             10 CTP-R01-APPLICATION-NUM            PIC 9(12).                   
             10 CTP-R01-APPLICATION-SUFFIX         PIC 99.                      
             10 CTP-R01-CUSTOMER-ID                PIC 9(9).                    
             10 CTP-R01-GROUP-ID                   PIC 99.                      
             10 CTP-R01-PROVIDER-ID OCCURS 3 TIMES PIC 9(6).                    
             10 CTP-R01-TSYS-PRODUCT-CODE          PIC XX.                      
             10 CTP-R01-CLIENT-PRODUCT-CODE        PIC X(3).                    
             10 CTP-R01-BUSINESS-KEY.                                           
               15 CTP-R01-BUS-ACCT-NUMB            PIC S9(15) COMP-3.           
               15 CTP-R01-BUS-ACCT-TYPE            PIC X.                       
               15 CTP-R01-TYPE-BILLING             PIC X.                       
             10 CTP-R01-ACCOUNT-NUMB-ORIG          PIC X(19).                   
             10 CTP-R01-AMT-TRANSACTION            PIC S9(9)V99 COMP-3.         
             10 CTP-R01-DATE-TRANSACTION           PIC S9(7) COMP-3.            
             10 CTP-R01-DATE-POST                  PIC S9(7) COMP-3.            
                                                                                
------*----THESE FIELDS WILL HELP DETERMINE THE BALANCE-------------------------
------*----SEGMENT AND ACCOUNTING INFORMATION-----------------------------------
             10 CTP-R01-DEBIT-CREDIT-STATUS        PIC X.                       
             10 CTP-R01-TRANSACTION-CODE           PIC X(4).                    
             10 CTP-R01-TRANSACTION-CATEGORY       PIC 9(4).                    
             10 CTP-R01-TRNS-ACCT-FUNC             PIC X(3).                    
             10 CTP-R01-TRNS-SOURCE                PIC XX.                      
B00753         88 CTP-R01-TRNS-VISA              VALUE 'VI'.                    
  |            88 CTP-R01-TRNS-MC                VALUE 'MC'.                    
  |            88 CTP-R01-TRNS-AMEX              VALUE 'AI'.                    
  |            88 CTP-R01-TRNS-SG                VALUE 'SG'.                    
B00753         88 CTP-R01-TRNS-BO                VALUE 'BO'.                    
B15010         88 CTP-R01-TRNS-DISCOVER          VALUE 'DS'.                    
B19383         88 CTP-R01-TRNS-INTERLINK         VALUE 'IK'.                    
   ¦           88 CTP-R01-TRNS-PLUS              VALUE 'PL'.                    
   ¦           88 CTP-R01-TRNS-NETWORK2          VALUE 'N2'.                    
   ¦           88 CTP-R01-TRNS-PULSE             VALUE 'PE'.                    
   ¦           88 CTP-R01-TRNS-STAR              VALUE 'ST'.                    
   ¦           88 CTP-R01-TRNS-NYCE              VALUE 'NY'.                    
   ¦           88 CTP-R01-TRNS-GATEWAY           VALUE 'GW'.                    
B19383         88 CTP-R01-TRNS-MDS               VALUE 'MS'.                    
B24779         88 CTP-R01-TRNS-S2                VALUE 'S2'.                    
P33958         88 CTP-R01-TRNS-MAESTRO           VALUE 'MS'.            00000830
P33958         88 CTP-R01-TRNS-CIRRUS            VALUE 'CS'.            00000830
P33958         88 CTP-R01-TRNS-ACCEL             VALUE 'MG'.            00000830
                                                                                
------*----THIS FIELD INDICATES THE "POSTING STATUS" OF THE---------------------
------*----TRANSACTION.  IT IS UPDATED AS THE TRANSACTION-----------------------
------*----FLOWS THROUGH THE SYSTEM.--------------------------------------------
             10 CTP-R01-POSTING-STATUS             PIC X.                       
               88 CTP-R01-VALID-POSTED-TRANS     VALUE 'P'.                     
               88 CTP-R01-NO-ACCOUNT-FOUND       VALUE 'N'.                     
               88 CTP-R01-TRANSFERRED-ACCT       VALUE 'T'.                     
               88 CTP-R01-USER-CHOICE-OPTION     VALUE 'U'.                     
               88 CTP-R01-UNMATCHED-REVERSAL     VALUE 'R'.                     
               88 CTP-R01-CLOSE-ACCOUNT          VALUE 'C'.                     
               88 CTP-R01-INVALID-TRAN-CAT       VALUE 'I'.                     
               88 CTP-R01-PYMT-APPLICATION       VALUE 'A'.                     
               88 CTP-R01-INVALID-PRIME-ENTRY    VALUE 'E'.                     
               88 CTP-R01-INVALID-DISCL-GROUP    VALUE 'G'.                     
               88 CTP-R01-INVALID-BAL-STRUCT     VALUE 'B'.                     
               88 CTP-R01-DISENTERED-TRANSACTION VALUE 'D'.                     
               88 CTP-R01-NOT-ACTIVE-YET         VALUE 'Z'.                     
               88 CTP-R01-PROD-CHNG-IN-PROG      VALUE 'H'.                     
               88 CTP-R01-DECONVERT-REJECT       VALUE 'L'.                     
               88 CTP-R01-TLP-REJECT             VALUE 'X'.                     
               88 CTP-R01-AM0BQ-REJECT           VALUE 'Q'.                     
               88 CTP-R01-GCARD-REJECT           VALUE 'F'.                     
               88 CTP-R01-EUROP-REJECT           VALUE '0'.                     
               88 CTP-R01-ENHANCEMENT-REJECT     VALUE 'K'.                     
B20025         88 CTP-R01-INVALID-STORE-ID       VALUE 'S'.                     
                                                                                
------*----THIS FIELD CLARIFIES THE TYPE OF USER OPTION-------------------------
------*----REJECT THAT HAS OCCURRED.  IT IS UPDATED AS THE----------------------
------*----TRANSACTION FLOWS THROUGH THE SYSTEM.--------------------------------
             10 CTP-R01-USER-OPTION                PIC XX.                      
               88 CTP-R01-USER-OPTION1           VALUE '01'.                    
               88 CTP-R01-INVALID-TRNS-CODE      VALUE '02'.                    
               88 CTP-R01-UN-MATCHED-REVERSAL    VALUE '03'.                    
               88 CTP-R01-NON-POSTING-ACCT       VALUE '04'.                    
               88 CTP-R01-NON-POSTING-PLAN       VALUE '05'.                    
               88 CTP-R01-NON-ZEROING-PLAN       VALUE '06'.                    
               88 CTP-R01-PLAN-DISALLOWS-DEBITS  VALUE '07'.                    
               88 CTP-R01-PLAN-DISALLOWS-CREDITS VALUE '08'.                    
               88 CTP-R01-INVALID-PAYMENT-APPL   VALUE '09'.                    
               88 CTP-R01-EXCEEDS-MAX-DAYS       VALUE '0A'.                    
               88 CTP-R01-DO-NOT-DISPLAY-ENP     VALUE '0B'.                    
               88 CTP-R01-CRDSAVNG-RETURN-CHECK  VALUE '0C'.                    
               88 CTP-R01-STOP-PAYMENT           VALUE '0D'.                    
               88 CTP-R01-CLOSED-CRDSAVNG-ACCT   VALUE '0E'.                    
               88 CTP-R01-RETURNED-CHECK-CHARGE  VALUE '0F'.                    
               88 CTP-R01-NO-OLD-BALANCE-SEG     VALUE '10'.                    
               88 CTP-R01-UNMATCHED-REPOST       VALUE '11'.                    
               88 CTP-R01-CATEGORY-NOT-ACCEPTED  VALUE '12'.                    
               88 CTP-R01-BCDA-MSTR-SEG-NOT-FND  VALUE '13'.                    
               88 CTP-R01-AUTHORIZATION-DENIED   VALUE '14'.                    
               88 CTP-R01-INVALID-TRAN-DATE      VALUE '15'.                    
               88 CTP-R01-TRAN-DAT-GT-POST-DAT   VALUE '16'.                    
               88 CTP-R01-ZERO-TRAN-AMT          VALUE '17'.                    
               88 CTP-R01-UNDETERMINED           VALUE '18'.                    
               88 CTP-R01-AM0BQ-NOT-FOUND        VALUE '19'.                    
               88 CTP-R01-ERUO-CURRENCY-MTCH     VALUE '20'.                    
               88 CTP-R01-DEBT-PROTECT           VALUE '21'.                    
               88 CTP-R01-CARDHOLDER-STOP-PAY    VALUE '23'.                    
A42374         88 CTP-R01-INVALID-SKU-TLP-IND    VALUE '24'.                    
A42374         88 CTP-R01-INVALID-SKU-TLP-OPT    VALUE '25'.                    
A42374         88 CTP-R01-INVALID-SKU-REASGNTCAT VALUE '26'.                    
B31944         88 CTP-R01-ACCOUNT-EXCLUDED       VALUE '40'.                    
B31944         88 CTP-R01-INVALID-FIRST-LOAD     VALUE '41'.                    
B31944         88 CTP-R01-INVALID-RELOAD-LIMIT   VALUE '42'.                    
B31944         88 CTP-R01-OVER-DAILY-LIMIT       VALUE '43'.                    
B31944         88 CTP-R01-OVER-MONTHLY-LIMIT     VALUE '44'.                    
B31944         88 CTP-R01-OVER-ANNUAL-LIMIT      VALUE '45'.                    
B31944         88 CTP-R01-OVER-MAX-CREDIT-LIMIT  VALUE '46'.                    
                                                                                
------*----TRANSACTION STATUS FLAGS.--------------------------------------------
             10 CTP-R01-TRAN-STATUS                PIC X.                       
               88 CTP-R01-PRODUCTION-TRANS       VALUE 'P'.                     
               88 CTP-R01-TEST-TRANS             VALUE 'T'.                     
             10 CTP-R01-AAA-DUES-BILLING-FLAG      PIC X.                       
               88 CTP-R01-AAA-DUES-BILLING-YES   VALUE 'Y'.                     
             10 CTP-R01-REVERSED-FLAG              PIC X.                       
               88 CTP-R01-REVERSED-YES           VALUE 'Y'.                     
             10 CTP-R01-REVERSAL-FLAG              PIC X.                       
               88 CTP-R01-REVERSAL-YES           VALUE 'Y'.                     
             10 CTP-R01-TRANSLATE-FLAG             PIC X.                       
               88 CTP-R01-TRANSLATE-YES          VALUE 'Y'.                     
             10 CTP-R01-TRANSFER-FLAG              PIC X.                       
               88 CTP-R01-TRANSFER-YES           VALUE 'Y'.                     
             10 CTP-R01-FORCE-POST-INDICATOR       PIC X.                       
               88 CTP-R01-FORCE-POST-YES         VALUE 'Y'.                     
             10 CTP-R01-FRAUD-FLAG                 PIC X.                       
               88 CTP-R01-FRAUD-YES              VALUE 'Y'.                     
             10 CTP-R01-TSYS-ONLINE-TRANS          PIC X.                       
             10 CTP-R01-AER-BANK-NUM               PIC XX.                      
             10 CTP-R01-MC-MERCHANT-ID             PIC X(15).                   
             10 CTP-R01-AUTOCHARGEBACK-FLAG        PIC X VALUE 'N'.             
               88 CTP-R01-AUTOCHARGEBACK-YES     VALUE 'Y'.                     
               88 CTP-R01-AUTOCHARGEBACK-NO      VALUE 'N'.                     
                                                                                
------*----TRANSACTION TYPE-----------------------------------------------------
             10 CTP-R01-TRANSACTION-TYPE           PIC X.                       
               88 CTP-R01-PURCHASE-OR-CREDIT     VALUE '1'.                     
               88 CTP-R01-CASH                   VALUE '2'.                     
               88 CTP-R01-ATM                    VALUE '3'.                     
               88 CTP-R01-PAYMENT                VALUE '4'.                     
               88 CTP-R01-ONUS-DRAFT-REVERSAL    VALUE '5'.                     
               88 CTP-R01-ONUS-DRAFT             VALUE '6'.                     
               88 CTP-R01-REPRESENTMENT          VALUE '8'.                     
               88 CTP-R01-WIRE-TRANSFER          VALUE 'B'.                     
                                                                                
------*----MISCELLANEOUS INFORMATION--------------------------------------------
             10 CTP-R01-LAST-ACTIVE-DATE           PIC S9(7) COMP-3.            
             10 CTP-R01-RUN-NUMB                   PIC S9(7) COMP-3.            
             10 CTP-R01-TRNSMT-NUMB                PIC S9(7) COMP-3.            
             10 CTP-R01-AER-PROCNG-DTE             PIC S9(7) COMP-3.            
             10 CTP-R01-DATE-SETTLEMENT            PIC S9(7) COMP-3.            
             10 CTP-R01-SUP-TRANS-IND              PIC S9(3) COMP-3.            
             10 CTP-R01-MC-SENDING-ICA             PIC 9(4).                    
             10 CTP-R01-IN-TRANSACTION-CODE        PIC 9(4).                    
             10 CTP-R01-USAGE-CODE                 PIC 9.                       
             10 CTP-R01-PROCESSING-TYPE            PIC X.                       
               88 CTP-R01-NO-CODE                VALUE SPACES.                  
               88 CTP-R01-PENDING-ACCT           VALUE 'Z'.                     
               88 CTP-R01-DECONVERT-ACCT         VALUE 'D'.                     
               88 CTP-R01-OLD-PROD-CHNG          VALUE 'U'.                     
               88 CTP-R01-PROD-CHNG-DONE         VALUE 'P'.                     
             10 CTP-R01-TRANS-FORMAT               PIC XX.                      
               88 CTP-R01-DETAIL                 VALUE '01'.                    
               88 CTP-R01-DETAIL-AIRLINE         VALUE '02'.                    
               88 CTP-R01-DETAIL-PS2000          VALUE '03'.                    
               88 CTP-R01-LONG-DISTANCE          VALUE '04'.                    
             10 CTP-R01-SEQ-NBR                    PIC S9(9) BINARY.            
             10 CTP-R01-PROVIDER-ID-ORIG                                        
                  OCCURS 3 TIMES                   PIC 9(6).                    
             10 CTP-R01-TSYS-PRODUCT-CODE-ORIG     PIC XX.                      
             10 CTP-R01-CLIENT-PROD-CODE-ORIG      PIC X(3).                    
             10 CTP-R01-SUPPLEMENTAL-KEY.                                       
               15 CTP-R01-SUP-BANK-NUM             PIC XX.                      
               15 CTP-R01-SUP-ACCT-NUM             PIC 9(16).                   
               15 CTP-R01-SUP-ENTRY-RUN-DTE        PIC X(3).                    
               15 CTP-R01-SUP-ENTRY-RUN-NUM        PIC X(3).                    
               15 CTP-R01-SUP-TRANS-SEQ-NUM        PIC S9(13) COMP-3.           
               15 CTP-R01-SUP-SEQ-NUM              PIC S9(3) COMP-3.            
               15 CTP-R01-SUP-NUM-SUP-RECS         PIC S9(3) COMP-3.            
               15 CTP-R01-SUP-TYPE                 PIC X.                       
             10 CTP-R01-AER-TRANS-SEQ-NUM          PIC S9(15) COMP-3.           
             10 CTP-R01-MERCHANT-PHONE-IND         PIC X.                       
             10 CTP-R01-MERCHANT-PHONE-NUM         PIC X(14).                   
             10 CTP-R01-ACCT-NUM-INCOMING          PIC X(19).                   
             10 CTP-R01-SECUR-POOL-ID1             PIC X(6).                    
             10 CTP-R01-TRAILING-TRANS-IND         PIC X.                       
               88 CTP-TRAILING-TRANS-PU          VALUE '1'.                     
             10 CTP-R01-AER-RUN-BANK-NUM           PIC S9(7) COMP-3.            
             10 CTP-R01-AU01-CDATE                 PIC S9(7) COMP-3.            
             10 CTP-R01-AU01-CTIME                 PIC S9(7) COMP-3.            
             10 CTP-R01-TIME-POST                  PIC S9(7) COMP-3.            
             10 CTP-R01-MC-PROMO-CODE              PIC X(6).                    
             10 CTP-R01-APPLY-DATE                 PIC S9(7) COMP-3.            
             10 CTP-R01-APPLY-TIME                 PIC S9(7) COMP-3.            
             10 CTP-R01-DISENTER-TIME              PIC S9(7) COMP-3.            
             10 CTP-R01-DISP-CASE-TRACK-NUM        PIC 9(6).                    
             10 CTP-CONSIDERED-IN-MIN-FCHG         PIC X.                       
             10 CTP-NON-PRINTABLE-FLAG             PIC X.                       
             10 CTP-TRANSACTION-IS-FCHG            PIC X.                       
             10 CTP-R01-ADD-DATA-IND               PIC X.                       
             10 CTP-R01-CASH-BACK-AMT              PIC S9(7)V99 COMP-3.         
             10 CTP-R01-DEBIT-CD-FRAUD-IND         PIC X.                       
             10 CTP-R01-ORIG-TRANSACTION-CAT       PIC 9(4).                    
             10 CTP-R01-FOREIGN-MARKUP-FLAG        PIC X.                       
                                                                        00000500
------*----THESE FIELDS DEAL WITH CTAL REAL TIME AWARDS-------------------------
             10 CTP-REAL-TIME-POINTS.                                           
               15 CTP-BASE-POINTS                  PIC S9(7)V99 COMP-3.         
               15 CTP-STORE-POINTS                 PIC S9(7)V99 COMP-3.         
               15 CTP-PRODUCT-POINTS               PIC S9(7)V99 COMP-3.         
               15 CTP-REDEMPTION-POINTS            PIC S9(7)V99 COMP-3.         
               15 CTP-PROMOTION-POINTS             PIC S9(7)V99 COMP-3.         
               15 CTP-REGISTER-NUMBER              PIC X(5).                    
               15 CTP-R01-POINTS-FUNDING-AMT       PIC S9(9)V99 COMP-3.         
             10 CTP-TLP-DATA.                                                   
               15 CTP-TLP-TYPE-IND                 PIC X.                       
                 88 CTP-TLP-DEF-BASED-NUM-DAYS   VALUE 'D'.                     
                 88 CTP-TLP-DEF-BASED-FIXED-DATE VALUE 'F'.                     
                 88 CTP-TLP-SAC-BASED-NUM-DAYS   VALUE 'S'.                     
                 88 CTP-TLP-SAC-BASED-FIXED-DATE VALUE 'C'.                     
                 88 CTP-TLP-INSTALLMENT          VALUE 'I'.                     
A42374           88 CTP-SKU-PROCESSING           VALUE 'U'.                     
               15 CTP-EXPIRE-AREA                  PIC X(6).                    
               15 CTP-EXP-DAYS-AND-NOINS                                        
                    REDEFINES CTP-EXPIRE-AREA.                                  
                 20 CTP-EXP-NBR-DAYS               PIC X(4).                    
                 20 CTP-NBR-INSTALLMENTS           PIC XX.                      
               15 FILLER                           PIC X.                       
               15 CTP-PLAN-ID                      PIC X(4).                    
             10 CTP-RECORD-NBR                     PIC X(5).                    
             10 CTP-DEFER-MONTH                    PIC XX.                      
             10 CTP-LONG-DISTANCE-ESID             PIC XX.                      
             10 CTP-INSURANCE-CODE                 PIC X(3).                    
             10 CTP-REDEMPTION-TYPE                PIC X.                       
               88 CTP-FIXED-DOLLAR-AMT           VALUE 'F'.                     
               88 CTP-PERCENTAGE-OF-TRANS        VALUE 'P'.                     
             10 CTP-REDEMPTION-AMT                 PIC S9(5)V99.                
             10 CTP-TLP-EXPIRATION-DATE            PIC S9(7) COMP-3.            
             10 CTP-BASE-POINTS-PROMO-ID           PIC X(6).                    
             10 CTP-STORE-POINTS-PROMO-ID          PIC X(6).                    
             10 CTP-PROMOTION-POINTS-ID            PIC X(6).                    
             10 CTP-R01-NUM-OF-MONTHS              PIC 99.                      
             10 CTP-R01-PURCH-ORD-NBR              PIC X(20).                   
             10 CTP-BRANCH-CODE                    PIC X(6).                    
             10 CTP-R01-MERCH-VOL-IND              PIC XX.                      
             10 CTP-FREQ-NBR                       PIC XX.                      
             10 CTP-INSURANCE-PAYMENT-TYPE         PIC X.                       
             10 CTP-R01-INSURANCE-COVERAGE         PIC X.                       
               88 CTP-R01-FAMILY-COVERAGE        VALUE 'F'.                     
               88 CTP-R01-SINGLE-COVERAGE        VALUE 'S'.                     
             10 CTP-R01-TRAN-CODE-QUALIFIER        PIC X.                       
             10 CTP-R01-CIBC-PAYMENT-IND           PIC X.                       
               88 CTP-R01-CIBC-PAYMT-UNVERIFIED  VALUE 'U'.                     
               88 CTP-R01-CIBC-PAYMT-VERIFIED    VALUE 'V'.                     
A42374       10 CTP-TLP-REJECT-REASON              PIC XX.                      
               88 TLP-OK                             VALUE '  '.                
               88 TLP-BAD-EXP-DATE-01                VALUE '01'.                
               88 TLP-SKU-NOT-FOUND                  VALUE '02'.                
               88 TLP-TRY-CREDIT-SAC-NO-PLAN-ID      VALUE '03'.                
               88 TLP-CLASSCODE-NOT-PRCA-FOR-SAC     VALUE '4A'.                
               88 TLP-CLASSCODE-NOT-PR-FOR-DEFER     VALUE '4B'.                
               88 TLP-TLP-REJECT-05                  VALUE '05'.                
               88 TLP-INVALID-CTP-TLP-TYPE-IND       VALUE '06'.                
               88 TLP-BAD-TRNS-ACCT-FUNC             VALUE '07'.                
               88 TLP-REASSIGN-TCAT-NOT-FOUND-08     VALUE '08'.                
               88 TLP-BAD-SAC-MP-09                  VALUE '09'.                
               88 TLP-BAD-SAC-MP-10                  VALUE '10'.                
               88 TLP-BAD-EXP-DATE-11                VALUE '11'.                
               88 TLP-REASSIGN-TCAT-NOT-FOUND-12     VALUE '12'.                
               88 TLP-TLP-REJECT-13                  VALUE '13'.                
               88 TLP-BAD-EXP-DATE-14                VALUE '14'.                
               88 TLP-BAD-SAC-MP-15                  VALUE '15'.                
               88 TLP-BAD-SAC-MP-16                  VALUE '16'.                
               88 TLP-BAD-PAY-DATE-17                VALUE '17'.                
               88 TLP-BAD-PAY-DATE-18                VALUE '18'.                
               88 TLP-BAD-PAY-DATE-19                VALUE '19'.                
               88 TLP-BAD-PAY-DATE-20                VALUE '20'.                
               88 TLP-BAD-EXP-DATE-21                VALUE '21'.                
               88 TLP-BAD-EXP-DATE-22                VALUE '22'.                
               88 TLP-REASSIGN-TCAT-NOT-FOUND-23     VALUE '23'.                
               88 TLP-BAD-EXP-DATE-24                VALUE '24'.                
               88 TLP-NO-SKU-FOR-DEFER-CREDIT        VALUE '25'.                
               88 TLP-CANT-DEFER-A-FEE               VALUE '26'.                
               88 TLP-ACCT-CHARGE-OFF                VALUE '27'.                
               88 TLP-INVALID-SAC-INSTALLMENT        VALUE '28'.                
               88 TLP-BAD-SKU-IND                    VALUE '29'.                
               88 TLP-SKU-IND-NOT-FOUND              VALUE '30'.                
               88 TLP-SKU-REASSGN-TCAT-NOT-FOUND     VALUE '31'.                
               88 TLP-BAD-SKU-TLP-OPT                VALUE '32'.                
               88 TLP-INVALID-END-DATE               VALUE '33'.                
DAVID        10 CTP-R01-RECON-CURRCODE             PIC X(3).                    
168234       10 CTP-R01-BUSINESS-APP-ID            PIC X(2).                    
             10 CTP-R01-DETAIL-VARIABLE            PIC X(979).                  
                                                                        00000500
------*----TRANSACTION DETAIL VARIABLE DATA FOR TRANSACTIONS--------------------
------*----INCLUDING SALES DRAFTS, CREDIT VOUCHERS, CASH------------------------
------*----DISPURSEMENTS, PAYMENTS AND REVERSALS.-------------------------------
             10 CTP-R01-TRANSACTION-DETAIL                                      
                  REDEFINES CTP-R01-DETAIL-VARIABLE.                            
               15 CTP-R01-FIXED-INFORMATION.                                    
                 20 CTP-R01-CENTRAL-PROC-DATE      PIC 9(4).                    
                 20 CTP-R01-REFERENCE-NUM          PIC X(23).                   
                 20 CTP-R01-MERCHANT-ACCT-NUMB     PIC 9(16).                   
                 20 CTP-R01-MERCHANT-41-FLAG       PIC X.                       
                   88 CTP-R01-MERCHANT41-YES     VALUE 'Y'.                     
                 20 CTP-R01-TRANSACTION-DESCRIP    PIC X(41).                   
                 20 CTP-R01-MERCHANT-DESCRIPTION                                
                      REDEFINES CTP-R01-TRANSACTION-DESCRIP.                    
                   25 CTP-R01-MERCHANT-DBA-NAME    PIC X(25).                   
                   25 CTP-R01-MERCHANT-DBA-CITY    PIC X(13).                   
                   25 CTP-R01-MERCHANT-DBA-STATE   PIC X(3).                    
                 20 CTP-R01-MERCHANT-DBA-COUNTRY   PIC X(3).                    
                 20 CTP-R01-MERCHANT-ZIP           PIC X(10).                   
                 20 CTP-R01-MERCHANT-CATEGORY-CODE PIC 9(4).                    
392696             88 CTP-TNE-MCC-VS            VALUE 3351 THRU 3629,           
392696                                                3631 THRU 3999,           
R47950                                                4111, 4112, 4121,         
R18376                                                4131, 4411,               
R18376                                                7011, 7512,               
P68174                                                4457, 5812, 5813,         
P68174                                                7033, 7394, 7513,         
392696                                                5552, 7523, 5411,         
P68174                                                7519, 7996, 7999.         
392696             88 CTP-TNE-MCC-PL            VALUE 4121.                     
                 20 CTP-DBT-ACH-IND                PIC X.                       
                 20 CTP-R01-INTERCHANGE-QUAL       PIC XX.                      
                 20 CTP-R01-INTERCHG-PERCENT-RATE  PIC S99V999 COMP-3.          
                 20 CTP-R01-INTERCHG-PER-ITEM-RATE PIC S9V9(4) COMP-3.          
                 20 CTP-R01-TRAN-AUTHORIZATION     PIC X.                       
                   88 CTP-R01-TRAN-AUTHORIZATION-YES  VALUE 'Y'.                
                 20 CTP-R01-AUTHORIZATION-CODE     PIC X(6).                    
                                                                        00000500
------*----FOREIGN CURRENCY DATA------------------------------------------------
                 20 CTP-R01-MERCH-TRAN-CURR-CODE   PIC 999.                     
                 20 CTP-R01-CURRENCY-CODE                                       
                      REDEFINES CTP-R01-MERCH-TRAN-CURR-CODE  PIC 999.          
                 20 CTP-R01-USER-CURRENCY-CODE     PIC 999.                     
                 20 CTP-R01-AMT-TRANSACTION-ORIG   PIC S9(11) COMP-3.           
                 20 CTP-R01-DATE-CONVERSION        PIC 9(4).                    
P68929           20 CTP-R01-POI-CURR-CONV-AMT      PIC S9(13) COMP-3.           
                 20 CTP-R01-SOURCE-DECIMAL         PIC 9.                       
                 20 CTP-R01-DESTINATION-DECIMAL    PIC 9.                       
                 20 CTP-R01-US-DOL-AMT             PIC S9(9)V99 COMP-3.         
                 20 CTP-R01-SERV-DEVLPMT           PIC X.                       
                 20 CTP-R01-GL-CODE                PIC X(4).                    
                                                                        00000500
------*----FIELDS ASSOCIATED WITH VISA TRANSACTIONS-----------------------------
                 20 CTP-R01-TIIF-INFORMATION.                                   
                   25 CTP-R01-AUTHORIZATION-SRCE-CDE  PIC X.                    
                   25 CTP-R01-TMP-TRM-CAPABILITY   PIC X.                       
                   25 CTP-R01-TMP-TERMINAL-ENTRY   PIC XX.                      
                   25 CTP-R01-TMP-CARDHOLDER-ID-CODE  PIC 9.                    
                 20 CTP-R01-SPEC-COND-CODE.                                     
                   25 CTP-R01-SPEC-COND-CODE1      PIC X.                       
                   25 CTP-R01-SPEC-COND-CODE2      PIC X.                       
                 20 CTP-R01-REIM-ATTR-CODE         PIC X.                       
                 20 CTP-R01-PCAS-FLAG              PIC X.                       
                   88 AT31-PCAS-NO               VALUE 'N'.                     
                 20 CTP-R01-FLOOR-LIMIT-CODE       PIC X.                       
                 20 CTP-R01-CWB-CODE               PIC X.                       
                   88 CTP-R01-NOT-CWB-APPLICABLE VALUE ' '.                     
                   88 CTP-R01-LIST-ON-CWB-CRB    VALUE 'Y'.                     
                   88 CTP-R01-NOT-LISTED-CWB-CRB VALUE 'N'.                     
                   88 CTP-R01-INVALID-LIST-DATE  VALUE 'I'.                     
                 20 CTP-R01-CARD-ACCEPTOR-ID       PIC X(15).                   
                 20 CTP-R01-TERMINAL-ID            PIC X(8).                    
                 20 CTP-R01-ENH-REJECT-REASON      PIC X.                       
                   88 ENH-INVALID-OPT-SET        VALUE 'A'.                     
                   88 ENH-INVALID-ENH-PLAN       VALUE 'B'.                     
                   88 ENH-INVALID-METHOD         VALUE 'C'.                     
                   88 ENH-INVALID-EXT-TRAN-CODE  VALUE 'D'.                     
                   88 ENH-ENROLLMENT-EDIT        VALUE 'E'.                     
                   88 ENH-INVALID-STATUS         VALUE 'F'.                     
                   88 ENH-NOT-FOUND-TO-ADJ       VALUE 'G'.                     
                   88 ENH-NOT-FOUND-FOR-TRIGGER  VALUE 'H'.                     
                   88 ENH-TRIGGER-NOT-ACTIVE     VALUE 'I'.                     
                   88 ENH-TCAT-BAL-STRUCT-N      VALUE 'J'.                     
                 20 CTP-R01-ENH-PLAN-ID            PIC XX.                      
                 20 CTP-R01-MAIL-PHONE-CODE        PIC X.                       
                 20 CTP-R01-MEMBER-ID              PIC 9(8).                    
                 20 CTP-R01-ATM-ACCT-SEL           PIC X.                       
                 20 CTP-R01-PS2000-TRAN-ID         PIC X(15).                   
                 20 CTP-R01-PS2000-AUTH-AMT        PIC S9(13) COMP-3.           
                 20 CTP-R01-PS2000-AUTH-CURR       PIC X(3).                    
                 20 CTP-R01-PS2000-AUTH-RESP-CODE  PIC XX.                      
                 20 CTP-R01-PS2000-VALIDATION-CODE PIC X(4).                    
                 20 CTP-R01-MULTI-CLEAR-SEQ-NBR    PIC XX.                      
                 20 CTP-R01-ZERO-TRAN-DATE-IND     PIC X.                       
                 20 CTP-R01-ISO-ADDR-VER-RESULT    PIC X.                       
                 20 CTP-R01-TRAN-AUTH-DATE         PIC 9(4).                    
                 20 CTP-R01-ADJUST-PROCESS-IND     PIC X.                       
                 20 CTP-R01-REQUESTED-PAY-SERV     PIC X.                       
145241           20 CTP-R01-CONVERSION-RATE-IND    PIC X.                       
145241             88 CTP-R01-CONVERSION-RATE-NO     VALUE ' '.                 
145241             88 CTP-R01-CONVERSION-RATE-NA     VALUE '0'.                 
145241             88 CTP-R01-CONVERSION-RATE-M      VALUE '1'.                 
145241             88 CTP-R01-CONVERSION-RATE-NM     VALUE '2'.                 
                 20 CTP-R01-CARD-ACTIVATED-TERM-ID PIC X.                       
                   88 CTP-R01-TERM-ID-NOT-APPLICABLE VALUE SPACES.              
                   88 CTP-R01-TERM-ID-LIMITED-AMT    VALUE '1'.                 
                   88 CTP-R01-TERM-ID-AUTO-DISPEN    VALUE '2'.                 
                   88 CTP-R01-TERM-ID-SELF-SERVE     VALUE '3'.                 
                 20 CTP-R01-PREPAID-CARD-IND       PIC X.                       
                   88 CTP-R01-PREPAID-NOT-APPLICABLE VALUE SPACES.              
                   88 CTP-R01-IS-A-PREPAID-CARD      VALUE 'P'.                 
                                                                        00000500
------*----THE FOLLOWING FIELDS ARE USED IN THE POSTING PROCESS,----------------
------*----BUT ARE NOT STORED ON THE TRANSACTION DATABASE.----------------------
                 20 CTP-R01-AUTO-DED-TYPE          PIC X.                       
                   88 CTP-R01-DDA-DEDUCTION         VALUE 'D'.                  
                   88 CTP-R01-SAVING-DEDUCTION      VALUE 'S'.                  
                   88 CTP-R01-PAYROLL-DEDUCTION     VALUE 'P'.                  
                   88 CTP-R01-BILL-CHECK-DEDUCTION  VALUE 'B'.                  
                   88 CTP-R01-ACH-DEDUCTION         VALUE 'A'.                  
                 20 FILLER                         PIC XX.              05410000
                 20 CTP-R01-PAYMENT-SERVICE-ID     PIC X.                       
                   88 CTP-R01-DOES-NOT-MEET-REQ  VALUE 'N'.                     
                   88 CTP-R01-MEETS-REPS-REQ     VALUE 'A'.                     
                 20 CTP-R01-EXCLUDED-TRAN-ID       PIC X.                       
                   88 CTP-R01-TRAN-ID-PRESENT    VALUE ' '.                     
                   88 CTP-R01-NO-TRAN-ID-PRESENT VALUE 'A'.                     
                 20 CTP-R01-STORE-TYPE             PIC X.                       
                 20 CTP-R01-NATIONAL-REIMB-FEE     PIC S9(11)V99 COMP-3.        
                 20 CTP-R01-PAYMENT-IND            PIC X.                       
                   88 CTP-R01-PAYMENT-CCON       VALUE 'C'.                     
                   88 CTP-R01-PAYMENT-ECON       VALUE 'E'.                     
                   88 CTP-R01-PAYMENT-PCON       VALUE 'P'.                     
B04561           20  CTP-EXCES-PAYMENT-ALLOC-MTHD                               
B04561               REDEFINES CTP-R01-PAYMENT-IND PIC X(1).                    
               15 CTP-GNS-DATA.                                                 
                 20 CTP-R01-TRAN-CODE              PIC X(4).                    
                 20 CTP-R01-TRANS-DATE             PIC S9(9) COMP-3.            
                 20 CTP-R01-TRANS-TIME             PIC S9(7) COMP-3.            
                 20 CTP-R01-ACTN-CODE              PIC X(3).                    
                 20 CTP-R01-CHGBK-RSN-CODE         PIC X(4).                    
                 20 CTP-R01-TRANSACTION-AMOUNT     PIC S9(13)V99 COMP-3.        
                 20 CTP-R01-FRST-PRESNT-TIME       PIC S9(7) COMP-3.            
                 20 CTP-R01-POINT-OF-SERVICE-CD    PIC X(12).                   
                 20 CTP-R01-ACQUIR-INST-PROC-ID    PIC X(11).                   
                 20 CTP-R01-CARD-ACCEPTOR-END      PIC X(13).                   
                 20 CTP-R01-CARD-ACPT-ADDR-L1      PIC X(38).                   
                 20 CTP-R01-CARD-ACPT-CITY-END     PIC X(8).                    
                 20 CTP-R01-FRST-PRES-CURRNCY      PIC X(3).                    
                 20 CTP-R01-TRN-DECIMAL            PIC XX.                      
                 20 CTP-R01-TRN-DECIMALS                                        
                     REDEFINES CTP-R01-TRN-DECIMAL PIC 9(4) COMP.               
                 20 CTP-R01-ISSUER-ID              PIC X(11).                   
                 20 CTP-R01-PROCESSOR-ID           PIC X(11).                   
                 20 CTP-R01-NET-PROC-DATE          PIC S9(9) COMP-3.            
                 20 CTP-R01-NET-PROC-TIME          PIC S9(7) COMP-3.            
                 20 CTP-R01-INTERCHANGE-FEE        PIC S9(13)V99 COMP-3.        
                 20 CTP-R01-FRST-PRESNT-CNV-RT     PIC S9(7)V9(8)               
                                                     COMP-3.                    
                 20 CTP-R01-FRST-PRESNT-PRC-DT     PIC S9(9) COMP-3.            
                 20 CTP-R01-FRST-PRESNT-PRC-TM     PIC S9(7) COMP-3.            
                 20 CTP-R01-ISSURE-AUTH-AMT        PIC S9(13)V99 COMP-3.        
                 20 CTP-R01-FUNCTN-CODE            PIC X(3).                    
                 20 CTP-R01-PROCESS-CODE           PIC X(6).                    
                 20 CTP-R01-REJECT-RSN-CDS         PIC X(40).                   
                 20 CTP-R01-FRST-PRS-AMT-1ST       PIC S9(5) COMP-3.            
                 20 CTP-R01-ISS-NET-SETTLE-1ST     PIC S9(5) COMP-3.            
                 20 CTP-R01-MSG-RSN-CODE           PIC X(4).                    
                 20 CTP-R01-ACQ-INST-ID-CD         PIC X(11).                   
                 20 CTP-R01-LANGUAGE-FLIP-IND      PIC X.                       
                   88 BYPASS-LANGUAGE-FLIP       VALUE 'Y'.                     
               15 CTP-EUR-DATA.                                                 
                 20 CTP-R01-APPROVAL-CODE          PIC X(6).                    
                 20 CTP-R01-DATE-CARD-EXPIRA       PIC X(4).                    
                 20 CTP-R01-DATE-CURR-CONV         PIC 9(7) COMP-3.             
                 20 CTP-R01-SETTLMNT-METH-IND      PIC X.                       
                 20 CTP-R01-ISSURE-REF-DATA        PIC X(10).                   
                 20 CTP-R01-E-IPROC-END-PT-CD      PIC XX.                      
                 20 CTP-R01-EUR-AMOUNT-TRANS       PIC S9(11) COMP-3.           
                 20 CTP-R01-CARD-SEQ-NUM           PIC X(3).                    
P55918           20 CTP-R01-ACCT-NUM-TYPE          PIC XX.                      
                 20 CTP-R01-EUROPEAN-POST-CODE     PIC X(10).                   
116148           20 CTP-R01-WALLET-ID              PIC X(3).                    
116148           20 FILLER                         PIC X(5).                    
                 20 CTP-R01-ISSUER-CNTRY-CODE      PIC X(3).                    
                 20 CTP-R01-EURO-REGION-ID         PIC 9.                       
                 20 CTP-R01-ISO-TRAN-TRACE         PIC X(22).                   
                 20 CTP-R01-TRACE-AUDIT-NUM        PIC X(6).                    
                 20 FILLER                         PIC X(7).                    
                 20 CTP-R01-CONVER-RATE-BILL       PIC S9(9) COMP-3.            
                 20 CTP-R01-CURR-CODE-BILL         PIC X(3).                    
                 20 CTP-R01-FEE-AMT-SIGH           PIC X.                       
                 20 FILLER                         PIC X(13).                   
                 20 CTP-R01-ISO-ACCEPT-REGN        PIC X.                       
                 20 CTP-R01-USER-CURR-CODE         PIC X(3).                    
                 20 FILLER                         PIC X(9).                    
                 20 CTP-R01-CARDHOLDER-PLAN        PIC X(4).                    
                   88 CTP-EURO                   VALUE X'00000004'.             
                 20 CTP-RO1-CURR-DECIMAL-TRANS     PIC X.                       
                 20 CTP-R01-APP-CRYPTOGRAM         PIC X(16).                   
                 20 CTP-R01-UNPREDICTABLE-NUM      PIC X(8).                    
                 20 CTP-R01-APP-TRAN-CNTR          PIC X(4).                    
                 20 CTP-R01-APP-INTCHG-PROFILE     PIC X(4).                    
                 20 CTP-R01-CHIP-TRAN-DATE         PIC 9(6).                    
                 20 CTP-R01-CHIP-TRAN-TYPE         PIC 99.                      
                 20 CTP-R01-CHIP-COND              PIC X.                       
                 20 CTP-R01-CHIP-CNCY-CODE         PIC 9(3).                    
                 20 CTP-R01-CHDLR-VERI-MTHD-RSLT   PIC X(8).                    
                 20 CTP-R01-CHIP-DERIV-KEY-NDX     PIC XX.                      
                 20 CTP-R01-CHIP-TERM-CAP          PIC X(6).                    
                 20 CTP-R01-TERM-CNTRY-CODE        PIC 9(3).                    
                 20 CTP-R01-TERM-TYPE              PIC 99.                      
                 20 CTP-R01-RECURR-PAYMENT-IND     PIC X.                       
                 20 CTP-R01-TERM-VERIFICATION      PIC 9(10).                   
                 20 CTP-R01-ORIGNATN-SORT-CODE     PIC S9(7) COMP-3.            
                 20 CTP-R01-ORIGNATN-ACCT-NUMB     PIC S9(9) COMP-3.            
                 20 FILLER                         PIC X(18).                   
                 20 CTP-R01-CONV-RATE-EURO         PIC S9(6)V9(9)               
                                                     COMP-3.                    
                 20 CTP-R01-FX-FEE-IND             PIC X.                       
                 20 CTP-RO1-NEW-CONVERSION-RATE    PIC S9(8)V9(9)               
                                                     COMP-3.                    
                 20 CTP-R01-NEW-EUROPAY-CONV-RATE  PIC S9(8)V9(9)               
                                                     COMP-3.                    
                 20 CTP-R01-NEW-AMEX-CONV-RATE     PIC S9(8)V9(9)               
                                                     COMP-3.                    
                 20 CTP-R01-CURR-PROFIT-CENTER     PIC X(10).                   
                 20 CTP-R01-AUTHORIZATION-AMT      PIC S9(13) COMP-3.           
                 20 CTP-R01-AUTHORIZATION-DEC      PIC 9.                       
                 20 CTP-R01-CHIP-CARD-AUTH-AMT     PIC S9(11) COMP-3.           
                 20 CTP-R01-OTHER-AMT              PIC S9(11) COMP-3.           
                 20 CTP-R01-CRDHLDR-VERIF-MTHD     PIC X(3).                    
                 20 CTP-R01-CHIP-CRYPTOGRAM-VER    PIC XX.                      
                 20 CTP-R01-MC-ISSUER-APP-DATA     PIC X(32).                   
                 20 CTP-R01-ENHANCEMENT-ID         PIC X(4).                    
                 20 CTP-R01-INS-RATE-IND           PIC X.                       
                 20 CTP-R01-CRYPTOGRAM-AMOUNT      PIC S9(13) COMP-3.           
                 20 CTP-R01-AUTH-DECLINED          PIC X.                       
A45782           20 CTP-R01-INTERCHANGE-QUAL-NEW   PIC XX.                      
A48906           20 CTP-R01-CHIP-CVV2              PIC X.                       
A48856           20 CTP-R01-ICC-CHIP-PIN-IND       PIC XX.                      
A48856           20 CTP-R01-CARD-CAPABILITY        PIC X.                       
                 20 FILLER                         PIC X(1).                    
               15 CTP-R03-PS2000-INFO.                                          
                 20 CTP-R03-PURCHASE-ID-DATA       PIC X(25).                   
                 20 CTP-R03-NO-SHOW-INDICATOR      PIC X.                       
                 20 CTP-R03-EXTRA-CHARGES          PIC X(6).                    
                 20 CTP-R03-DATE-CHECK-IN-OUT      PIC S9(7) COMP-3.            
                 20 CTP-R03-AMT-TOTAL-AUTHORIZED   PIC S9(11)V99                
                                                     COMP-3.                    
               15 CTP-R01-EXPANSION-AREA.                                       
                 20 CTP-R01-AWARDS-PROMO-ID        PIC X(8).                    
                 20 CTP-R01-MERCHANT-ADDRESS       PIC X(25).                   
B08406           20 CTP-R01-VISA-INTRCHG-FEE-AMT   PIC S9(13)V99 COMP-3.        
A46758           20 CTP-R01-VISA-INTRCHG-FEE-SIN   PIC X.                       
A46758           20 CTP-R01-VISA-FEE-PROGRAM       PIC XXX.                     
      *          20 FILLER                         PIC X(17).                   
B24779           20 CTP-R01-TRNSIT-ROU-N           PIC X(05).                   
B24779           20 CTP-R01-BANK-ACT-NUM           PIC X(07).                   
B24775*          20 CTP-R01-CARD-TYPE-IND          PIC X(01).                   
                 20 FILLER                         PIC X(05).                   
A52538       10 CTP-R01-BUS-ACTIVITY-FLD           PIC X(24).                   
R31748       10 CTP-MNF-AREA REDEFINES CTP-R01-BUS-ACTIVITY-FLD.                
R31748          15  CTP-MNF-PARTIAL-RVSL-IND       PIC X(01).                   
R31748          15  CTP-MNF-CARD-NOT-PRESENT-IND   PIC X(01).                   
P60414          15  CTP-MNF-POS-TRAN-STAT          PIC X(01).                   
225581          15  CTP-MNF-MESSAGE-TYPE-CODE      PIC X(04).                   
225581          15  CTP-MNF-MESSAGE-SYSTEM         PIC X(01).                   
R31748          15  FILLER                         PIC X(16).                   
A55728       10 CTP-R01-CNCY-MARKUP-AMT            PIC S9(11) COMP-3.           
A55728       10 CTP-R01-ISSUER-FEE-AMT             PIC S9(11) COMP-3.           
A55728       10 CTP-R01-ISA-AMT-FOR-LCA            PIC S9(11) COMP-3.           
A55728       10 CTP-R01-MC-LIFE-VLDAT-CODE         PIC X(15).                   
A55728       10 CTP-R01-VISA-MSADI                 PIC X(1).                    
A55728       10 CTP-R01-MC-AUTH-ECSI               PIC X(3).                    
A53362       10 CTP-R01-TRANSACTION-TENDER         PIC X(1).                    
A57491       10 CTP-R01-RETRIEVAL-REF-NUM          PIC X(12).                   
A59426       10 CTP-R01-CASH-BACK-IND              PIC X(01).                   
A59426       10 CTP-R01-MC-ELEC-CARD-IND           PIC X(01).                   
A59426       10 CTP-R01-CROSS-BORDER-FEE-IND       PIC X(02).                   
B64180       10 CTP-ACCOUNT-IDENTIFIER             PIC S9(11) COMP-3.           
B00753       10 CTP-R01-TRNS-SRC-INTERCHG          PIC X(01).                   
B03727       10 CTP-R01-ACB-RC72-CLSD-ACCT-IND     PIC X(01).                   
B06933       10 CTP-R01-EXPIRATION-ACCT-CARD       PIC X(04).                   
B11077       10 CTP-R01-CHIP-SERVICE-CD            PIC X(03).                   
B15695       10 CTP-R01-CHIP-FORMS-FACTORS-IND     PIC X(08).                   
B15695       10 CTP-R01-MC-ASSIGN-ID               PIC X(06).                   
B15010       10 CTP-R01-SYS-TRACE-AUDIT-NUM        PIC X(06).                   
B15010       10 CTP-R01-PARTIAL-SHIPMENT-IND       PIC X(01).                   
B15010       10 CTP-R01-POS-ENTRY-MODE             PIC X(03).                   
B15010       10 CTP-R01-TRACK-DATA-COND-CODE       PIC X(02).                   
B15010       10 CTP-R01-POS-DATA                   PIC X(13).                   
B15010       10 CTP-R01-AMT-SALES-TAX              PIC S9(11)V99 COMP-3.        
B15010       10 CTP-R01-ADJ-TRAN-DATE              PIC S9(7) COMP-3.            
B15010       10 CTP-R01-ADJ-POST-DATE              PIC S9(7) COMP-3.            
B15010       10 CTP-R01-TRANSACTION-ID-NUMB        PIC X(16).                   
B18782       10 CTP-R01-MC-PROG-REG-ID             PIC X(03).                   
B18782       10 CTP-R01-MC-PMT-TRANS-INIT          PIC X(03).                   
B18782       10 CTP-R01-GEN-PROGRAM-INDICATOR      PIC X(02).                   
B18782       10 CTP-R01-VISA-MERCH-VERI-VALUE      PIC X(10).                   
B12190       10 CTP-R01-CHARGE-FEE-DIR-PAY-IND     PIC X(01).                   
   ¦           88 CTP-R01-TERM-TRANS-CHRG-FEE-Y   VALUE 'Y'.                    
   ¦           88 CTP-R01-TERM-TRANS-CHRG-FEE-N   VALUE 'N'.                    
   ¦           88 CTP-R01-DIRECTED-PAYMENT-IND    VALUE 'P'.                    
B26618         88 CTP-R01-DIR-PAY-PRIN-ONLY-IND   VALUE 'R'.                    
B19383       10 CTP-R01-NETWORK-SOURCE             PIC X(01).                   
   ¦           88 CTP-R01-VISA                    VALUE 'V'.                    
   ¦           88 CTP-R01-MASTERCARD              VALUE 'M'.                    
   |           88 CTP-R01-AMEX                    VALUE 'A'.                    
   |           88 CTP-R01-DISCOVER                VALUE 'S'.                    
   |           88 CTP-R01-GNS                     VALUE 'G'.                    
   |           88 CTP-R01-JCB                     VALUE 'J'.                    
   |           88 CTP-R01-DINERS                  VALUE 'D'.                    
   |           88 CTP-R01-ON-US                   VALUE 'O'.                    
   |           88 CTP-R01-INTERLINK               VALUE 'K'.                    
   |           88 CTP-R01-PLUS                    VALUE 'L'.                    
   |           88 CTP-R01-NETWORK2                VALUE 'N'.                    
   |           88 CTP-R01-PULSE                   VALUE 'E'.                    
   |           88 CTP-R01-SYSGEN                  VALUE 'Z'.                    
   |           88 CTP-R01-NYCE                    VALUE 'Y'.                    
   |           88 CTP-R01-STAR                    VALUE 'T'.                    
   |           88 CTP-R01-GATEWAY                 VALUE 'B'.                    
   |           88 CTP-R01-MDS                     VALUE 'C'.                    
P33958         88 CTP-R01-MAESTRO                 VALUE 'I'.                    
P33958         88 CTP-R01-CIRRUS                  VALUE 'F'.                    
P33958         88 CTP-R01-ACCEL                   VALUE 'H'.                    
B19498       10 CTP-R01-DEBIT-FUNDING-IND          PIC X(01).                   
B20603       10 CTP-R01-TREASURY-RATE             PIC S9(5)V9(6) COMP-3.        
B21331       10 CTP-R01-CHIP-CARD-SOURCE-CODE      PIC X(1).                    
R12079       10 FILLER                             PIC X(5).                    
B21725       10 CTP-R01-PAY-TYPE                   PIC X(3).                    
B21725       10 CTP-R01-PAY-SOURCE                 PIC X(3).                    
B24259       10 CTP-R01-ADR-OPRID                  PIC X(3).                    
B30559       10 CTP-R01-COMMON-PROG-PART-IND       PIC X(20).                   
B30559       10 CTP-R01-GRATUITY-AMT           PIC S9(13)V99 COMP-3.            
B33380       10 CTP-R01-INTERCHG-RATE-QUAL         PIC X(08).                   
B33380       10 CTP-R01-TRAN-CODE-EXT              PIC X(06).                   
B32983       10 CTP-R01-APPLIED-CONV-RATE          PIC S9(08)V9(9)              
B32983                                                 COMP-3.                  
B32983       10 CTP-R01-APPLIED-CONV-TRAN-AMT      PIC S9(11)V9(2)              
B32983                                                 COMP-3.                  
B32983       10 CTP-R01-OPTM-FOREX-GAIN-LOSS       PIC S9(11)V9(2)              
B32983                                                 COMP-3.                  
B32983       10 CTP-R01-MARKUP-FEE-RATE            PIC S9(03)V9(2)              
B32983                                                 COMP-3.                  
B33624       10 CTP-R01-VIRTUAL-CARD-NUM           PIC X(19).                   
B39356       10 CTP-R01-TRANSIT-PROG.                                           
B39356          15 CTP-R01-TRANSIT-TYPE-IND        PIC X(02).                   
B39356          15 CTP-R01-TRANSPORT-MODE-IND      PIC X(02).                   
B35865       10 CTP-R01-ACCESS-ACCT-NUM            PIC X(34).                   
R6214        10 CTP-R01-PRODUCT-ID                 PIC X(02).                   
R6214        10 CTP-R01-VISA-AGENT-UNIQUE-ID       PIC X(05).                   
R6214        10 CTP-R01-VISA-ADDL-AUTH-METHOD      PIC X(02).                   
R6214        10 CTP-R01-VISA-ADDL-AUTH-REASON      PIC X(02).                   
B41317       10 CTP-BRANCH-CHG-FLAG                PIC X(1).                    
B41317            88  CTP-BRANCH-CHG-YES           VALUE 'Y'.                   
B41317            88  CTP-BRANCH-CHG-NO            VALUE 'N'.                   
B41317       10 CTP-BRANCH-PREVIOUS                PIC X(6).                    
R12079       10 CTP-R01-SURCHARGE-AMT              PIC S9(13)V99 COMP-3.        
R12079       10 CTP-R01-SURCHARGE-AMT-CRDH-CUR     PIC 9(07)V99 COMP-3.         
R12079       10 CTP-R01-SURCHARGE-DC-IND           PIC X(01).                   
R12079       10 CTP-R01-VISA-FAST-FUND-IND         PIC X(01).                   
R30666       10 CTP-R01-MULTI-CLEAR-SEQ-CNT        PIC X(02).                   
W35204       10 CTP-R01-GEN-ECI-ECOMM-IND          PIC X(02).                   
W35204       10 CTP-R01-TOKEN-REQUESTOR-ID         PIC X(11).                   
W35204       10 CTP-R01-TOKEN-ASSURANCE-LEVEL      PIC X(02).                   
P47752       10 CTP-R01-MC-PMT-FACILITATOR-ID      PIC S9(11) COMP-3.           
P47752       10 CTP-R01-MC-IND-SALES-ORG-ID        PIC S9(11) COMP-3.           
P47752       10 CTP-R01-MC-SUB-MERCHANT-ID         PIC X(15).                   
P47752       10 FILLER                             PIC X(93).                   
                                                                                
                                                                                
********************************************************************************
*******E N D - O F - C P R C T P C B********************************************
********************************************************************************
