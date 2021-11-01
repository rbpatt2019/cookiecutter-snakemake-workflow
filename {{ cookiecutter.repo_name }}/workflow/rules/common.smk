from snakemake.utils import validate
from pathlib import Path
from yaml import safe_load

# Validate structures
with open(config["samples"], "r") as file:
    metadata = safe_load(file)
validate(metadata, schema="../schema/samples.schema.yaml")
validate(config, schema="../schema/config.schema.yaml")

# Global variables


# wildcard_restraints


# Input functions


