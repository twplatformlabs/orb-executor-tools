<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png" width=350/>
	</p>
  <h3>orb-executor-tools</h3>
  <h5>a workflow orb for authoring circleci remote-docker images</h5>
  <a href="https://app.circleci.com/pipelines/github/ThoughtWorks-DPS/orb-executor-tools"><img src="https://circleci.com/gh/ThoughtWorks-DPS/orb-executor-tools.svg?style=shield"></a> <a href="https://badges.circleci.com/orbs/twdps/executor-tools.svg"><img src="https://badges.circleci.com/orbs/twdps/executor-tools.svg"></a> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</div>
<br />

See [orb registry](https://circleci.com/developer/orbs/orb/twdps/executor-tools) for detailed usage examples.  

By default, executor-tools jobs use the `twdps/circleci-executor-tools` image that has all the necessary tools supported by the orb pre-installed.  

Feature options include:

- [hadolint](https://github.com/hadolint/hadolint) scan of Dockerfile
- available CIS Docker Benchmark, Section 4, assessment using [conftest](https://github.com/open-policy-agent/conftest) and opa [policy](CIS_BENCHMARK.md) for scan
- runtime configuration testing using [bats](https://github.com/bats-core/bats-core)
- [snyk](https://github.com/snyk/cli) vulnerability scan
- aquasec/[trivy](https://github.com/aquasecurity/trivy) image scan
- anchore/[grype](https://github.com/anchore/grype) image scane
- image signing with sigstore/[cosign](https://github.com/sigstore/cosign)
- sbom generation using anchore/[syft](https://github.com/anchore/syft)
- upload sbom to container registry using [oras](https://github.com/oras-project/oras)
- automated release notes via [github-release-notes](https://github.com/github-tools/github-release-notes)
- support for machine executor as build environment
- secrets management tools; [1password](https://1password.com), [teller](https://github.com/tellerops/teller), [vault](https://www.vaultproject.io)

_Incorporates concepts from circleci/docker-publish@0.1.2_

NOTE: v2.x.x is a breaking change. Review documentation in detail before upgrading.
