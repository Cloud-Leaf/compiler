
;; Function main (main, funcdef_no=1522, decl_uid=36325, cgraph_uid=436, symbol_order=438)

main ()
{
  struct basic_ostream & D.39989;
  struct basic_ostream & D.39988;
  struct basic_ostream & D.39987;
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.39985;

  a = 0;
  b = 1;
  i = 1;
  std::basic_istream<char>::operator>> (&cin, &n);
  D.39987 = std::basic_ostream<char>::operator<< (&cout, a);
  _1 = D.39987;
  std::basic_ostream<char>::operator<< (_1, endl);
  D.39988 = std::basic_ostream<char>::operator<< (&cout, b);
  _2 = D.39988;
  std::basic_ostream<char>::operator<< (_2, endl);
  <D.39983>:
  n.0_3 = n;
  if (i >= n.0_3) goto <D.36378>; else goto <D.39984>;
  <D.39984>:
  t = b;
  b = a + b;
  D.39989 = std::basic_ostream<char>::operator<< (&cout, b);
  _4 = D.39989;
  std::basic_ostream<char>::operator<< (_4, endl);
  a = t;
  i = i + 1;
  goto <D.39983>;
  <D.36378>:
  D.39985 = 0;
  goto <D.39991>;
  <D.39991>:
  n = {CLOBBER};
  goto <D.39986>;
  D.39985 = 0;
  goto <D.39986>;
  <D.39986>:
  return D.39985;
  <D.39990>:
  n = {CLOBBER};
  resx 1
}



;; Function __static_initialization_and_destruction_0 (_Z41__static_initialization_and_destruction_0ii, funcdef_no=2008, decl_uid=39975, cgraph_uid=922, symbol_order=948)

__static_initialization_and_destruction_0 (int __initialize_p, int __priority)
{
  if (__initialize_p == 1) goto <D.39993>; else goto <D.39994>;
  <D.39993>:
  if (__priority == 65535) goto <D.39995>; else goto <D.39996>;
  <D.39995>:
  std::ios_base::Init::Init (&__ioinit);
  __cxa_atexit (__dt_comp , &__ioinit, &__dso_handle);
  goto <D.39997>;
  <D.39996>:
  <D.39997>:
  goto <D.39998>;
  <D.39994>:
  <D.39998>:
  return;
}



;; Function _GLOBAL__sub_I_main (_GLOBAL__sub_I_main, funcdef_no=2009, decl_uid=39981, cgraph_uid=923, symbol_order=1078)

_GLOBAL__sub_I_main ()
{
  __static_initialization_and_destruction_0 (1, 65535);
  return;
}


