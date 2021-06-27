conftest pull https://raw.githubusercontent.com/ncheneweth/opa-dockerfile-benchmarks/master/policy/cis-docker-benchmark.rego
conftest test Dockerfile --trace --policy . --data .opacisrc | grep -e "FAIL" -e "Note"
