# digest2-docker
MPC digest2 in a container

# Foreword 
This "project" is not supported by the Minor Planet Center, NASA, JPL or any institution. Please don't ask any help from them for this since they are already busy enough.

# Audience 
Astronomers hunting solar system objects who don't/can't like to compile C code but still want to use the [MPC digest2 software](https://bitbucket.org/mpcdev/digest2/src/master/)

# Prerequisites
* You need to install [Docker](https://www.docker.com/) for your operating system
* You need to be able to use the command line interface (I think it's called Powershell nowadays; it's the Terminal in MacOS; for Linux, I will use the bash syntax)

# Usage

## Linux/MacOS users:

You will need two directories on the host (aka your laptop, desktop, ...): 
* The first directory will contain the parameters necessary for digest2. The files in that directory will be reused each time you will compute new digest2 scores. To fix ideas, we will identify it as <code>/home/schastel/digest2-parameters</code>
* The second directory will contain your observations (in the 80-column format, as expected as digest2 when used on the command line). To fix ideas, we will identify it as <code>/home/schastel/data/observations-20210920</code>. Let's assume that it contains the file my_object.obs (the MPC has a sample.obs sample file at https://bitbucket.org/mpcdev/digest2/src/master/)

You will then have to run the following command in the shell/Terminal:

<code>
docker run --rm -v /home/schastel/digest2-parameters:/parameters -v /home/schastel/data/observations-20210920:/mine docker.io/schastel/digest2:latest /mine/my_object.obs
</code>

and assuming the contents of my_object.obs are those of sample.obs, you should eventually see something like:

<code>
Desig.    RMS Int NEO N22 N18 Other Possibilities
NE00030  0.15 100 100  33   0
NE00199  0.56  99  99  16   0 (MC 1) (JFC 1)
NE00269  0.42  27  27   4   0 (MC 7) (Pho 17) (MB1 <1) (Han <1) (MB2 29) (MB3 4) (JFC 1)
</code>


* The first time you run the previous command, the contents of the digest2-parameters directory will be initialized, that is, the digest2 model, the default MPC.config, and the obscodes will be downloaded from where they should. That means that you need to delete the contents of that directory when any of those are changed, especially the model. 
* Feel free to tweak the MPC.config contents at your convenience (but don't change its name). See https://bitbucket.org/mpcdev/digest2/src/master/OPERATION.md (the digest2.config section)
* The second and next times, only the scores corresponding to the contents of MPC.config will be displayed. 

## Windows users (please let me know if I'm wrong)

You will need two directories on the host (aka your laptop, desktop, ...): 
* The first directory will contain the parameters necessary for digest2. The files in that directory will be reused each time you will compute new digest2 scores. To fix ideas, we will identify it as <code>C:\Users\schastel\digest2-parameters</code>
* The second directory will contain your observations (in the 80-column format, as expected as digest2 when used on the command line). To fix ideas, we will identify it as <code>C:\Users\schastel\data\data\observations-20210920</code>. Let's assume that it contains the file my_object.obs (the MPC has a sample.obs sample file at https://bitbucket.org/mpcdev/digest2/src/master/)

You will then have to run the following command in the PowerShell:

<code>
docker run --rm -v C:\Users\schastel\digest2-parameters:/parameters -v C:\Users\schastel\data\data\observations-20210920:/mine docker.io/schastel/digest2:latest /mine/my_object.obs
</code>

and assuming the contents of [... read the paragraph above for Linux/MacOs Users]
