; -*- mode: lisp -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Trubanc package definition
;;;

(cl:defpackage :trubanc-tokens
  (:use :cl)
  (:export
   #:$TIME
   #:$PRIVKEY
   #:$BANKID
   #:$TOKENID
   #:$REGFEE
   #:$TRANFEE
   #:$FEE
   #:$PUBKEY
   #:$PUBKEYSIG
   #:$ASSET
   #:$SHUTDOWNMSG
   #:$STORAGE
   #:$STORAGEFEE
   #:$FRACTION
   #:$ACCOUNT
   #:$LAST
   #:$REQ
   #:$BALANCE
   #:$MAIN
   #:$OUTBOX
   #:$OUTBOXHASH
   #:$INBOX
   #:$INBOXIGNORED
   #:$COUPON
   #:$ID
   #:$REGISTER
   #:$FAILED
   #:$REASON
   #:$GETREQ
   #:$GETTIME
   #:$GETFEES
   #:$SETFEES
   #:$TRANSFER
   #:$SPEND
   #:$GETINBOX
   #:$PROCESSINBOX
   #:$STORAGEFEES
   #:$SPENDACCEPT
   #:$SPENDREJECT
   #:$AFFIRM
   #:$GETASSET
   #:$GETOUTBOX
   #:$GETBALANCE
   #:$COUPONENVELOPE
   #:$GETVERSION
   #:$VERSION
   #:$WRITEDATA
   #:$READDATA
   #:$GRANT
   #:$DENY
   #:$PERMISSION
   #:$ANONYMOUS
   #:$KEY
   #:$DATA
   #:$BACKUP
   #:$READINDEX
   #:$WRITEINDEX
   #:$WALKINDEX
   #:$SIZE
   #:$ATREGISTER
   #:$ATOUTBOXHASH
   #:$ATSTORAGE
   #:$ATSTORAGEFEE
   #:$ATFRACTION
   #:$ATBALANCE
   #:$ATSETFEES
   #:$ATSPEND
   #:$ATTRANFEE
   #:$ATFEE
   #:$ATASSET
   #:$ATGETINBOX
   #:$ATPROCESSINBOX
   #:$ATSTORAGEFEES
   #:$ATSPENDACCEPT
   #:$ATSPENDREJECT
   #:$ATGETOUTBOX
   #:$ATBALANCEHASH
   #:$ATCOUPON
   #:$ATCOUPONENVELOPE
   #:$ATWRITEDATA
   #:$ATREADDATA
   #:$ATGRANT
   #:$ATDENY
   #:$ATPERMISSION
   #:$ATBACKUP
   #:$CUSTOMER
   #:$REQUEST
   #:$NAME
   #:$NOTE
   #:$ACCT
   #:$OPERATION
   #:$TRAN
   #:$AMOUNT
   #:$ASSETNAME
   #:$SCALE
   #:$PRECISION
   #:$PERCENT
   #:$TIMELIST
   #:$HASH
   #:$MSG
   #:$ERRMSG
   #:$BALANCEHASH
   #:$COUNT
   #:$BANKURL
   #:$ENCRYPTEDCOUPON
   #:$COUPONNUMBERHASH
   #:$ISSUER
   #:$BANK
   #:$BANKS
   #:$URL
   #:$NICKNAME
   #:$CONTACT
   #:$SESSION
   #:$PREFERENCE
   #:$TOKEN
   #:$HISTORY
   #:$PRIVKEYCACHEDP
   #:$NEEDPRIVKEYCACHE
   #:$FORMATTEDAMOUNT
   #:$MSGTIME
   #:$ATREQUEST
   #:$MINT-TOKENS
   #:$MINT-COUPONS
   #:$ADD-ASSET
   #:$UNPACK-REQS-KEY))

(cl:defpackage :trubanc
  (:use :cl :cffi :cl-base64 :cl-who :trubanc-tokens)
  (:export

   ;; ccl.lisp
   #:run-program
   #:quit
   #:df
   #:arglist
   #:gc
   #:save-application
   #:command-line-arguments
   #:backtrace-string
   #:current-process

   ;; sendmail.lisp
   #:email-mx-hosts
   #:send-email

   ;; timer.lisp
   #:timer
   #:cancel-timer

   ;; openssl-cffi.lisp
   #:decode-rsa-private-key
   #:encode-rsa-private-key
   #:decode-rsa-public-key
   #:encode-rsa-public-key
   #:rsa-generate-key
   #:public-key-id
   #:rsa-free
   #:sha1
   #:sign
   #:verify
   #:privkey-decrypt
   #:pubkey-encrypt
   #:pubkey-bits
   #:with-rsa-private-key
   #:pubkey-id
   #:id-p
   #:destroy-password
   #:mem-set-char
   #:bad-rsa-key-or-password

   ;; loomrandom.lisp
   #:urandom-bytes
   #:random-id

   ;; locks.lisp
   #:file-lock
   #:grab-file-lock
   #:with-lock-grabbed
   #:make-lock
   #:release-file-lock
   #:with-file-locked
   #:make-semaphore
   #:signal-semaphore
   #:wait-on-semaphore

   ;; fsdb.lisp
   #:db
   #:make-fsdb
   #:fsdb
   #:db-put
   #:db-get
   #:db-lock
   #:db-unlock
   #:db-contents
   #:db-subdir
   #:db-dir-p
   #:append-db-keys
   #:%append-db-keys
   #:with-fsdb-filename
   #:db-wrapper
   #:make-db-wrapper
   #:db-wrapper-db
   #:db-wrapper-get
   #:db-wrapper-contents
   #:commit-db-wrapper
   #:rollback-db-wrapper
   #:with-db-wrapper

   ;; parser.lisp
   #:parser
   #:getarg
   #:match-args
   #:parse
   #:patterns
   #:get-parsemsg
   #:with-db-lock
   #:match-pattern
   #:with-verify-sigs-p
   #:parser-always-verify-sigs-p
   #:match-message
   #:tokenize
   #:remove-signatures

   ;; bcmath.lisp
   #:bccomp
   #:bc=
   #:bcsub
   #:bcadd
   #:bcpow
   #:bcmul
   #:scale
   #:wbp
   #:number-precision
   #:max-number-precision
   #:split-decimal
   #:bcdiv
   #:digits
   #:is-numeric-p

   ;; timestamp.lisp
   #:timestamp
   #:next
   #:strip-fract
   #:get-unix-time
   #:unix-to-universal-time
   #:universal-to-unix-time

   ;; utilities.lisp, shared.lisp
   #:file-get-contents
   #:file-put-contents
   #:hex
   #:trim
   #:bin2hex
   #:hex2bin
   #:copy-memory-to-lisp
   #:copy-lisp-to-memory
   #:base64-encode
   #:base64-decode
   #:assocequal
   #:strcat
   #:dotcat
   #:balancehash
   #:assetid
   #:make-equal-hash
   #:get-inited-hash
   #:normalize-balance
   #:who
   #:whots
   #:data-contents
   #:data-cost
   #:client-db-dir
   #:make-latch
   #:signal-latch
   #:wait-on-latch
   #:fraction-digits
   #:storage-fee
   #:coupon-number-p
   #:dirhash
   #:all-processes
   #:process-run-function
   #:process-wait
   #:process-run-function
   #:create-directory
   #:recursive-delete-directory
   #:ensure-directory-pathname
   #:simple-makemsg
   #:as-string
   #:makemsg
   #:implode
   #:explode
   #:strstr
   #:str-replace
   #:zero-string
   #:blankp
   #:stringify
   #:hsc
   #:parm
   #:parms
   #:post-parm
   #:run-startup-functions
   #:xor
   #:xor-salt
   #:xor-strings
   #:browse-url
   #:add-startup-function

   ;; client.lisp & server.lisp
   #:id
   #:privkey
   #:pubkey
   #:server
   #:bankid
   #:tokenid
   #:process
   #:privkey
   #:make-server
   #:bankurl
   #:bankname
   #:privkey
   #:db
   #:finalize
   #:*last-commit*
   #:*save-application-time*

   ;; server-web.lisp
   #:with-debug-stream
   #:get-debug-stream-string
   #:enable-debug-stream
   #:debug-stream-enabled-p
   #:debugmsg
   #:debug-stream-p
   #:server-db-dir
   #:trubanc-web-server
   #:web-server-active-p
   #:stop-web-server
   #:port-server
   #:port-forwarded-from
   #:acceptor-port
   #:bind-parameters

   ;; toplevel.lisp
   #:write-application-name
   #:save-trubanc-application
   #:set-interactive-abort-process
   #:invoking-debugger-hook-on-interrupt
   #:backtrace-string))

(cl:defpackage :trubanc-server
  (:use :cl :cl-base64 :cl-who :trubanc :trubanc-tokens)
  (:export
   #:process
   #:make-server
   #:privkey
   #:bankurl
   #:bankname
   #:privkey
   #:db
   #:backup-mode-p
   #:start-backup-process
   #:stop-backup-process
   #:backup-failing-p
   #:backup-process-url
   #:backup-notification-email
   #:wrapped-db))

(cl:defpackage :trubanc-client
  (:use :cl :cl-base64 :cl-who :trubanc :trubanc-tokens)
  (:export
   #:client
   #:make-client
   #:syncedreq-p
   #:showprocess-p
   #:coupon
   #:last-spend-time
   #:keep-history-p
   #:server-times
   #:showprocess
   #:newuser
   #:get-privkey
   #:login
   #:login-with-sessionid
   #:login-new-session
   #:newsessionid
   #:xorcrypt
   #:logout
   #:the
   #:user-pubkey
   #:bank
   #:bank-id
   #:bank-name
   #:bank-url
   #:getbank
   #:getbanks
   #:url-p
   #:parse-coupon
   #:verify-coupon
   #:bankid-for-url
   #:verify-bank
   #:addbank
   #:setbank
   #:current-bank
   #:register
   #:privkey-cached-p
   #:need-privkey-cache-p
   #:cache-privkey
   #:fetch-privkey
   #:contact
   #:contact-id
   #:contact-name
   #:contact-nickname
   #:contact-note
   #:contact-banks
   #:contact-contact-p
   #:getcontacts
   #:getcontact
   #:addcontact
   #:deletecontact
   #:sync-contacts
   #:get-id
   #:getaccts
   #:asset
   #:asset-id
   #:asset-assetid
   #:asset-scale
   #:asset-precision
   #:asset-name
   #:asset-issuer
   #:asset-percent
   #:getassets
   #:getasset
   #:addasset
   #:fee
   #:make-fee
   #:fee-type
   #:fee-assetid
   #:fee-assetname
   #:fee-amount
   #:fee-formatted-amount
   #:getfees
   #:setfees
   #:balance
   #:balance-acct
   #:balance-assetid
   #:balance-assetname
   #:balance-amount
   #:balance-time
   #:balance-formatted-amount
   #:getreq
   #:gettime
   #:getbalance
   #:fraction
   #:fraction-assetid
   #:fraction-assetname
   #:fraction-amount
   #:fraction-scale
   #:balance+fraction
   #:balance+fraction-fraction
   #:getfraction
   #:getstoragefee
   #:reinit-balances
   #:validation-error
   #:spend
   #:spendreject
   #:gethistorytimes
   #:gethistoryitems
   #:removehistoryitem
   #:getcoupon
   #:inbox
   #:inbox-request
   #:inbox-id
   #:inbox-time
   #:inbox-msgtime
   #:inbox-assetid
   #:inbox-assetname
   #:inbox-amount
   #:inbox-formattedamount
   #:inbox-note
   #:inbox-reply
   #:inbox-items
   #:getinbox
   #:make-process-inbox
   #:process-inbox
   #:process-inbox-time
   #:process-inbox-request
   #:process-inbox-note
   #:process-inbox-acct
   #:getinboxignored
   #:processinbox
   #:storagefees
   #:assetinfo
   #:assetinfo-percent
   #:assetinfo-fraction
   #:assetinfo-storagefee
   #:assetinfo-digits
   #:outbox
   #:outbox-time
   #:outbox-id
   #:outbox-request
   #:outbox-assetid
   #:outbox-assetname
   #:outbox-amount
   #:outbox-formattedamount
   #:outbox-note
   #:outbox-items
   #:outbox-coupons
   #:getoutbox
   #:redeem
   #:getversion
   #:readdata
   #:writedata
   #:get-permissions
   #:get-granted-permissions
   #:permission
   #:make-permission
   #:permission-id
   #:permission-toid
   #:permission-permission
   #:permission-grant-p
   #:permission-time
   #:grant
   #:deny
   #:user-preference
   #:userreq
   #:trimmsg
   #:make-server-proxy
   #:backup
   #:backup*))

(cl:defpackage :trubanc-client-web
  (:use :cl :cffi :cl-base64 :cl-who :trubanc :trubanc-tokens :trubanc-client)
  (:export
   #:web-server))

(cl:defpackage :trubanc-test
  (:use :cl :trubanc :trubanc-tokens :trubanc-client))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Copyright 2009-2010 Bill St. Clair
;;;
;;; Licensed under the Apache License, Version 2.0 (the "License");
;;; you may not use this file except in compliance with the License.
;;; You may obtain a copy of the License at
;;;
;;;     http://www.apache.org/licenses/LICENSE-2.0
;;;
;;; Unless required by applicable law or agreed to in writing, software
;;; distributed under the License is distributed on an "AS IS" BASIS,
;;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;; See the License for the specific language governing permissions
;;; and limitations under the License.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
