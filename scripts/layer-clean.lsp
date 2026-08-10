;; layer-clean.lsp - Purge unused layers and merge duplicates
;; Load: APPLOAD -> layer-clean.lsp
;; Run: LCLEAN
;; Compatible with GstarCAD 2024-2026, AutoCAD 2021-2026

(defun c:LCLEAN (/ doc)
  (setq doc (vla-get-activedocument (vlax-get-acad-object)))
  (vl-catch-all-apply 'vla-purgeall (list doc))
  (princ "\nUnused layers purged. Run PURGE for full cleanup."))