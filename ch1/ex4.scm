;; As applicative-order evaluation, (test 0 (p)) never terminates because (p) is evaluating when it passes as argument, but (p) is infinitely expanded.
;; As normal-order evalution, (test 0 (p)) returns 0 becuase it first evalutes predicate. Since predicate is true, 0 is returned and (p) never get evaluated.
