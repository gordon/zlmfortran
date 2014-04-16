program api_example
  use zlm_binding

  implicit none

  type(ZlmfLicense) :: license
  character(len=1024) :: err
  integer :: errcode

  license = zlmf_license_new()

  ! TODO: pass proper argv0
  errcode = zlmf_license_get(license, "My Product", "1.0", "", ".", "", err)


  if (errcode /= 0) then
    print *, err
  else
    print *, "got license!"
  end if


  call zlmf_license_free(license)
end program api_example
