pkg_name=hello
pkg_version=0.1.0
pkg_deps=()
pkg_build_deps=(core/go)
pkg_origin=abhijith
pkg_maintainer='Abhijith Gopal'
pkg_expose=()
pkg_svc_run="hello ${pkg_svc_config_path}/greet"
pkg_bin_dirs=(bin)

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_clean() {
  return 0
}

do_unpack() {
    return 0
}

do_build() {
    echo "copying source code into cache-path: $CACHE_PATH"

    cp -v $PLAN_CONTEXT/hello.go $CACHE_PATH/
    cd $CACHE_PATH/
    go build -o hello
}

do_install() {
    cp -v $CACHE_PATH/$pkg_name ${pkg_prefix}/bin
    echo $pkg_svc_config_path
}
