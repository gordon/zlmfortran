ZLM Fortran
===========

This is a Fortran wrapper for the [Zen License Manager (ZLM)](https://zenlicensemanager.com/).

This code is still experimental!

## TODO

- Passing and returning of the error buffer is still flawed. If an error is set
  on the C side, the string is null-terminated. This has to be converted on the
  Fortran side to prevent garbage output.

- Passing null-Strings to the C side has to be possible. How do we handle this
  in Fortran?

## License

ZLM Fortran is licensed under the ISC license, see LICENSE file for details.
