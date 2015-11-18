(declare (uses configf))
(use test)
(use srfi-69)

(define (lu struct key)
  (define (descender key-list-left struct-left)
    (cond
     ((null? key-list-left) struct-left)
     ((null? struct-left) #f)
     ((not struct-left) #f)
     ((type-checks#alist? struct-left)
      (descender
       (cdr key-list-left)
       (alist-ref
        (string->symbol
         (car key-list-left))
        struct-left)))
     ((hash-table? struct-left)
      (set! htt struct-left)
      (print "got ht")
      (descender
       (cdr key-list-left)
       (hash-table-ref/default
        struct-left
        (string->symbol (car key-list-left))
        #f)))
     (else #f)))

  (descender (string-split key ".") struct))
    
(use ini-file)
(let ((ini (read-ini "example.ini")))
  (print "database is " (alist-ref 'database ini))
  (print "database/host is "(alist-ref 'host (alist-ref 'database ini)))

  (print "ini-file: lu database.file=[" (lu ini "database.file")"]")
  )
  


(print "hello")
(define ht (make-hash-table))

(define inipath "example.ini")

(let ((res (read-config inipath ht #f)))
  (print (hash-table-ref ht "database"))

  (print "is alist?" (type-checks#alist? (hash-table-ref ht "database")))
  ;;(print "lu database.file" (lu "database.file"))
  (print "ini-file: lu database.file=[" (lu res "database.file")"]")

  (print "goo " htt)
  (print "goo keys " (hash-table-keys htt))

  (exit 0))



  

