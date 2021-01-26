# sample-oracle-mysql-ee-5.7-cis-overlay
InSpec profile overlay for the [Oracle MySQL EE 5.7 CIS Baseline profile](https://github.com/mitre/oracle-mysql-ee-5.7-cis-baseline) to validate the secure configuration of Oracle MySQL EE 5.7 against the [CIS Oracle MySQL EE 5.7 Benchmark 1.0.0](https://www.cisecurity.org/cis-benchmarks/).

## Getting Started  
It is intended and recommended that InSpec and this profile overlay be run from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

Git is required to download the latest InSpec profiles using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site. 

## Tailoring to Your Environment
For the MySQL resource to be properly accessed, you must ensure that the server's `mysql.exe` file is in the PATH environment variable. First you will need to find the `mysql.exe` file, which should be under `C:\Program Files\MySQL\MySQL Server 5.1\bin`. Otherwise, it should be in the `bin` directory of wherever MySQL is installed. Then, add the full path to the directory containing the executable [as specfied here](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/).

The following inputs must be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
# Username MySQL DB Server (e.g., 'root')
user: ''

# Password MySQL DB Server (e.g., 'P@ssw0rd1')
password: ''

# Hostname MySQL DB Server (e.g., 'localhost')
host: ''

# Port MySQL DB Server
port: 3306

# List of MySQL database users (e.g., ['root'])
mysql_users: []   

# Set to true if the MySQL server has a slave configured
is_mysql_server_slave_configured: false

# List of MySQL administrative users (e.g., ['root'])
mysql_administrative_users: [] 

# List of MySQL users allows to modify or create data structures (e.g., ['root'])
mysql_users_allowed_modify_or_create: [] 

# Full path to MySQL configuration file (e.g. 'C:\Users\vagrant\MySQL\my.ini')
mysql_config_file: ''
```

## Running This Overlay Directly from Github

```
# How to run
inspec exec https://github.com/mitre/sample-oracle-mysql-ee-5.7-cis-overlay/archive/main.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)

When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/mitre/sample-oracle-mysql-ee-5.7-cis-overlay.git
inspec archive sample-oracle-mysql-ee-5.7-cis-overlay
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd sample-oracle-mysql-ee-5.7-cis-overlay
git pull
cd ..
inspec archive sample-oracle-mysql-ee-5.7-cis-overlay --overwrite
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/mitre/sample-oracle-mysql-ee-5.7-cis-overlay/issues/new).

### NOTICE 

CIS Benchmarks are published by the Center for Internet Security (CIS), see: https://www.cisecurity.org/.
