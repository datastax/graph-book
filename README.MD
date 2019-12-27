
#### Well, well, well, what do we have here?
You have found the repository contains the data, loading scripts, and Studio Notebookes that accompany [The Practitioners Guide to Graph Data](https://g.co/kgs/pSo6dK).

Content Authors: 
1. [Denise Gosnell](https://twitter.com/DeniseKGosnell)  
2. [Matthias Broecheler](https://twitter.com/MBroecheler)

Technical Editors:
1. [Alex Ott](https://github.com/alexott)
2. [Lorina Poland](https://github.com/polandll)
3. [Daniel Kuppitz](https://github.com/dkuppitz)


## Getting Started

You will need to download and configure two DataStax products to use this repository: DataStax Graph 6.8 with DataStax Studio and DataStax Bulk Loader


Setting Up DataStax Graph 6.8 via a tarball:
1. Download our Linux distrubition of [DataStax Graph 6.8 with DataStax Studio](https://downloads.datastax.com/#labs)
2. From your terminal, untar the distribution and start DataStax Graph 6.8

3. Start DataStax Studio


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
Let us know how you like the book and these materials! 
1. Let us know what you think [on Twitter] (https://twitter.com/Graph_Thinking)
2. Leave our book a [review on Amazon](https://www.amazon.com/Practitioners-Guide-Graph-Data/dp/1492044075)

