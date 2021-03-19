<!--![gh-action-test](https://github.com/bhamail/jake-gh-action-test/workflows/Jake/badge.svg)-->
<a href="https://github.com/bhamail/jake-gh-action-test/actions?query=workflow%3AJake"><img src="https://github.com/bhamail/jake-gh-action-test/workflows/Jake/badge.svg" alt="gh-action-test"></img></a>

Jake GitHub Action play project
===========================

The [Dockerfile](Dockerfile) in this project generates a list of conda packages for use by Jake.
```
docker build -t conda-list .
docker run conda-list > packages.list
```

The `openssl` package has a vulnerability ([CVE-2019-0190](https://ossindex.sonatype.org/vuln/d3c31c2b-1117-49a6-990e-e8b16d530582?component-type=conda&component-name=openssl&utm_source=jake&utm_medium=integration&utm_content=))
that appears in all versions. So for now, I've removed `openssl` from the `packages.list` file.
```
openssl                   1.1.1h               h7b6447c_0  
```

ToDo
----
* ~~Replace the commit hash below with a reference to either a release version or the `main` branch
in `.github/workflows/jake.yml`:~~ Done, references `main` branch now.

    ```
    uses: sonatype-nexus-community/jake-github-action@811b6670e343fc48fde273906404adaac9bd3885
    ```

Updating Dependency versions
----------------------------
As vulnerabilities are detected, you can use the following commands to find updated versions of dependencies:

To find a list of available `Version`s and `Build`s for a package named: `urllib3`:
```
conda search --full-name urllib3
```

You can run a local build using the [act](https://github.com/nektos/act) project. e.g.:
```shell
$ act
[Jake/Build] 🚀  Start image=catthehacker/ubuntu:act-latest
[Jake/Build]   🐳  docker run image=catthehacker/ubuntu:act-latest entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[Jake/Build]   🐳  docker cp src=/Users/bhamail/sonatype/community/jake-gh-action-test/. dst=/github/workspace
[Jake/Build] ⭐  Run Check out code
[Jake/Build]   ✅  Success - Check out code
[Jake/Build] ⭐  Run Setup
Get:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:2 https://download.docker.com/linux/ubuntu bionic InRelease [64.4 kB]      
...
| The following packages will be upgraded:
|   libpython3.6-minimal libpython3.6-stdlib python3.6 python3.6-minimal
| 4 upgraded, 5 newly installed, 0 to remove and 20 not upgraded.
| Need to get 5940 kB of archives.
| After this operation, 5044 kB of additional disk space will be used.
...
```

It is taking a long time to run for me, but I think it will finish...
