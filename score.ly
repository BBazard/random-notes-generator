\version "2.16.2"

\score { 
  {
    \clef treble % edit here to change clef
    
    % clef list :

    % treble G4
    % bass   F3
    % alto   C4
    % tenor  C4
    
     $ (let ((random-state (seed->random-state (current-time))))
    
        (define randomnote
          (lambda (max)
            (random max random-state)))

	(define noteselected
   (let 
	  ((C2 0)
	   (D2 1)
	   (E2 2)
	   (F2 3)
	   (G2 4)
	   (A3 5)
	   (B3 6)
	   (C3 7)
	   (D3 8)
	   (E3 9)
	   (F3 10)
	   (G3 11)
	   (A4 12)
	   (B4 13)
	   (C4 14)
	   (D4 15)
	   (E4 16)
	   (F4 17)
	   (G4 18)
	   (A5 19)
	   (B5 20)
	   (C5 21)
	   (D5 22)
	   (E5 23)
	   (F5 24)
	   (G5 25)
	   (A6 26)
	   (B6 27)
	   (C6 28))
	    (lambda (idx)
	      (cond
	       ((and (<= F3 idx) (>= F4 idx)) #t) ; edit here to change the ambitus
	        (else #f)))))

        (make-sequential-music
          (map (lambda (x)
            (let createNote ((idx (randomnote 29)))
	      (if (noteselected idx)
       	        (let ((idx_q (quotient idx 7)) (idx_r (remainder idx 7)))
                  (make-event-chord
                    (list
                      (make-music 'NoteEvent
                                  'duration (ly:make-duration 2 0 1 1)
                                  'pitch (ly:make-pitch (- idx_q 1) idx_r 0)))))
		 (createNote (randomnote 29)))))
            (make-list 1000))))

    \bar "|."
	
  }

}
