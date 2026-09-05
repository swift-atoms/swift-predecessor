# Predecessor

`Predecessor` identifies and implements selection of the previous fixed-width
integer. Its `reporting`, `exact`, and `saturating` policies delegate to
Subtraction with a decrement of one. Exact failure is
`Subtraction.Error.overflow`.
