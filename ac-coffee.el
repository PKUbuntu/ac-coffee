
;; Ref: http://coffeescript.org/documentation/docs/lexer.html
(defconst ac-coffee-keywords
  '(
    ;; JS-Keywords
    "true"  "false"  "null"  "this"
    "new"  "delete"  "typeof"  "in"  "instanceof"
    "return"  "throw"  "break"  "continue"  "debugger"
    "if"  "else"  "switch"  "for"  "while"  "do"  "try"  "catch"  "finally"
    "class"  "extends"  "super"
    
    ;; Coffee-Keywords
    "undefined"  "then"  "unless"  "until"  "loop"  "of"  "by"  "when"

    )

  "List of coffee keywords.")

(defconst coffee-lexer-command
  "coffee-lexer")


(defun run-coffee-lexer (file_path)
  (split-string (shell-command-to-string (concat coffee-lexer-command " " file_path)) "\n")
)

(defun make-coffee-candidates () 
  (append (run-coffee-lexer buffer-file-name) ac-coffee-keywords)
)

(defun ac-coffee-start-of-expression ()
  "Return point of the start of coffee expression at point.
Assumes symbol can be alphanumeric, '.' or '_' or TODO: '@', '('"
  (save-excursion
    (and (re-search-backward
          (rx (or buffer-start (regexp "[^[:alnum:]._]"))
              (group (1+ (regexp "[[:alnum:]._]"))) point)
          nil t)
         (match-beginning 1))))

(defvar ac-source-coffee
  '((candidates . make-coffee-candidates)
    (prefix . ac-coffee-start-of-expression))
  "Source for CoffeeScript")

(add-hook 'coffee-mode-hook
          '(lambda ()             
             (set (make-local-variable 'ac-sources) (append ac-sources '(ac-source-coffee)))))

(provide 'ac-coffee)
