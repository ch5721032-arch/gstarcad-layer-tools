;; layer-freeze-by-pattern.lsp - Freeze layers matching a name pattern
;; Load: APPLOAD -> layer-freeze-by-pattern.lsp
;; Run: LFREEZE
;; Example: LFREEZE -> enter pattern "HIDDEN-*"
;; Compatible with GstarCAD 2024-2026, AutoCAD 2021-2026

(defun c:LFREEZE (/ pattern layers frozen)
  (setq pattern (strcase (getstring "\nLayer name pattern (e.g. HIDDEN-*): "))
        layers (vla-get-layers
                (vla-get-activedocument (vlax-get-acad-object)))
        frozen 0)
  (vlax-for layer layers
    (if (wcmatch (strcase (vla-get-name layer)) pattern)
      (progn (vla-put-freeze layer :vlax-true)
             (setq frozen (1+ frozen)))))
  (princ (strcat "\nFrozen " (itoa frozen) " layer(s).")))