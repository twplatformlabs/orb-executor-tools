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

> NOTE: v6 is a breaking change. Review documentation in detail before upgrading.

In the new release, jobs have new names and new commands have been added. The new jobs support the use of `docker bake` for multi-image and multi-arch builds through a single configuration file. The Bake method jobs make use of Scout for performing vulnerability scans and use Docker CLI features to create both provenance and bill of material manifest details. The historial simple `build` process will continue to be supported though also with new job names.

By default, executor-tools jobs use the `twdps/circleci-executor-tools` image that has all the necessary tools supported by the orb pre-installed. The basic Docker Build jobs have a built-in install command for the dependent packages at pipeline runtime to support building on CircleCI machine images, if needed. Use a custom step parameters and the _base-packages_ orb to install dependent packages in buildx jobs.  

Feature jobs:

* dev-buildx
  * Lint scan of Dockerfile using [hadolint](https://github.com/hadolint/hadolint)
  * Buildx using [Bake](https://docs.docker.com/build/bake/) configuration file
    * Automatic generation of bill of matierals and provenance
    * Concurrent build of multiples images and architectures
  * (Optional) [Scout](https://docs.docker.com/scout/quickstart/) CVE scan
    * Results persisted to artifact store
  * (Optional) Runtime configuration testing of image using [Bats](https://github.com/bats-core/bats-core)
  * Build and scan logs uploaded to artifact store
* releasex
  * Add release Tag to existing image manifest based on bakefile configuration
    * (Optional) include latest
  * (Optional) Sign manifest using [cosign](https://github.com/sigstore/cosign)

* dev-build, machine-executor-dev-build
  * Lint scan of Dockerfile using [hadolint](https://github.com/hadolint/hadolint)
  * (Optional) Set orb-opencontainer CREATED, VERSION (SHA), Image BASE values
  * Build image using `Docker Build`, support for add'l build arg
  * (Optional) Scan image using [snyk test](https://docs.snyk.io/developer-tools/snyk-cli/commands/test)
  * (Optional) Scan image using [trivy image](https://github.com/aquasecurity/trivy)
  * (Optional) scan image using [grype](https://github.com/anchore/grype)
  * (Optional) Runtime configuration testing of image using [Bats](https://github.com/bats-core/bats-core)
* release
  * Add release Tag to existing image manifest based on bakefile configuration
    * (Optional) include latest
  * (Optional) direct installation of tools or dependencies (buildx uses base-packages orb)
    * 1Password
    * Bats
    * Cosign
    * GH
    * Grype
    * Hadolint
    * Oras
    * Snyk
    * Syft
    * Trivy
    * Vault (Hashi)
  * (Optional) Sign manifest using [cosign](https://github.com/sigstore/cosign)
  * (Optional) Generate bill of materials using [syft](https://github.com/anchore/syft) and include in attestation 
  * (Optional) Use `security-scan-nofail` in standard Dockerfile build to prevent scan results from failing build. 

_Incorporates concepts from circleci/docker-publish@0.1.2_
