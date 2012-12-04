unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse (
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)
