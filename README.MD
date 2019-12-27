
#### Well, well, well, what do we have here?
You have found the repository contains the data, loading scripts, and Studio Notebookes that accompany [The Practitioners Guide to Graph Data](https://g.co/kgs/pSo6dK).

Content Authors: 
1. [Denise Gosnell](https://twitter.com/DeniseKGosnell)  
2. [Matthias Broecheler](https://twitter.com/MBroecheler)

Technical Editors:
1. [Alex Ott](https://github.com/alexott)
2. [Lorina Poland](https://github.com/polandll)
3. [Daniel Kuppitz](https://github.com/dkuppitz)


## What is in this repository?
This repository contains Studio Notebooks, data, and loading scripts to follow the examples within Chapters 3 through 12 in [The Practitioners Guide to Graph Data](https://g.co/kgs/pSo6dK). The content is organized as follows:
1. `notebooks/`: All DataStax Studio Notebooks for Chapters 3 through 12. These can be uploaded into DataStax Studio via the Studio Import Tool. (Directions below)
2. `data/ch_x`: The data directory contains a folder per chapter. Within each folder, you will find the data and loading scripts to insert the data into DataStax Graph 6.8 via DataStax Bulk Loader.

The directions below detail how to get started.

## Getting Started

You will need to download and configure two DataStax products to use this repository: DataStax Graph 6.8 with DataStax Studio and DataStax Bulk Loader


Setting Up DataStax Graph 6.8 via a tarball:
1. Download our Linux distrubition of [DataStax Graph 6.8 with DataStax Studio](https://downloads.datastax.com/#labs)
2. From your terminal, untar the distributions of DataStax Graph 6.8 and DataStax Studio
```
$ unzip graph-labs-20190912.zip 
$ tar -xvzf dse-6.8.0.20190911-LABS-bin.tar.gz
$ tar -xvzf datastax-studio-6.8.0.20190912-LABS.tar.gz
```
3. Start DataStax Graph:
```
$ ./dse-6.8.0.20190911-LABS/bin/dse cassandra -s -g -k
```
4. Start DataStax Studio:
```
$ ./datastax-studio-6.8.0.20190912-LABS/bin/server.sh
```
5. (Optional) See the DataStax Documentation for any custom configurations of [DataStax Graph](https://docs.datastax.com/en/dse/6.0/dse-dev/datastax_enterprise/graph/graphTOC.html) or [DataStax Studio](https://docs.datastax.com/en/studio/6.0/index.html). This is not necessary for using this repository of examples.

Setting up DataStax Bulk Loader via a tarball:
1. Download our Linus distribution of [DataStax Bulk Loader](https://downloads.datastax.com/#bulk-loader)
2. Untar the distribution:
```tar -xvzf dsbulk-1.4.1.tar.gz```
3. Make note of the path to the top level directory of DataStax Bulk Loader.
4. (Optional) See the [DataStax Documentation](https://docs.datastax.com/en/dsbulk/doc/) for any custom configurations of DataStax Bulk Loader. This is not necessary for using this repository of examples.


## How to use this repository
1. Clone this repository: `git clone git@github.com:datastax/graph-book.git`
2. With DataStax Studio running, go to the [DataStax Studio Home Page](http://localhost:9091/)
3. Upload the Chapter notebook you want to use via the Notebook Upload Tool
4. Follow the directions in the Notebook!
5. (Optional, Proactive Step): Set the `DEFAULT_DSBULK_PATH` variable in the data loading scripts to point to the install location of DataStax Bulk Loader. All loading scripts are located in `data/ch_x/ch_x_load.sh`

## What to do next
1. Let us know what you think [on Twitter](https://twitter.com/Graph_Thinking)
2. Leave our book a [review on Amazon](https://www.amazon.com/Practitioners-Guide-Graph-Data/dp/1492044075)

