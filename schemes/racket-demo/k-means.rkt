#lang racket
(require racket/dict
         math/distributions)

;; The k-means clustering:

;; Divides the set of points into k clusters
;; using the standard k-means clustering algorithm
(define (k-means data k #:initialization (init k-means++))
  (define (iteration centroids)
    (map centroid (clusterize data centroids)))
  (fixed-point iteration (init data k) #:same-test small-shift?))

;; Finds the centroid for a set of points
(define (centroid pts)
  (vector-map (curryr / (length pts))
       (for/fold ([sum (car pts)]) ([x (in-list (cdr pts))])
         (vector-map + x sum))))

;; Divides the set of points into clusters
;; using given centroids
(define (clusterize data centroids)
  (for*/fold ([res (map list centroids)]) ([x (in-list data)])
    (define c (argmin (distanse-to x) centroids))
    (dict-set res c (cons x (dict-ref res c)))))

;; Stop criterion: all centroids change their positions
;; by less then 0.1% of the minimal distance between centroids.
(define (small-shift? c1 c2)
  (define min-distance
    (apply min
           (for*/list ([x (in-list c2)]
                       [y (in-list c2)] #:unless (equal? x y))
             ((metric) x y))))
  (for/and ([a (in-list c1)] [b (in-list c2)])
    (< ((metric) a b) (* 0.001 min-distance))))

;; Initialization methods
;; picks k points from a dataset randomly
(define (random-choice data k)
  (for/list ([i (in-range k)])
    (list-ref data (random (length data)))))

;; uses k-means++ algorithm
(define (k-means++ data k)
  (for/fold ([centroids (random-choice data 1)]) ([i (in-range (- k 1))])
    (define weights
      (for/list ([x (in-list data)])
        (apply min (map (distanse-to x) centroids))))
    (define new-centroid
      (sample (discrete-dist data weights)))
    (cons new-centroid centroids)))

;; Different metrics
(define (euclidean-distance a b)
  (for/sum ([x (in-vector a)] [y (in-vector b)])
    (sqr (- x y))))

(define (manhattan-distance a b)
  (for/sum ([x (in-vector a)] [y (in-vector b)])
    (abs (- x y))))

(define metric (make-parameter euclidean-distance))
(define (distanse-to x) (curry (metric) x))

;; The fixed point operator
(define (fixed-point f x0 #:same-test [same? equal?])
  (let loop ([x x0] [fx (f x0)])
    (if (same? x fx) fx (loop fx (f fx)))))

;; Creating sample clusters
(define (gaussian-cluster N
                          #:stdev (σ 1)
                          #:center (r0 #(0 0))
                          #:dim (d 2))
  (for/list ([i (in-range N)])
    (define r (for/vector ([j (in-range d)]) (sample (normal-dist 0 σ))))
    (vector-map + r r0)))

(define (uniform-cluster N
                         #:radius (R 1)
                         #:center (r0 #(0 0)))
  (for/list ([i (in-range N)])
    (define r (* R (sqrt (sample (uniform-dist)))))
    (define φ (* 2 pi (sample (uniform-dist))))
    (vector-map + r0 (vector (* r (cos φ)) (* r (sin φ))))))

;; Visualization
(require plot)

(define (show-clustering data k #:method (method k-means++))
  (define c (k-means data k #:initialization method))
  (display
   (plot
    (append
     (for/list ([d (clusterize data c)]
                [i (in-naturals)])
       (points d #:color i #:sym 'fullcircle1))
     (list (points c
                   #:sym 'fullcircle7
                   #:fill-color 'yellow
                   #:line-width 3)))
    #:title (format "Initializing by ~a" (object-name method)))))


;; Testing
(module+ test
  (define circle (uniform-cluster 30000))
  ; using k-means++ method
  (show-clustering circle 6)
  ; using standard k-means method
  (show-clustering circle 6 #:method random-choice)
  ; using manhattan distance
  (parameterize ([metric manhattan-distance])
    (show-clustering circle 6)))

;; Difficult case
(module+ test
  (define clouds
    (append
     (gaussian-cluster 1000 #:stdev 0.5 #:center #(0 0))
     (gaussian-cluster 1000 #:stdev 0.5 #:center #(2 3))
     (gaussian-cluster 1000 #:stdev 0.5 #:center #(2.5 -1))
     (gaussian-cluster 1000 #:stdev 0.5 #:center #(6 0))))

  ; using k-means++ method
  (show-clustering clouds 4)
  ; using standard k-means method
  (show-clustering clouds 4 #:method random-choice))

;; Multi-dimensional case
(module+ test
  (define 5d-data
    (append
     (gaussian-cluster 1000 #:dim 5 #:center #(2 0 0 0 0))
     (gaussian-cluster 1000 #:dim 5 #:center #(0 2 0 0 0))
     (gaussian-cluster 1000 #:dim 5 #:center #(0 0 2 0 0))
     (gaussian-cluster 1000 #:dim 5 #:center #(0 0 0 2 0))
     (gaussian-cluster 1000 #:dim 5 #:center #(0 0 0 0 2))))

  (define centroids (k-means 5d-data 5))

  (map (curry vector-map round) centroids))
