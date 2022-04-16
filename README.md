<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/dps_lab_title.png" width=350/>
	</p>
  <h3>orb-executor-tools</h3>
  <h5>a workflow orb for authoring circleci remote-docker images</h5>
  <a href="https://app.circleci.com/pipelines/github/ThoughtWorks-DPS/orb-executor-tools"><img src="https://circleci.com/gh/ThoughtWorks-DPS/orb-executor-tools.svg?style=shield"></a> <a href="https://badges.circleci.com/orbs/twdps/executor-tools.svg"><img src="https://badges.circleci.com/orbs/twdps/executor-tools.svg"></a> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</div>
<br />

See [orb registry](https://circleci.com/developer/orbs/orb/twdps/executor-tools) for detailed usage examples

Features include:

- hadolint scan of Dockerfile
- available cve scan using Snyk
- available CIS Docker Benchmark, Section 4, assessment using openpolicyagent-based scan
- support for both bats and inspec based container configuration testing
- uses a dedicated `executor-builder` image that has all the necessary tools supported by the orb pre-installed
- machine executor can be specified as build environment
- automated github release via github-release-notes  

Workflows assume:

* Trunk based development (TBD)
* Versioned released are triggered/managed by tagging

_Incorporates concepts from circleci/docker-publish@0.1.2_

See [this](CIS_BENCHMARK.md) documentation for customizing the cis benchmark assessment.  
