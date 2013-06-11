# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BIGTOP_VERSION=0.7.0

# Hadoop 0.20.0-based hadoop package
HADOOP_NAME=hadoop
HADOOP_RELNOTES_NAME=Apache Hadoop
HADOOP_BASE_VERSION=2.0.5-alpha
HADOOP_PKG_VERSION=2.0.5
HADOOP_RELEASE_VERSION=1
HADOOP_TARBALL_DST=$(HADOOP_NAME)-$(HADOOP_BASE_VERSION).tar.gz
HADOOP_TARBALL_SRC=$(HADOOP_NAME)-$(HADOOP_BASE_VERSION)-src.tar.gz
HADOOP_DOWNLOAD_PATH=/hadoop/common/$(HADOOP_NAME)-$(HADOOP_BASE_VERSION)
HADOOP_SITE=$(APACHE_MIRROR)$(HADOOP_DOWNLOAD_PATH)
HADOOP_ARCHIVE=$(APACHE_ARCHIVE)$(HADOOP_DOWNLOAD_PATH)
$(eval $(call PACKAGE,hadoop,HADOOP))

# ZooKeeper
ZOOKEEPER_NAME=zookeeper
ZOOKEEPER_RELNOTES_NAME=Apache Zookeeper
ZOOKEEPER_PKG_NAME=zookeeper
ZOOKEEPER_BASE_VERSION=3.4.5
ZOOKEEPER_PKG_VERSION=3.4.5
ZOOKEEPER_RELEASE_VERSION=1
ZOOKEEPER_TARBALL_DST=zookeeper-$(ZOOKEEPER_BASE_VERSION).tar.gz
ZOOKEEPER_TARBALL_SRC=$(ZOOKEEPER_TARBALL_DST)
ZOOKEEPER_DOWNLOAD_PATH=/zookeeper/zookeeper-$(ZOOKEEPER_BASE_VERSION)
ZOOKEEPER_SITE=$(APACHE_MIRROR)$(ZOOKEEPER_DOWNLOAD_PATH)
ZOOKEEPER_ARCHIVE=$(APACHE_ARCHIVE)$(ZOOKEEPER_DOWNLOAD_PATH)
$(eval $(call PACKAGE,zookeeper,ZOOKEEPER))

# HBase
HBASE_NAME=hbase
HBASE_RELNOTES_NAME=Apache HBase
HBASE_PKG_NAME=hbase
HBASE_BASE_VERSION=0.94.5
HBASE_PKG_VERSION=$(HBASE_BASE_VERSION)
HBASE_RELEASE_VERSION=1
HBASE_TARBALL_DST=hbase-$(HBASE_BASE_VERSION).tar.gz
HBASE_TARBALL_SRC=$(HBASE_TARBALL_DST)
HBASE_DOWNLOAD_PATH=/hbase/hbase-$(HBASE_BASE_VERSION)
HBASE_SITE=$(APACHE_MIRROR)$(HBASE_DOWNLOAD_PATH)
HBASE_ARCHIVE=$(APACHE_ARCHIVE)$(HBASE_DOWNLOAD_PATH)
$(eval $(call PACKAGE,hbase,HBASE))

# Pig
PIG_BASE_VERSION=0.11.1
PIG_PKG_VERSION=$(PIG_BASE_VERSION)
PIG_RELEASE_VERSION=1
PIG_NAME=pig
PIG_RELNOTES_NAME=Apache Pig
PIG_PKG_NAME=pig
PIG_TARBALL_DST=pig-$(PIG_BASE_VERSION).tar.gz
PIG_TARBALL_SRC=$(PIG_TARBALL_DST)
PIG_DOWNLOAD_PATH=/pig/pig-$(PIG_BASE_VERSION)
PIG_SITE=$(APACHE_MIRROR)$(PIG_DOWNLOAD_PATH)
PIG_ARCHIVE=$(APACHE_ARCHIVE)$(PIG_DOWNLOAD_PATH)
$(eval $(call PACKAGE,pig,PIG))

# Hive
HIVE_NAME=hive
HIVE_RELNOTES_NAME=Apache Hive
HIVE_PKG_NAME=hive
HIVE_BASE_VERSION=0.10.0
HIVE_PKG_VERSION=$(HIVE_BASE_VERSION)
HIVE_RELEASE_VERSION=1
HIVE_TARBALL_DST=hive-$(HIVE_BASE_VERSION).tar.gz
HIVE_TARBALL_SRC=$(HIVE_TARBALL_DST)
HIVE_DOWNLOAD_PATH=/hive/hive-$(HIVE_BASE_VERSION)
HIVE_SITE=$(APACHE_MIRROR)$(HIVE_DOWNLOAD_PATH)
HIVE_ARCHIVE=$(APACHE_ARCHIVE)$(HIVE_DOWNLOAD_PATH)
$(eval $(call PACKAGE,hive,HIVE))

# HCatalog
HCATALOG_NAME=hcatalog
HCATALOG_RELNOTES_NAME=Apache HCatalog (incubating)
HCATALOG_PKG_NAME=hcatalog
HCATALOG_BASE_VERSION=0.5.0-incubating
HCATALOG_PKG_VERSION=0.5.0
HCATALOG_RELEASE_VERSION=1
HCATALOG_TARBALL_DST=$(HCATALOG_NAME)-$(HCATALOG_BASE_VERSION).tar.gz
HCATALOG_TARBALL_SRC=$(HCATALOG_NAME)-src-$(HCATALOG_BASE_VERSION).tar.gz
HCATALOG_DOWNLOAD_PATH=/incubator/hcatalog/hcatalog-$(HCATALOG_BASE_VERSION)/
HCATALOG_SITE=$(APACHE_MIRROR)$(HCATALOG_DOWNLOAD_PATH)
HCATALOG_ARCHIVE=$(APACHE_ARCHIVE)$(HCATALOG_DOWNLOAD_PATH)
HCATALOG_SITE=$(APACHE_ARCHIVE)
$(eval $(call PACKAGE,hcatalog,HCATALOG))

# Sqoop
SQOOP_NAME=sqoop
SQOOP_RELNOTES_NAME=Sqoop
SQOOP_PKG_NAME=sqoop
SQOOP_BASE_VERSION=1.99.2
SQOOP_PKG_VERSION=1.99.2
SQOOP_RELEASE_VERSION=1
SQOOP_TARBALL_DST=$(SQOOP_NAME)-$(SQOOP_BASE_VERSION).tar.gz
SQOOP_TARBALL_SRC=$(SQOOP_TARBALL_DST)
SQOOP_DOWNLOAD_PATH=/sqoop/$(SQOOP_BASE_VERSION)
SQOOP_SITE=$(APACHE_MIRROR)$(SQOOP_DOWNLOAD_PATH)
SQOOP_ARCHIVE=$(APACHE_ARCHIVE)$(SQOOP_DOWNLOAD_PATH)
$(eval $(call PACKAGE,sqoop,SQOOP))

# Oozie
OOZIE_NAME=oozie
OOZIE_RELNOTES_NAME=Apache Oozie
OOZIE_PKG_NAME=oozie
OOZIE_BASE_VERSION=3.3.2
OOZIE_PKG_VERSION=3.3.2
OOZIE_RELEASE_VERSION=1
OOZIE_TARBALL_DST=oozie-$(OOZIE_BASE_VERSION).tar.gz
OOZIE_TARBALL_SRC=$(OOZIE_TARBALL_DST)
OOZIE_DOWNLOAD_PATH=/$(OOZIE_NAME)/$(OOZIE_BASE_VERSION)
OOZIE_SITE=$(APACHE_MIRROR)$(OOZIE_DOWNLOAD_PATH)
OOZIE_ARCHIVE=$(APACHE_ARCHIVE)$(OOZIE_DOWNLOAD_PATH)
$(eval $(call PACKAGE,oozie,OOZIE))

# Whirr
WHIRR_NAME=whirr
WHIRR_RELNOTES_NAME=Apache Whirr
WHIRR_PKG_NAME=whirr
WHIRR_BASE_VERSION=0.8.2
WHIRR_PKG_VERSION=0.8.2
WHIRR_RELEASE_VERSION=1
WHIRR_TARBALL_DST=whirr-$(WHIRR_BASE_VERSION)-src.tar.gz
WHIRR_TARBALL_SRC=$(WHIRR_TARBALL_DST)
WHIRR_DOWNLOAD_PATH=/whirr/whirr-$(WHIRR_BASE_VERSION)
WHIRR_SITE=$(APACHE_MIRROR)$(WHIRR_DOWNLOAD_PATH)
WHIRR_ARCHIVE=$(APACHE_ARCHIVE)$(WHIRR_DOWNLOAD_PATH)
$(eval $(call PACKAGE,whirr,WHIRR))

# Mahout
MAHOUT_NAME=mahout
MAHOUT_RELNOTES_NAME=Apache Mahout
MAHOUT_PKG_NAME=mahout
MAHOUT_BASE_VERSION=0.7
MAHOUT_PKG_VERSION=0.7
MAHOUT_RELEASE_VERSION=1
MAHOUT_TARBALL_DST=mahout-distribution-$(MAHOUT_BASE_VERSION)-src.tar.gz
MAHOUT_TARBALL_SRC=$(MAHOUT_TARBALL_DST)
MAHOUT_DOWNLOAD_PATH=/mahout/$(MAHOUT_BASE_VERSION)
MAHOUT_SITE=$(APACHE_MIRROR)$(MAHOUT_DOWNLOAD_PATH)
MAHOUT_ARCHIVE=$(APACHE_ARCHIVE)$(MAHOUT_DOWNLOAD_PATH)
$(eval $(call PACKAGE,mahout,MAHOUT))

# Flume
FLUME_NAME=flume
FLUME_RELNOTES_NAME=Flume
FLUME_PKG_NAME=flume
FLUME_BASE_VERSION=1.3.1
FLUME_PKG_VERSION=1.3.1
FLUME_RELEASE_VERSION=1
FLUME_TARBALL_DST=apache-$(FLUME_NAME)-$(FLUME_BASE_VERSION)-src.tar.gz
FLUME_TARBALL_SRC=$(FLUME_TARBALL_DST)
FLUME_DOWNLOAD_PATH=/flume/$(FLUME_BASE_VERSION)
FLUME_SITE=$(APACHE_MIRROR)$(FLUME_DOWNLOAD_PATH)
FLUME_ARCHIVE=$(APACHE_ARCHIVE)$(FLUME_DOWNLOAD_PATH)
$(eval $(call PACKAGE,flume,FLUME))

# Giraph
GIRAPH_NAME=giraph
GIRAPH_RELNOTES_NAME=Giraph
GIRAPH_PKG_NAME=giraph
GIRAPH_BASE_VERSION=1.0.0
GIRAPH_PKG_VERSION=1.0.0
GIRAPH_RELEASE_VERSION=1
GIRAPH_TARBALL_DST=$(GIRAPH_NAME)-$(GIRAPH_BASE_VERSION).tar.gz
GIRAPH_TARBALL_SRC=$(GIRAPH_TARBALL_DST)
GIRAPH_DOWNLOAD_PATH=/giraph/$(GIRAPH_PKG_NAME)-$(GIRAPH_BASE_VERSION)
GIRAPH_SITE=$(APACHE_MIRROR)$(GIRAPH_DOWNLOAD_PATH)
GIRAPH_ARCHIVE=$(APACHE_ARCHIVE)$(GIRAPH_DOWNLOAD_PATH)
$(eval $(call PACKAGE,giraph,GIRAPH))

# Hue
HUE_NAME=hue
HUE_RELNOTES_NAME=Hadoop User Experience
HUE_PKG_NAME=hue
HUE_BASE_VERSION=2.3.0
HUE_PKG_VERSION=2.3.0
HUE_RELEASE_VERSION=1
HUE_TARBALL_DST=hue-$(HUE_BASE_VERSION).tar.gz
HUE_TARBALL_SRC=hue-$(HUE_BASE_VERSION).tgz
HUE_SITE=http://cloudera.github.com/hue/releases/$(HUE_BASE_VERSION)
HUE_ARCHIVE=$(HUE_SITE)
$(eval $(call PACKAGE,hue,HUE))

# DataFu 
DATAFU_NAME=datafu
DATAFU_RELNOTES_NAME=Collection of user-defined functions
DATAFU_PKG_NAME=pig-udf-datafu
DATAFU_BASE_VERSION=0.0.6
DATAFU_PKG_VERSION=0.0.6
DATAFU_RELEASE_VERSION=1
DATAFU_TARBALL_DST=datafu-$(DATAFU_BASE_VERSION).tar.gz
DATAFU_TARBALL_SRC=v$(DATAFU_BASE_VERSION).tar.gz
DATAFU_SITE=https://github.com/linkedin/datafu/archive
DATAFU_ARCHIVE=$(DATAFU_SITE)
$(eval $(call PACKAGE,datafu,DATAFU))

# Solr
SOLR_NAME=solr
SOLR_RELNOTES_NAME=Search engine server
SOLR_PKG_NAME=solr
SOLR_BASE_VERSION=4.2.1
SOLR_PKG_VERSION=4.2.1
SOLR_RELEASE_VERSION=1
SOLR_TARBALL_DST=solr-$(SOLR_BASE_VERSION)-src.tgz
SOLR_TARBALL_SRC=$(SOLR_TARBALL_DST)
SOLR_DOWNLOAD_PATH=/lucene/solr/$(SOLR_BASE_VERSION)
SOLR_SITE=$(APACHE_MIRROR)$(SOLR_DOWNLOAD_PATH)
SOLR_ARCHIVE=$(APACHE_ARCHIVE)$(SOLR_DOWNLOAD_PATH)
$(eval $(call PACKAGE,solr,SOLR))

# Crunch
CRUNCH_NAME=crunch
CRUNCH_RELNOTES_NAME=Java library for MapReduce pipelines
CRUNCH_PKG_NAME=crunch
CRUNCH_BASE_VERSION=0.5.0-incubating
CRUNCH_PKG_VERSION=0.5.0
CRUNCH_RELEASE_VERSION=1
CRUNCH_TARBALL_DST=apache-crunch-$(CRUNCH_BASE_VERSION)-src.tar.gz
CRUNCH_TARBALL_SRC=$(CRUNCH_TARBALL_DST)
CRUNCH_DOWNLOAD_PATH=/crunch/crunch-$(CRUNCH_BASE_VERSION)
CRUNCH_SITE=$(APACHE_MIRROR)$(CRUNCH_DOWNLOAD_PATH)
CRUNCH_ARCHIVE=$(APACHE_ARCHIVE)$(CRUNCH_DOWNLOAD_PATH)
$(eval $(call PACKAGE,crunch,CRUNCH))

# Bigtop-utils
BIGTOP_UTILS_NAME=bigtop-utils
BIGTOP_UTILS__RELNOTES_NAME=Bigtop-utils
BIGTOP_UTILS_PKG_NAME=bigtop-utils
BIGTOP_UTILS_BASE_VERSION=$(subst -,.,$(BIGTOP_VERSION))
BIGTOP_UTILS_PKG_VERSION=$(BIGTOP_UTILS_BASE_VERSION)
BIGTOP_UTILS_RELEASE_VERSION=1
$(eval $(call PACKAGE,bigtop-utils,BIGTOP_UTILS))

# Bigtop-jsvc
BIGTOP_JSVC_NAME=bigtop-jsvc
BIGTOP_JSVC_RELNOTES_NAME=Apache Commons Daemon (jsvc)
BIGTOP_JSVC_PKG_NAME=bigtop-jsvc
BIGTOP_JSVC_BASE_VERSION=1.0.10
BIGTOP_JSVC_PKG_VERSION=1.0.10
BIGTOP_JSVC_RELEASE_VERSION=1
BIGTOP_JSVC_TARBALL_SRC=commons-daemon-$(BIGTOP_JSVC_BASE_VERSION)-native-src.tar.gz
BIGTOP_JSVC_TARBALL_DST=commons-daemon-$(BIGTOP_JSVC_BASE_VERSION).tar.gz
BIGTOP_JSVC_SITE=$(APACHE_MIRROR)/commons/daemon/source/
BIGTOP_JSVC_ARCHIVE=$(APACHE_ARCHIVE)/commons/daemon/source/
$(eval $(call PACKAGE,bigtop-jsvc,BIGTOP_JSVC))

# Bigtop-tomcat
BIGTOP_TOMCAT_NAME=bigtop-tomcat
BIGTOP_TOMCAT_RELNOTES_NAME=Apache Tomcat
BIGTOP_TOMCAT_PKG_NAME=bigtop-tomcat
BIGTOP_TOMCAT_BASE_VERSION=6.0.36
BIGTOP_TOMCAT_PKG_VERSION=$(BIGTOP_TOMCAT_BASE_VERSION)
BIGTOP_TOMCAT_RELEASE_VERSION=1
BIGTOP_TOMCAT_TARBALL_SRC=apache-tomcat-$(BIGTOP_TOMCAT_BASE_VERSION)-src.tar.gz
BIGTOP_TOMCAT_TARBALL_DST=apache-tomcat-$(BIGTOP_TOMCAT_BASE_VERSION).tar.gz
BIGTOP_TOMCAT_SITE=$(APACHE_MIRROR)/tomcat/tomcat-6/v$(BIGTOP_TOMCAT_BASE_VERSION)/src/
BIGTOP_TOMCAT_ARCHIVE=$(APACHE_ARCHIVE)/tomcat/tomcat-6/v$(BIGTOP_TOMCAT_BASE_VERSION)/src/
$(eval $(call PACKAGE,bigtop-tomcat,BIGTOP_TOMCAT))
