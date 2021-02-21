(in-package :stumpwm)

(defcommand slynk-start () ()
  (slynk:create-server :dont-close t :port *slynk-port*))

(defcommand slynk-stop () ()
  (slynk:stop-server *slynk-port*))



(defcommand mpd-controller (&optional command) ((:rest-strings))
  (when command
    (run-shell-command (format nil "mpc -q ~A" command) t))

  (let ((*suppress-echo-timeout* t))
    (message "~A~%~A" (string-right-trim (string #\Newline)
                                         (run-shell-command "mpc" t))
             "i
< prev
> next
t toggle
r repeat
z random
Z shuffle
c consume
. single
N volume -1
n volume -10
P volume +1
p volume +10")))

(let ((timer nil))
  (define-interactive-keymap mpd-controller-interactive
      (:on-enter (lambda () (setf timer (run-with-timer 0.1 1 #'mpd-controller)))
       :on-exit (lambda () (cancel-timer timer)))
    ((kbd "<") "mpd-controller prev")
    ((kbd ">") "mpd-controller next")
    ((kbd "t") "mpd-controller toggle")
    ((kbd "r") "mpd-controller repeat")
    ((kbd "z") "mpd-controller random")
    ((kbd "Z") "mpd-controller shuffle")
    ((kbd "c") "mpd-controller consume")
    ((kbd ".") "mpd-controller single")
    ((kbd "i") "mpd-controller")
    ((kbd "N") "mpd-controller volume -1")
    ((kbd "n") "mpd-controller volume -10")
    ((kbd "P") "mpd-controller volume +1")
    ((kbd "p") "mpd-controller volume +10")))

(defcommand brightness-controller (&optional command) ((:rest-strings))
  (when command
    (run-shell-command (format nil "xbacklight ~A" command) t))

  (let ((*suppress-echo-timeout* t))
    (message "Brightness ~A~%~A" (read-brightness-status)
             "i
N -dec 1
n -dec 10
P -inc 1
p -inc 10")))

(define-interactive-keymap brightness-controller-interactive
    (:on-enter (lambda () (run-with-timer 0.1 nil #'brightness-controller)))
  ((kbd "i") "brightness-controller")
  ((kbd "N") "brightness-controller -dec 1")
  ((kbd "n") "brightness-controller -dec 10")
  ((kbd "P") "brightness-controller -inc 1")
  ((kbd "p") "brightness-controller -inc 10"))

(defcommand alsa-controller (&optional command) ((:rest-strings))
  (when command
    (run-shell-command (format nil "amixer ~A" command) t))

  (let ((*suppress-echo-timeout* t))
    (multiple-value-bind (value state) (read-alsa-volume-status)
      (message "Alsa-Volume ~A ~A~%~A" value state
               "i
t -D pulse sset Master toggle
N -D pulse sset Master 1%-
n -D pulse sset Master 10%-
P -D pulse sset Master 1%+
p -D pulse sset Master 10%+"))))

(define-interactive-keymap alsa-controller-interactive
    (:on-enter (lambda () (run-with-timer 0.1 nil #'alsa-controller)))
  ((kbd "i") "alsa-controller")
  ((kbd "t") "alsa-controller -D pulse sset Master toggle")
  ((kbd "N") "alsa-controller -D pulse sset Master 1%-")
  ((kbd "n") "alsa-controller -D pulse sset Master 10%-")
  ((kbd "P") "alsa-controller -D pulse sset Master 1%+")
  ((kbd "p") "alsa-controller -D pulse sset Master 10%+"))

(defcommand screenshot (name selectp)
    ((:string "File name (w/o ext): ") (:y-or-n "Select? "))
  (let* ((directory
           (merge-pathnames #p"Pictures/screenshots/" (user-homedir-pathname)))
         (file-name (make-pathname :directory (pathname-directory directory)
                                   :name name :type "png")))
    (ensure-directories-exist file-name)
    (run-shell-command
     (format
      nil
      "scrot --overwrite --delay 1~:[~; -select~] '~A' --exec 'image_clipboard $f' && notify-send Scrot 'Done screenshot'"
      selectp (namestring file-name)))))



(defcommand show-corona () ()
  (let* ((link "https://corona-stats.online/Italy?format=json")
         (data (first (jsown:val (jsown:parse (dex:get link)) "data"))))
    (message "COVID-19 Italy~%Confirmed: ~:D~%Recovered: ~:D~%Deaths: ~:D~%Active: ~:D"
             (jsown:val data "cases")
             (jsown:val data "recovered")
             (jsown:val data "deaths")
             (jsown:val data "active"))))

(flet ((make-scanner (partition)
         (ppcre:create-scanner
          (concatenate 'string "([0-9]+(?:\\.[0-9]+)?[a-zA-Z]+) +[0-9]+% +" partition "\\n"))))
  (let ((root-scanner (make-scanner "/"))
        (home-scanner (make-scanner "/home"))
        (second-partition-scanner (make-scanner "/mnt/second_partition"))
        (backup-scanner (make-scanner "/mnt/backup"))
        (kindle-scanner (make-scanner "/media/kindle"))
        (usb-scanner (make-scanner "/media/usb")))
    (defcommand show-hardware () ()
      (update-battery-status-variables)
      (let ((output (run-shell-command "df --si" t)))
        (message "R ~A~%H ~A~%W ~A~%BK ~A~%K ~A~%U ~A~%B~A ~A ~A"
                 (extract-first-regexp-group root-scanner output)
                 (extract-first-regexp-group home-scanner output)
                 (extract-first-regexp-group second-partition-scanner output)
                 (extract-first-regexp-group backup-scanner output)
                 (extract-first-regexp-group kindle-scanner output)
                 (extract-first-regexp-group usb-scanner output)
                 *battery-percentage* *battery-state* *battery-time*)))))



(defcommand show-menu () ()
  (when-let ((selection (select-from-menu (current-screen) *menu* nil)))
    (destructuring-bind (name type cmd) selection
      (declare (ignore name))
      (ecase type
        (:shell (run-shell-command cmd))
        (:command (eval-command cmd t))))))

(defcommand type-clipboard (&optional (primary t))
    ((:y-or-n "Primary or clipboard? "))
  (let ((*default-selections* (if primary '(:primary) '(:clipboard))))
    (window-send-string (get-x-selection))))
