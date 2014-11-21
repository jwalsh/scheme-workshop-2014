#!r6rs
(import (rnrs base)
        (rnrs io ports)
        (rnrs programs))
(put-bytes (standard-output-port)
           (call-with-port
            (open-file-input-port
             (cadr (command-line)))
            get-bytes-all))
