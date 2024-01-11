#!/usr/bin/env bats

@test "git version" {
  run bash -c "docker exec orb-executor-tools-test git --version"
  [[ "${output}" =~ "2.43" ]]
}

@test "openssh version" {
  run bash -c "docker exec orb-executor-tools-test ssh -V"
  [[ "${output}" =~ "9.6" ]]
}

@test "tar version" {
  run bash -c "docker exec orb-executor-tools-test tar --version"
  [[ "${output}" =~ "1.35" ]]
}

@test "gzip version" {
  run bash -c "docker exec orb-executor-tools-test gzip --version"
  [[ "${output}" =~ "1.13" ]]
}

@test "ca-certificates installed" {
  run bash -c "docker exec orb-executor-tools-test ls /etc/ssl/certs/"
  [[ "${output}" =~ "ca-cert-DigiCert_Assured_ID_Root_CA.pem" ]]
}
