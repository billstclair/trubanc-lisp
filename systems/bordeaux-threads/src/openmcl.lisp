;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; indent-tabs-mode: nil -*-

#|
Copyright 2006, 2007 Greg Pfeil

Distributed under the MIT license (see LICENSE file)
|#

(in-package #:bordeaux-threads)

;;; documentation on the OpenMCL Threads interface can be found at
;;; http://openmcl.clozure.com/Doc/Programming-with-Threads.html

;;; Thread Creation

(defun %make-thread (function name)
  (ccl:process-run-function name function))

(defun current-thread ()
  ccl:*current-process*)

(defun threadp (object)
  (typep object 'ccl:process))

(defun thread-name (thread)
  (ccl:process-name thread))

;;; Resource contention: locks and recursive locks

(defun make-lock (&optional name)
  (ccl:make-lock name))

(defun acquire-lock (lock &optional (wait-p t))
  (if wait-p
      (ccl:grab-lock lock)
      (ccl:try-lock lock)))

(defun release-lock (lock)
  (ccl:release-lock lock))

(defmacro with-lock-held ((place) &body body)
  `(ccl:with-lock-grabbed (,place)
     ,@body))

(defun make-recursive-lock (&optional name)
  (ccl:make-lock name))

(defun acquire-recursive-lock (lock)
  (ccl:grab-lock lock))

(defun release-recursive-lock (lock)
  (ccl:release-lock lock))

(defmacro with-recursive-lock-held ((place) &body body)
  `(ccl:with-lock-grabbed (,place)
     ,@body))

;;; Resource contention: condition variables

(defun make-condition-variable ()
  (ccl:make-semaphore))

(defun condition-wait (condition-variable lock)
  (unwind-protect
       (progn
         (release-lock lock)
         (ccl:wait-on-semaphore condition-variable))
    (acquire-lock lock t)))

(defun condition-notify (condition-variable)
  (ccl:signal-semaphore condition-variable))

(defun thread-yield ()
  (ccl:process-allow-schedule))

;;; Introspection/debugging

(defun all-threads ()
  (ccl:all-processes))

(defun interrupt-thread (thread function)
  (ccl:process-interrupt thread function))

(defun destroy-thread (thread)
  (signal-error-if-current-thread thread)
  (ccl:process-kill thread))

(defun thread-alive-p (thread)
  (ccl::process-active-p thread))

(defun join-thread (thread)
  (ccl:join-process thread))

(mark-supported)
