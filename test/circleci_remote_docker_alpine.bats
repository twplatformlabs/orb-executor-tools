#!/usr/bin/env bats

@test "git version" {
  run bash -c "docker exec orb-executor-tools-test git --help"
  [[ "${output}" =~ "git" ]]
}

@test "openssh version" {
  run bash -c "docker exec orb-executor-tools-test ssh -V"
  [[ "${output}" =~ "OpenSSH" ]]
}

@test "tar version" {
  run bash -c "docker exec orb-executor-tools-test tar --help"
  [[ "${output}" =~ "tar" ]]
}

@test "gzip version" {
  run bash -c "docker exec orb-executor-tools-test gzip --help"
  [[ "${output}" =~ "gzip" ]]
}

@test "ca-certificates installed" {
  run bash -c "docker exec orb-executor-tools-test ls /etc/ssl/certs/"
  [[ "${output}" =~ "ca-cert-DigiCert_Assured_ID_Root_CA.pem" ]]
}
