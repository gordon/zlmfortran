!
! Copyright (c) 2014 Wikena GmbH
!
! Permission to use, copy, modify, and distribute this software for any
! purpose with or without fee is hereby granted, provided that the above
! copyright notice and this permission notice appear in all copies.
!
! THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
! WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
! MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
! ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
! WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
! ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
! OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
!

module zlm_fif
  use, intrinsic :: iso_c_binding

  implicit none

  interface

    function zlm_license_new(err) bind(c, name="zlm_license_new")
      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: err
      type(c_ptr) :: zlm_license_new
    end function zlm_license_new

    function zlm_license_get(license, product, version, argv0, path, license_string, err) bind(c, name="zlm_license_get")
      use, intrinsic :: iso_c_binding
      type(c_ptr), value :: license
      character(kind=c_char), dimension(*) :: product
      character(kind=c_char), dimension(*) :: version
      character(kind=c_char), dimension(*), optional :: argv0
      character(kind=c_char), dimension(*) :: path
      character(kind=c_char), dimension(*), optional :: license_string
      character(kind=c_char), dimension(*) :: err
      integer(kind=c_int) :: zlm_license_get
    end function zlm_license_get

    subroutine zlm_license_free(license) bind(c, name="zlm_license_free")
      use, intrinsic :: iso_c_binding
      type(c_ptr), value :: license
    end subroutine zlm_license_free

  end interface

end module zlm_fif
