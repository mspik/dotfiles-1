(require 'smartrep)
(smartrep-define-key global-map "C-x"
  '(("o" . other-window)
    ("0" . delete-window)
    ("1" . delete-other-windows)
    ("2" . split-window-below)
    ("3" . split-window-right)
    ("{" . shrink-window-horizontally)
    ("}" . enlarge-window-horizontally)
    ("+" . balance-windows)
    ("^" . enlarge-window)
    ("-" . shrink-window)))
