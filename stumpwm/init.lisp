(in-package :stumpwm)

(setf *colors*
      ;; '("black" "red"    "green"   "magenta" "blue"    "yellow"  "cyan"    "white"))
      '("#101010" "#ff0086" "#00c918" "#ad00a1" "#3777e6" "#aba800" "#1faaaa" "#ffffff"))

(dolist (s *screen-list*)
  (update-color-map s))

(set-font "-*-terminus-medium-r-*-*-24-*-*-*-*-*-iso10646-1")

(clear-window-placement-rules)

(setf *mouse-focus-policy* :click)

(defvar *battery-timer* (run-with-timer 60 60 #'notify-battery-status))
(defvar *date-time-timer* (run-with-timer 30 1800 #'echo-date))

(uiop:launch-program '("systemctl" "--user" "start" "random-background.service"))
