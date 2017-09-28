Subutai Appliances
------------------

To quickly get up and running with Subutai resource hosts and peers, we provide
virtual machine appliances for various hypervisors. These appliances are
automatically generated using [packer](https://www.packer.io) templates. The
templates generate images for the following hypervisors as of this writing:

*   VMWare (Workstation, and Player)
*   VMWare Fusion
*   VirtualBox
*   Parallels Desktop

> You will need to install packer on the build machine as well as jsonnet.

Jsonnet Preprocessor
--------------------

You will need the [jsonnet](https://github.com/google/jsonnet) json preprocessor
installed on the build machine to generate the final packer templates. Jsonnet
allows us to break apart the functionality and mix and match configurations to
manage templates in a clean fashion without needlessly duplicating large
fragments of json all over the place. The folders contain jsonnet snippets for
packer entities:

*   builders - packer builder configurations for each hypervisor
*   post-processors - post build functions we reuse
*   provisioners - packer provisioner templates to deploy vagrant boxes etc
*   scripts - used by provisioners and post-processors

These jsonnet fragments are assembled into the final packer template by the
jsonnet preprocessor. The packer template that is generated is template.json.

The top level template is template.jsonnet which imports all the processed
jsonnet fragements. The variables.jsonnet can be modified to customize various
parameters like account information for Atlas or AWS S3 uploads.

Building Appliances
-------------------

After modifying the variables in variables.jsonnet and installing the required
tools (packer and jsonnet), you can invoke the build.sh script to start
generating virtual machine images for Subutai.

### Miscellaneous Notes

For parallels builds on Mac OS X you will need to install the parallels
virtualization SDK for your version. Otherwise you will get the following
error:

```
Build 'parallels-iso' errored: Error sending boot command: prltype error: Traceback (most recent call last):
  File "/var/folders/5j/rb7z6w752vn8729h7h9xs2x80000gn/T/prltype464914580", line 3, in <module>
    import prlsdkapi
ImportError: No module named prlsdkapi
```

For debugging purposes there is a null builder but it requires a host to test
the scripts without the long build time of installation. You can have a host
out there that is a basic installation to act as a null builder host to use.

When running use the -only=virtualbox-iso or -except=null option to avoid
a broken build if you do not have a null builder host available.

You can use the simple build.sh script to build all the supported hypervisor
images. Note that parallels will fail if you're not on a mac system so you
might want to use the except flag for parallels-iso and null builders.

Using Debian File Caching
-------------------------

There's a Dockerfile in the root folder to launch a docker container that runs the 
APT caching daemon. If you're going to be building over and over again especially to make
changes you'll want to run this container to cache the downloaded files. Here's
how to use it:

Build the image while in the top directory after cloning the repo:

> $ docker build -t eg_apt_cacher_ng .

Then run it, mapping the exposed port to one on the host:

> docker run -d -p 3142:3142 --name test_apt_cacher_ng eg_apt_cacher_ng

Make sure you get the IP address of the host running the container. You'll
then want to set the apt proxy settings in the variables.jsonnet file to point
to it:

```
"apt_proxy_url": "http://192.168.88.130:3142/",
"apt_proxy_host": "192.168.88.130",
```

You can also set the APT_PROXY_URL and APT_PROXY_HOST environment variables and
they'll get picked up to populate these variables.

> See here for the original source of information about the docker container
> and instructions on usage. [https://docs.docker.com/engine/examples/apt-cacher-ng/](https://docs.docker.com/engine/examples/apt-cacher-ng/)


Feature List
------------

*   Uses apt-cacher-ng to cache apt packages: see Dockerfile
*   Builds from the Ubuntu Server 16.04.3 amd64 ISO from Canonical Ltd.
*   Uses a single expandable disk for all hypervisors
*   Sets up logical volumes for every unix standard directory
*   All hypervisor tools are installed to enable shared folders
*   Uses jsonnet to break up large configuration into peices and enable comments
