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

module zlm_binding
  use, intrinsic :: iso_c_binding
  use zlm_fif

  implicit none

  private

  type :: ZlmfLicense
    private
    type(c_ptr) :: license
  end type ZlmfLicense

  public :: ZlmfLicense

  public :: zlmf_license_new
  public :: zlmf_license_get
  public :: zlmf_license_free

contains

  function zlmf_license_new() result(license)
    type(ZlmfLicense) :: license
    character(len=1024) :: err
    license%license = zlm_license_new(err)
  end function zlmf_license_new

  function zlmf_license_get(license, product, version, argv0, path, license_string, err) result(errcode)
    type(ZlmfLicense) :: license
    character(len=*) :: product
    character(len=*) :: version
    character(len=*) :: argv0
    character(len=*) :: path
    character(len=*) :: license_string
    character(len=*) :: err
    integer :: errcode

    character(len=len_trim(product)+1) :: c_product
    character(len=len_trim(version)+1) :: c_version
    character(len=len_trim(argv0)+1) :: c_argv0
    character(len=len_trim(path)+1) :: c_path
    character(len=len_trim(license_string)+1) :: c_license_string
    integer(kind=c_int) :: c_errcode

    c_product = trim(product) // c_null_char
    c_version = trim(version) // c_null_char
    c_argv0 = trim(argv0) // c_null_char
    c_path = trim(path) // c_null_char
    c_license_string = trim(license_string) // c_null_char

    ! TODO: use c_argv0 and c_license_string, but allow to pass null pointer somehow
    c_errcode = zlm_license_get(license%license, c_product, c_version, null(), c_path, null(), err)
    errcode = c_errcode
  end function zlmf_license_get

  subroutine zlmf_license_free(license)
    type(ZlmfLicense) :: license
    call zlm_license_free(license%license)
  end subroutine zlmf_license_free

end module zlm_binding
