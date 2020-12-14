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
