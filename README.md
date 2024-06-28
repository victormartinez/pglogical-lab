## Pglogical Lab

This project provides an easy-to-use environment for setting up and experimenting with pglogical, a PostgreSQL extension for logical replication. Whether you're looking to learn about logical replication or test configurations in a controlled setting, PGLogical Lab has you covered.

## Getting Started

### Prerequisites

1. Docker installed on your machine.
2. Basic knowledge of PostgreSQL and pglogical.

### Installation

Clone the repository:

```sh
git clone https://github.com/victormartinez/pglogical-lab.git
cd pglogical-lab
```

Start environment

```sh
make up-containers
```

### Configuration

Create tables for both nodes (primary and secondary):

```sh
make db-upgrade
```

Configure replication:

```sh
make setup-replication
```

### Checking Replication

Add data to primary database:

```sh
make load-primary-data
```

Check it exists in the secondary database:

```sh
make connect-secondary

SELECT * FROM crm.person;
SELECT * FROM crm.address;
```

### Clean up

```sh
make rm-containers
make rm-images
```