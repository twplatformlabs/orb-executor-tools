<div align="center">
	<p>
		<img alt="CircleCI Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/authoring-orbs/master/dps.png?sanitize=true" width="75" />
	</p>
  <h1>executor-tools</h1>
  <h5>a workflow orb for authoring circleci remote-docker images</h5>
</div>
<br />



  <!-- <a href="https://app.circleci.com/pipelines/github/feedyard/orb-tools"><img src="https://circleci.com/gh/feedyard/orb-tools.svg?style=shield"></a> <a href="https://circleci.com/orbs/registry/orb/feedyard/orb-tools"><img src="https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/feedyard/orb-tools"></a> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a> -->


<div align="center">
  <p>
		<img alt="CircleCI Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/authoring-orbs/master/circleci.svg?sanitize=true" width="45" />
	</p>
  <h3>Part of the ThoughtWorks-DPS series orbs</h3>
</div>





A starter template for orb projects. Build, test, and publish orbs automatically on CircleCI with [Orb-Tools](https://circleci.com/orbs/registry/orb/circleci/orb-tools).

Additional READMEs are available in each directory.

**Meta**: This repository is open for contributions! Feel free to open a pull request with your changes. Due to the nature of this repository, it is not built on CircleCI. The Resources and How to Contribute sections relate to an orb created with this template, rather than the template itself.

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/<namespace>/<project-name>) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/<organization>/<project-name>/issues) to and [pull requests](https://github.com/<organization>/<project-name>/pulls) against this repository!

### How to Publish
* Create and push a branch with your new features.
* When ready to publish a new production version, create a Pull Request from _feature branch_ to `master`.
* The title of the pull request must contain a special semver tag: `[semver:<segement>]` where `<segment>` is replaced by one of the following values.

| Increment | Description|
| ----------| -----------|
| major     | Issue a 1.0.0 incremented release|
| minor     | Issue a x.1.0 incremented release|
| patch     | Issue a x.x.1 incremented release|
| skip      | Do not issue a release|

Example: `[semver:major]`

* Squash and merge. Ensure the semver tag is preserved and entered as a part of the commit message.
* On merge, after manual approval, the orb will automatically be published to the Orb Registry.


For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).
