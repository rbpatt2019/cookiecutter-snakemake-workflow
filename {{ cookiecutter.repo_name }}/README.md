# Snakemake workflow: {{cookiecutter.project_name}}

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![CI/CD](https://github.com/{{cookiecutter.username}}/{{cookiecutter.repo_name}}/actions/workflows/cicd.yaml/badge.svg)](https://github.com/{{cookiecutter.username}}/{{cookiecutter.repo_name}}/actions/workflows/cicd.yaml)
[![Snakemake](https://img.shields.io/badge/snakemake-≥{{cookiecutter.min_snakemake_version}}-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Codestyle: Black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Codestyle: snakefmt](https://img.shields.io/badge/code%20style-snakefmt-000000.svg)](https://github.com/snakemake/snakefmt)

{{cookiecutter.description}}

This is the template for a new Snakemake workflow.
Replace this text with a comprehensive description covering the purpose and domain.
Insert your code into the respective folders, i.e. `scripts`, `rules`, and `envs`.
Define the entry point of the workflow in the `Snakefile` and the main configuration in the `config.yaml` file.

## Authors

* {{cookiecutter.full_name}} (@{{cookiecutter.username}})

## Notes on Installation

### Necessary Software

This pipeline needs [conda][conda]
and [snakemake][sm]
installed,
and runs best if you also have [singularity][sing]
installed,
though it's not required.

Snakemake recommends using [mambaforge][mambaforge]
as your base conda,
which I would also recommend.
Installation instructions are at the above link.
If you prefer a vanilla conda installation,
you can always try `mamba` following the instructions at the above snakemake link.
Once you have conda installed,
install snakemake as outlined on their page
(again, see the above link)
and activate your snakemake environment.

If you are running on a Linux system,
then singularity can be installed from conda like so:

```shell
conda install -n snakemake -c conda-forge singularity
```

It's a bit more challenging for other operating systems.
Your best bet is to follow their instructions
[here][sing_install].
But don't worry!
**Singularity is _not_ regquired!**
Snakemake will still run each step in its own Conda environment,
it just won't put each Conda environment in a container.

### Get the Source Code

Navigate to our [release][releases]
page on github and download the most recent version.
The following will do the trick:

```shell
curl -s https://api.github.com/repos/IMS-Bio2Core-Facility/single_snake_sequencing/releases/latest |
grep tarball_url |
cut -d " " -f 4 |
tr -d '",' |
xargs -n1 curl -sL |
tar xzf -
```

After querying the github api to get the most recent release information,
we grep for the desired URL,
split the line and extract the field,
trim superfluous characters,
use `xargs` to pipe this to `curl` while allowing for re-directs,
and un-tar the files.
Easy!

Alternatively,
for the bleeding edge,
please clone the repo like so:

```shell
git clone https://github.com/IMS-Bio2Core-Facility/single_snake_sequencing
```

> :warning: **Heads Up!**
> The bleeding edge may not be stable,
> as it contains all active development.

However you choose to install it,
`cd` into the directory.

### Running

Once you've installed the above software,
and fetched the code,
running the pipeline is as simple as:

```shell
snakemake --use-conda --use-singularity --cores 6
```

If you aren't using `singularity`,
then leave off the apropriate flag, as so:

```shell
snakemake --use-conda --cores 6
```

And `snakemake` will automatically leave it off.

## Notes on Configuration

> :warning:  **Be sure to change the configuration to suit your project!**

For a full discussion of configuration,
please see the [configuration README](config/README.md).

Briefly,
the general configuration file must be located at `config/config.yaml`.
A samplesheet containing information pertaining to the data must be supplied as well.
Both are schema validated.

## Notes on Data

NOTES ON THE DATA

## Notes on the tools

The analysis pipeline was run using Snakemake {{cookiecutter.min_snakemake_version}}>
The full version and software lists can be found under the relevant yaml files in `workflow/envs`.
The all reasonable efforts have been made to ensure that the repository adheres to the best practices
outlined [here](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html).

## Notes on the analysis

For a full discussion on the analysis methods,
please see the [technical documentation](workflow/documentation.md).

## Future work

- [ ] Add future work

## Contributing

If you are interested in contributing,
please see our [Contributor's Guide](./CONTRIBUTING.md)

[sm]: https://snakemake.readthedocs.io/en/stable/index.html "Snakemake"
[conda]: https://docs.conda.io/en/latest/ "Conda"
[sing]: https://sylabs.io/singularity/ "Singularity"
[mambaforge]: https://github.com/conda-forge/miniforge#mambaforge "Mambaforge"
[sing_install]: https://sylabs.io/guides/3.8/admin-guide/installation.html#installation-on-windows-or-mac "Singularity Install"
[releases]: https://github.com/IMS-Bio2Core-Facility/single_snake_sequencing/releases "Releases"
