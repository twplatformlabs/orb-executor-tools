<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/twplatformlabs/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/twplatformlabs/static/master/EMPCPlatformStarterKitsImage.png" width=350/>
	</p>
  <h3>orb-executor-tools</h3>
  <h5>a workflow orb for authoring circleci remote-docker images</h5>
  <a href="https://app.circleci.com/pipelines/github/twplatformlabs/orb-executor-tools"><img src="https://circleci.com/gh/twplatformlabs/orb-executor-tools.svg?style=shield"></a> <a href="https://badges.circleci.com/orbs/twdps/executor-tools.svg"><img src="https://badges.circleci.com/orbs/twdps/executor-tools.svg"></a> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</div>
<br />

See [orb registry](https://circleci.com/developer/orbs/orb/twdps/executor-tools) for detailed usage examples.  

By default, executor-tools jobs use the `twdps/circleci-executor-tools` image that has all the necessary tools supported by the orb pre-installed.  

Feature options include:

- [hadolint](https://github.com/hadolint/hadolint) scan of Dockerfile
- runtime configuration testing using [bats](https://github.com/bats-core/bats-core)
- [snyk](https://github.com/snyk/cli) vulnerability scan
- aquasec/[trivy](https://github.com/aquasecurity/trivy) image scan
- anchore/[grype](https://github.com/anchore/grype) image scane
- support for non-breaking scans
- image signing with sigstore/[cosign](https://github.com/sigstore/cosign)
- sbom generation using anchore/[syft](https://github.com/anchore/syft)
- upload sbom to container registry using [oras](https://github.com/oras-project/oras)
- automated release notes via [github-release-notes](https://github.com/github-tools/github-release-notes)
- support for machine executor as build environment
- secrets management tools; [1password](https://1password.com), [vault](https://www.vaultproject.io)
- build and scan logs persisted to artifact workspace

_Incorporates concepts from circleci/docker-publish@0.1.2_

NOTE: v4.x.x is a breaking change. Review documentation in detail before upgrading.
