;; title: mpcoin
;; version: 1.0.0
;; summary: A simple fungible token called mpcoin
;; description: |
;;   mpcoin is a basic fungible token implementation for the Stacks blockchain.
;;   It supports minting by the contract owner and standard transfer operations.

(define-fungible-token mpcoin)

(define-data-var contract-owner principal tx-sender)

(define-read-only (get-contract-owner)
  (ok (var-get contract-owner))
)

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance mpcoin who))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) (err u100))
    (ft-transfer? mpcoin amount sender recipient)
  )
)

(define-public (mint (amount uint) (recipient principal))
  (let ((owner (var-get contract-owner)))
    (begin
      (asserts! (is-eq tx-sender owner) (err u101))
      (ft-mint? mpcoin amount recipient)
    )
  )
)

(define-public (set-contract-owner (new-owner principal))
  (let ((owner (var-get contract-owner)))
    (begin
      (asserts! (is-eq tx-sender owner) (err u102))
      (var-set contract-owner new-owner)
      (ok new-owner)
    )
  )
)
