# cmake bits to do a full static build, downloading and building all dependencies.

# Most of these are CACHE STRINGs so that you can override them using -DWHATEVER during cmake
# invocation to override.

set(LOCAL_MIRROR "" CACHE STRING "local mirror path/URL for lib downloads")

set(OPENSSL_VERSION 1.1.1k CACHE STRING "openssl version")
set(OPENSSL_MIRROR ${LOCAL_MIRROR} https://www.openssl.org/source CACHE STRING "openssl download mirror(s)")
set(OPENSSL_SOURCE openssl-${OPENSSL_VERSION}.tar.gz)
set(OPENSSL_HASH SHA256=892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5
    CACHE STRING "openssl source hash")

set(EXPAT_VERSION 2.3.0 CACHE STRING "expat version")
string(REPLACE "." "_" EXPAT_TAG "R_${EXPAT_VERSION}")
set(EXPAT_MIRROR ${LOCAL_MIRROR} https://github.com/libexpat/libexpat/releases/download/${EXPAT_TAG}
    CACHE STRING "expat download mirror(s)")
set(EXPAT_SOURCE expat-${EXPAT_VERSION}.tar.xz)
set(EXPAT_HASH SHA512=dde8a9a094b18d795a0e86ca4aa68488b352dc67019e0d669e8b910ed149628de4c2a49bc3a5b832f624319336a01f9e4debe03433a43e1c420f36356d886820
    CACHE STRING "expat source hash")

set(UNBOUND_VERSION 1.13.1 CACHE STRING "unbound version")
set(UNBOUND_MIRROR ${LOCAL_MIRROR} https://nlnetlabs.nl/downloads/unbound CACHE STRING "unbound download mirror(s)")
set(UNBOUND_SOURCE unbound-${UNBOUND_VERSION}.tar.gz)
set(UNBOUND_HASH SHA256=8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8
    CACHE STRING "unbound source hash")

set(BOOST_VERSION 1.75.0 CACHE STRING "boost version")
set(BOOST_MIRROR ${LOCAL_MIRROR} https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source
    CACHE STRING "boost download mirror(s)")
string(REPLACE "." "_" BOOST_VERSION_ ${BOOST_VERSION})
set(BOOST_SOURCE boost_${BOOST_VERSION_}.tar.bz2)
set(BOOST_HASH SHA256=953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb
    CACHE STRING "boost source hash")

set(NCURSES_VERSION 6.2 CACHE STRING "ncurses version")
set(NCURSES_MIRROR ${LOCAL_MIRROR} http://ftpmirror.gnu.org/gnu/ncurses
    CACHE STRING "ncurses download mirror(s)")
set(NCURSES_SOURCE ncurses-${NCURSES_VERSION}.tar.gz)
set(NCURSES_HASH SHA512=4c1333dcc30e858e8a9525d4b9aefb60000cfc727bc4a1062bace06ffc4639ad9f6e54f6bdda0e3a0e5ea14de995f96b52b3327d9ec633608792c99a1e8d840d
    CACHE STRING "ncurses source hash")

set(READLINE_VERSION 8.1 CACHE STRING "readline version")
set(READLINE_MIRROR ${LOCAL_MIRROR} http://ftpmirror.gnu.org/gnu/readline
    CACHE STRING "readline download mirror(s)")
set(READLINE_SOURCE readline-${READLINE_VERSION}.tar.gz)
set(READLINE_HASH SHA512=27790d0461da3093a7fee6e89a51dcab5dc61928ec42e9228ab36493b17220641d5e481ea3d8fee5ee0044c70bf960f55c7d3f1a704cf6b9c42e5c269b797e00
    CACHE STRING "readline source hash")

set(SQLITE3_VERSION 3350500 CACHE STRING "sqlite3 version")
set(SQLITE3_MIRROR ${LOCAL_MIRROR} https://www.sqlite.org/2021
    CACHE STRING "sqlite3 download mirror(s)")
set(SQLITE3_SOURCE sqlite-autoconf-${SQLITE3_VERSION}.tar.gz)
set(SQLITE3_HASH SHA512=039af796f79fc4517be0bd5ba37886264d49da309e234ae6fccdb488ef0109ed2b917fc3e6c1fc7224dff4f736824c653aaf8f0a37550c5ebc14d035cb8ac737
    CACHE STRING "sqlite3 source hash")
	
if(SQLITE3_VERSION MATCHES "^([0-9]+)(0([0-9])|([1-9][0-9]))(0([0-9])|([1-9][0-9]))[0-9][0-9]$")
    set(SQLite3_VERSION "${CMAKE_MATCH_1}.${CMAKE_MATCH_3}${CMAKE_MATCH_4}.${CMAKE_MATCH_6}${CMAKE_MATCH_7}" CACHE STRING "" FORCE)
    mark_as_advanced(SQLite3_VERSION)
    message(STATUS "Building static sqlite3 ${SQLite3_VERSION}")
else()
    message(FATAL_ERROR "Couldn't figure out sqlite3 version from '${SQLITE3_VERSION}'")
endif()

set(EUDEV_VERSION 3.2.10 CACHE STRING "eudev version")
set(EUDEV_MIRROR ${LOCAL_MIRROR} https://github.com/gentoo/eudev/archive/
    CACHE STRING "eudev download mirror(s)")
set(EUDEV_SOURCE v${EUDEV_VERSION}.tar.gz)
set(EUDEV_HASH SHA512=37fc5e7f960a843fa68269697882123af4515555788a9e856474f51dd8c330a4c8e52e7c897aeb5d3eb36c6ad66cc99f5a38a284a75620b7e6c275c703e25d42
    CACHE STRING "eudev source hash")

set(LIBUSB_VERSION 1.0.24 CACHE STRING "libusb version")
set(LIBUSB_MIRROR ${LOCAL_MIRROR} https://github.com/libusb/libusb/releases/download/v${LIBUSB_VERSION}
    CACHE STRING "libusb download mirror(s)")
set(LIBUSB_SOURCE libusb-${LIBUSB_VERSION}.tar.bz2)
set(LIBUSB_HASH SHA512=5aea36a530aaa15c6dd656d0ed3ce204522c9946d8d39ffbb290dab4a98cda388a2598da4995123d1032324056090bd429e702459626d3e8d7daeebc4e7ff3dc
    CACHE STRING "libusb source hash")

set(HIDAPI_VERSION 0.9.0 CACHE STRING "hidapi version")
set(HIDAPI_MIRROR ${LOCAL_MIRROR} https://github.com/libusb/hidapi/archive
    CACHE STRING "hidapi download mirror(s)")
set(HIDAPI_SOURCE hidapi-${HIDAPI_VERSION}.tar.gz)
set(HIDAPI_HASH SHA512=d9f28d394b78daece7d2dfb946e62349a56b388b3a06241585c6fad5a4e24dc914723de6c0f12a9e51cd23fb245f6b5ac9b3721319646d5ba5912bbe0a3f9a52
    CACHE STRING "hidapi source hash")

set(PROTOBUF_VERSION 3.12.3 CACHE STRING "protobuf version")
set(PROTOBUF_MIRROR ${LOCAL_MIRROR} https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}
  CACHE STRING "protobuf mirror(s)")
set(PROTOBUF_SOURCE protobuf-cpp-${PROTOBUF_VERSION}.tar.gz)
set(PROTOBUF_HASH SHA512=a30677d152eee663960ed363b62464a455057796a5938e900deaa8fa0e3ba468675be450846b7c27b722114ee6d735bd27edc302f38a39486f7e44f71d155c66
  CACHE STRING "protobuf source hash")

set(SODIUM_VERSION 1.0.18 CACHE STRING "libsodium version")
set(SODIUM_MIRROR ${LOCAL_MIRROR}
  https://download.libsodium.org/libsodium/releases
  https://github.com/jedisct1/libsodium/releases/download/${SODIUM_VERSION}-RELEASE
  CACHE STRING "libsodium mirror(s)")
set(SODIUM_SOURCE libsodium-${SODIUM_VERSION}.tar.gz)
set(SODIUM_HASH SHA512=17e8638e46d8f6f7d024fe5559eccf2b8baf23e143fadd472a7d29d228b186d86686a5e6920385fe2020729119a5f12f989c3a782afbd05a8db4819bb18666ef
  CACHE STRING "libsodium source hash")

set(ZMQ_VERSION 4.3.4 CACHE STRING "libzmq version")
set(ZMQ_MIRROR ${LOCAL_MIRROR} https://github.com/zeromq/libzmq/releases/download/v${ZMQ_VERSION}
    CACHE STRING "libzmq mirror(s)")
set(ZMQ_SOURCE zeromq-${ZMQ_VERSION}.tar.gz)
set(ZMQ_HASH SHA512=e198ef9f82d392754caadd547537666d4fba0afd7d027749b3adae450516bcf284d241d4616cad3cb4ad9af8c10373d456de92dc6d115b037941659f141e7c0e
    CACHE STRING "libzmq source hash")



include(ExternalProject)

set(DEPS_DESTDIR ${CMAKE_BINARY_DIR}/static-deps)
set(DEPS_SOURCEDIR ${CMAKE_BINARY_DIR}/static-deps-sources)

include_directories(BEFORE SYSTEM ${DEPS_DESTDIR}/include)

file(MAKE_DIRECTORY ${DEPS_DESTDIR}/include)

set(deps_cc "${CMAKE_C_COMPILER}")
set(deps_cxx "${CMAKE_CXX_COMPILER}")
if(CMAKE_C_COMPILER_LAUNCHER)
  set(deps_cc "${CMAKE_C_COMPILER_LAUNCHER} ${deps_cc}")
endif()
if(CMAKE_CXX_COMPILER_LAUNCHER)
  set(deps_cxx "${CMAKE_CXX_COMPILER_LAUNCHER} ${deps_cxx}")
endif()

function(expand_urls output source_file)
  set(expanded)
  foreach(mirror ${ARGN})
    list(APPEND expanded "${mirror}/${source_file}")
  endforeach()
  set(${output} "${expanded}" PARENT_SCOPE)
endfunction()

function(add_static_target target ext_target libname)
  add_library(${target} STATIC IMPORTED GLOBAL)
  add_dependencies(${target} ${ext_target})
  set_target_properties(${target} PROPERTIES
    IMPORTED_LOCATION ${DEPS_DESTDIR}/lib/${libname}
  )
endfunction()



if(USE_LTO)
  set(flto "-flto")
else()
  set(flto "")
endif()

set(cross_host "")
set(cross_rc "")
if(CMAKE_CROSSCOMPILING)
  set(cross_host "--host=${ARCH_TRIPLET}")
  if (ARCH_TRIPLET MATCHES mingw AND CMAKE_RC_COMPILER)
    set(cross_rc "WINDRES=${CMAKE_RC_COMPILER}")
  endif()
endif()


# Builds a target; takes the target name (e.g. "readline") and builds it in an external project with
# target name suffixed with `_external`.  Its upper-case value is used to get the download details
# (from the variables set above).  The following options are supported and passed through to
# ExternalProject_Add if specified.  If omitted, these defaults are used:
set(build_def_DEPENDS "")
set(build_def_PATCH_COMMAND "")
set(build_def_CONFIGURE_COMMAND ./configure ${cross_host} --disable-shared --prefix=${DEPS_DESTDIR} --with-pic
    "CC=${deps_cc}" "CXX=${deps_cxx}" "CFLAGS=-O2 ${flto}" "CXXFLAGS=-O2 ${flto}" ${cross_rc})
set(build_def_BUILD_COMMAND make)
set(build_def_INSTALL_COMMAND make install)
set(build_def_BUILD_BYPRODUCTS ${DEPS_DESTDIR}/lib/lib___TARGET___.a ${DEPS_DESTDIR}/include/___TARGET___.h)

function(build_external target)
  set(options DEPENDS PATCH_COMMAND CONFIGURE_COMMAND BUILD_COMMAND INSTALL_COMMAND BUILD_BYPRODUCTS)
  cmake_parse_arguments(PARSE_ARGV 1 arg "" "" "${options}")
  foreach(o ${options})
    if(NOT DEFINED arg_${o})
      set(arg_${o} ${build_def_${o}})
    endif()
  endforeach()
  string(REPLACE ___TARGET___ ${target} arg_BUILD_BYPRODUCTS "${arg_BUILD_BYPRODUCTS}")

  string(TOUPPER "${target}" prefix)
  expand_urls(urls ${${prefix}_SOURCE} ${${prefix}_MIRROR})
  ExternalProject_Add("${target}_external"
    DEPENDS ${arg_DEPENDS}
    BUILD_IN_SOURCE ON
    PREFIX ${DEPS_SOURCEDIR}
    URL ${urls}
    URL_HASH ${${prefix}_HASH}
    DOWNLOAD_NO_PROGRESS ON
    PATCH_COMMAND ${arg_PATCH_COMMAND}
    CONFIGURE_COMMAND ${arg_CONFIGURE_COMMAND}
    BUILD_COMMAND ${arg_BUILD_COMMAND}
    INSTALL_COMMAND ${arg_INSTALL_COMMAND}
    BUILD_BYPRODUCTS ${arg_BUILD_BYPRODUCTS}
  )
endfunction()



set(openssl_system_env "")
if(CMAKE_CROSSCOMPILING)
  if(ARCH_TRIPLET STREQUAL x86_64-w64-mingw32)
    set(openssl_system_env SYSTEM=MINGW64 RC=${CMAKE_RC_COMPILER})
  elseif(ARCH_TRIPLET STREQUAL i686-w64-mingw32)
    set(openssl_system_env SYSTEM=MINGW64 RC=${CMAKE_RC_COMPILER})
  endif()
endif()
build_external(openssl
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -E env CC=${deps_cc} ${openssl_system_env} ./config
    --prefix=${DEPS_DESTDIR} no-shared no-capieng no-dso no-dtls1 no-ec_nistp_64_gcc_128 no-gost
    no-heartbeats no-md2 no-rc5 no-rdrand no-rfc3779 no-sctp no-ssl-trace no-ssl2 no-ssl3
    no-static-engine no-tests no-weak-ssl-ciphers no-zlib no-zlib-dynamic "CFLAGS=-O2 ${flto}"
  INSTALL_COMMAND make install_sw
  BUILD_BYPRODUCTS
    ${DEPS_DESTDIR}/lib/libssl.a ${DEPS_DESTDIR}/lib/libcrypto.a
    ${DEPS_DESTDIR}/include/openssl/ssl.h ${DEPS_DESTDIR}/include/openssl/crypto.h
)
add_static_target(OpenSSL::SSL openssl_external libssl.a)
add_static_target(OpenSSL::Crypto openssl_external libcrypto.a)
set(OPENSSL_INCLUDE_DIR ${DEPS_DESTDIR}/include)
set(OPENSSL_VERSION 1.1.1)



build_external(expat
  CONFIGURE_COMMAND ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --enable-static
  --disable-shared --with-pic --without-examples --without-tests --without-docbook --without-xmlwf
  "CC=${deps_cc}" "CFLAGS=-O2 ${flto}"
)
add_static_target(expat expat_external libexpat.a)


build_external(unbound
  DEPENDS openssl_external expat_external
  CONFIGURE_COMMAND ./configure ${cross_host} ${cross_rc} --prefix=${DEPS_DESTDIR} --disable-shared
  --enable-static --with-libunbound-only --with-pic
  --$<IF:$<BOOL:${USE_LTO}>,enable,disable>-flto --with-ssl=${DEPS_DESTDIR}
  --with-libexpat=${DEPS_DESTDIR}
  "CC=${deps_cc}" "CFLAGS=-O2 ${flto}"
)
add_static_target(libunbound unbound_external libunbound.a)
if(WIN32)
  set_target_properties(libunbound PROPERTIES INTERFACE_LINK_LIBRARIES "ws2_32;crypt32;iphlpapi")
endif()



set(boost_threadapi "pthread")
set(boost_bootstrap_cxx "CXX=${deps_cxx}")
set(boost_toolset "")
set(boost_extra "")
if(USE_LTO)
  list(APPEND boost_extra "lto=on")
endif()
if(CMAKE_CROSSCOMPILING)
  set(boost_bootstrap_cxx "") # need to use our native compiler to bootstrap
  if(ARCH_TRIPLET MATCHES mingw)
    set(boost_threadapi win32)
    list(APPEND boost_extra "target-os=windows")
    if(ARCH_TRIPLET MATCHES x86_64)
      list(APPEND boost_extra "address-model=64")
    else()
      list(APPEND boost_extra "address-model=32")
    endif()
  endif()
endif()
if(CMAKE_CXX_COMPILER_ID STREQUAL GNU)
  set(boost_toolset gcc)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "^(Apple)?Clang$")
  set(boost_toolset clang)
else()
  message(FATAL_ERROR "don't know how to build boost with ${CMAKE_CXX_COMPILER_ID}")
endif()
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/user-config.bjam "using ${boost_toolset} : : ${deps_cxx} ;")

set(boost_patch_commands "")
if(APPLE AND BOOST_VERSION VERSION_LESS 1.74.0)
  set(boost_patch_commands PATCH_COMMAND patch -p1 -d tools/build -i ${PROJECT_SOURCE_DIR}/utils/build_scripts/boostorg-build-pr560-macos-build-fix.patch)
endif()

build_external(boost
  #  PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_BINARY_DIR}/user-config.bjam tools/build/src/user-config.jam
  ${boost_patch_commands}
  CONFIGURE_COMMAND
    ${CMAKE_COMMAND} -E env ${boost_bootstrap_cxx}
    ./bootstrap.sh --without-icu --prefix=${DEPS_DESTDIR} --with-toolset=${boost_toolset}
      --with-libraries=chrono,filesystem,program_options,system,thread,date_time,regex,serialization,locale,atomic
  BUILD_COMMAND true
  INSTALL_COMMAND
    ./b2 -d0 variant=release link=static runtime-link=static optimization=speed ${boost_extra}
      threading=multi threadapi=${boost_threadapi} cxxflags=-fPIC cxxstd=14 visibility=global
      --disable-icu --user-config=${CMAKE_CURRENT_BINARY_DIR}/user-config.bjam
      install
  BUILD_BYPRODUCTS
    ${DEPS_DESTDIR}/lib/libboost_atomic.a
    ${DEPS_DESTDIR}/lib/libboost_chrono.a
    ${DEPS_DESTDIR}/lib/libboost_date_time.a
    ${DEPS_DESTDIR}/lib/libboost_filesystem.a
    ${DEPS_DESTDIR}/lib/libboost_locale.a
    ${DEPS_DESTDIR}/lib/libboost_program_options.a
    ${DEPS_DESTDIR}/lib/libboost_regex.a
    ${DEPS_DESTDIR}/lib/libboost_serialization.a
    ${DEPS_DESTDIR}/lib/libboost_system.a
    ${DEPS_DESTDIR}/lib/libboost_thread.a
    ${DEPS_DESTDIR}/include/boost/version.hpp
)
add_library(boost_core INTERFACE)
add_dependencies(boost_core INTERFACE boost_external)
target_include_directories(boost_core SYSTEM INTERFACE ${DEPS_DESTDIR}/include)
add_library(Boost::boost ALIAS boost_core)
foreach(boostlib atomic chrono date_time filesystem locale program_options regex serialization system thread)
  add_static_target(Boost::${boostlib} boost_external libboost_${boostlib}.a)
  target_link_libraries(Boost::${boostlib} INTERFACE boost_core)
endforeach()
target_link_libraries(Boost::locale INTERFACE Boost::thread)
set(Boost_FOUND ON)
set(Boost_VERSION ${BOOST_VERSION})



build_external(sqlite3)
add_static_target(SQLite::SQLite3 sqlite3_external libsqlite3.a)



if (NOT WIN32)
  build_external(ncurses
    CONFIGURE_COMMAND ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --without-debug --without-ada
      --without-cxx-binding --without-cxx --without-ticlib --without-tic --without-progs
      --without-tests --without-tack --without-manpages --with-termlib --disable-tic-depends
      --disable-big-strings --disable-ext-colors --enable-pc-files --without-shared --without-pthread
      --disable-rpath --disable-colorfgbg --disable-ext-mouse --disable-symlinks --enable-warnings
      --enable-assertions --with-default-terminfo-dir=/etc/_terminfo_
      --with-terminfo-dirs=/etc/_terminfo_ --disable-pc-files --enable-database --enable-sp-funcs
      --disable-term-driver --enable-interop --enable-widec "CC=${CMAKE_C_COMPILER}" "CFLAGS=-O2 -fPIC ${flto}"
    INSTALL_COMMAND make install.libs
    BUILD_BYPRODUCTS
      ${DEPS_DESTDIR}/lib/libncursesw.a
      ${DEPS_DESTDIR}/lib/libtinfow.a
      ${DEPS_DESTDIR}/include/ncursesw
      ${DEPS_DESTDIR}/include/ncursesw/termcap.h
      ${DEPS_DESTDIR}/include/ncursesw/ncurses.h
  )
  add_static_target(ncurses_tinfo ncurses_external libtinfow.a)


 if(FALSE) # not working reliably
  build_external(readline
    DEPENDS ncurses_external
    CONFIGURE_COMMAND ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --disable-shared --with-curses
      "CC=${deps_cc}" "CFLAGS=-fPIC ${flto}"
    BUILD_BYPRODUCTS
      ${DEPS_DESTDIR}/lib/libreadline.a
      ${DEPS_DESTDIR}/include/readline
      ${DEPS_DESTDIR}/include/readline/readline.h
  )
  add_static_target(readline readline_external libreadline.a)
  set_target_properties(readline PROPERTIES
    INTERFACE_LINK_LIBRARIES ncurses_tinfo
    INTERFACE_COMPILE_DEFINITIONS HAVE_READLINE)
	endif()
endif()



if(APPLE OR WIN32)
  add_library(libudev INTERFACE)
  set(maybe_eudev "")
else()
  build_external(eudev
    CONFIGURE_COMMAND autoreconf -ivf && ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --disable-shared --disable-introspection
      --disable-programs --disable-manpages --disable-hwdb --with-pic "CC=${deps_cc}" "CFLAGS=-O2 ${flto}"
    BUILD_BYPRODUCTS
      ${DEPS_DESTDIR}/lib/libudev.a
      ${DEPS_DESTDIR}/include/libudev.h
  )
  add_static_target(libudev eudev_external libudev.a)
  set(maybe_eudev "eudev_external")
endif()



build_external(libusb
  CONFIGURE_COMMAND autoreconf -ivf && ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --disable-shared --disable-udev --with-pic
    "CC=${deps_cc}" "CXX=${deps_cxx}" "CFLAGS=-O2 ${flto}" "CXXFLAGS=-O2 ${flto}"
  BUILD_BYPRODUCTS
    ${DEPS_DESTDIR}/lib/libusb-1.0.a
    ${DEPS_DESTDIR}/include/libusb-1.0
    ${DEPS_DESTDIR}/include/libusb-1.0/libusb.h
)
add_static_target(libusb_vendor libusb_external libusb-1.0.a)
set_target_properties(libusb_vendor PROPERTIES INTERFACE_SYSTEM_INCLUDE_DIRECTORIES ${DEPS_DESTDIR}/include/libusb-1.0)



if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(hidapi_libusb_lib libhidapi-libusb.a)
  set(hidapi_lib_byproducts ${DEPS_DESTDIR}/lib/libhidapi-libusb.a ${DEPS_DESTDIR}/lib/libhidapi-hidraw.a)
else()
  set(hidapi_libusb_lib libhidapi.a)
  set(hidapi_lib_byproducts ${DEPS_DESTDIR}/lib/libhidapi.a)
endif()
build_external(hidapi
  DEPENDS ${maybe_eudev} libusb_external
  CONFIGURE_COMMAND autoreconf -ivf && ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --disable-shared --enable-static --with-pic
    "CC=${deps_cc}" "CXX=${deps_cxx}" "CFLAGS=-O2 ${flto}" "CXXFLAGS=-O2 ${flto}"
    "libudev_CFLAGS=-I${DEPS_DESTDIR}/include" "libudev_LIBS=-L${DEPS_DESTDIR}/lib -ludev"
    "libusb_CFLAGS=-I${DEPS_DESTDIR}/include/libusb-1.0" "libusb_LIBS=-L${DEPS_DESTDIR}/lib -lusb-1.0"
  BUILD_BYPRODUCTS
    ${hidapi_lib_byproducts}
    ${DEPS_DESTDIR}/include/hidapi
    ${DEPS_DESTDIR}/include/hidapi/hidapi.h
)
set(HIDAPI_FOUND TRUE)
add_static_target(hidapi_libusb hidapi_external ${hidapi_libusb_lib})
set(hidapi_links "libusb_vendor;libudev")
if(WIN32)
  list(APPEND hidapi_links setupapi)
endif()
set_target_properties(hidapi_libusb PROPERTIES
    INTERFACE_LINK_LIBRARIES "${hidapi_links}"
    INTERFACE_COMPILE_DEFINITIONS HAVE_HIDAPI)



if(USE_DEVICE_TREZOR)
  build_external(protobuf
    CONFIGURE_COMMAND
      ./configure ${cross_host} --disable-shared --prefix=${DEPS_DESTDIR} --with-pic
        "CC=${deps_cc}" "CXX=${deps_cxx}" "CFLAGS=${deps_CFLAGS}" "CXXFLAGS=${deps_CXXFLAGS}"
        "CPP=${deps_cc} -E" "CXXCPP=${deps_cxx} -E"
        "CC_FOR_BUILD=${deps_cc}" "CXX_FOR_BUILD=${deps_cxx}"  # Thanks Google for making people hunt for undocumented magic variables
    BUILD_BYPRODUCTS
      ${DEPS_DESTDIR}/lib/libprotobuf-lite.a
      ${DEPS_DESTDIR}/lib/libprotobuf.a
      ${DEPS_DESTDIR}/lib/libprotoc.a
      ${DEPS_DESTDIR}/include/google/protobuf
  )
  add_static_target(protobuf_lite protobuf_external libprotobuf-lite.a)
  add_static_target(protobuf_bloated protobuf_external libprotobuf.a)
 endif()


build_external(sodium)
add_static_target(sodium sodium_external libsodium.a)


if(CMAKE_CROSSCOMPILING AND ARCH_TRIPLET MATCHES mingw)
  set(zmq_patch PATCH_COMMAND patch -p1 -i ${PROJECT_SOURCE_DIR}/utils/build_scripts/libzmq-mingw-closesocket.patch)
endif()
build_external(zmq
  DEPENDS sodium_external
  ${zmq_patch}
  CONFIGURE_COMMAND ./configure ${cross_host} --prefix=${DEPS_DESTDIR} --enable-static --disable-shared
    --disable-curve-keygen --enable-curve --disable-drafts --disable-libunwind --with-libsodium
    --without-pgm --without-norm --without-vmci --without-docs --with-pic --disable-Werror
    "CC=${deps_cc}" "CXX=${deps_cxx}" "CFLAGS=-O2 -fstack-protector ${flto}" "CXXFLAGS=-O2 -fstack-protector ${flto}"
    "sodium_CFLAGS=-I${DEPS_DESTDIR}/include" "sodium_LIBS=-L${DEPS_DESTDIR}/lib -lsodium"
)
add_static_target(libzmq zmq_external libzmq.a)

set(libzmq_link_libs "sodium")
if(CMAKE_CROSSCOMPILING AND ARCH_TRIPLET MATCHES mingw)
  list(APPEND libzmq_link_libs iphlpapi)
endif()

set_target_properties(libzmq PROPERTIES
    INTERFACE_LINK_LIBRARIES "${libzmq_link_libs}"
    INTERFACE_COMPILE_DEFINITIONS "ZMQ_STATIC")
