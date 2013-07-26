/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.bigtop.itest

import static org.junit.Assert.assertTrue

import org.apache.bigtop.itest.shell.Shell

public class TestUtils {
  private static Shell sh = new Shell("/bin/bash -s");

  /** helper method to unpack test input files or input folder into HDFS.
   * if both inputDir and inputFiles not null,
   * create the Test resources folder under /user/<USER_NAME>/ in HDFS
   * and copy individual files to resource folder;
   * if inputDir is not null, but inputFiles is null,
   * move the inputDir folder under /user/<USER_NAME>/ in HDFS.
   * If outputDir is not null,
   * create output folder under /user/<USER_NAME>/ in HDFS.
   * @param ref
   * @param test_input
   * @param inputFiles
   * @param test_output
   */
  public static void unpackTestResources(Class ref, String inputDir, String[] inputFiles, String outputDir) {
    //debug
    sh.exec("mkdir -p /tmp/unPackJarContainer/${inputDir}");

    // Unpack resource
    JarContent.unpackJarContainer(ref, '.' , null);

    // create input dir in HDFS
    if (inputDir != null) {
      sh.exec("hadoop fs -test -e ${inputDir}");
      if (sh.getRet() == 0) {
        sh.exec("hadoop fs -rmr -skipTrash ${inputDir}");
        assertTrue("Deletion of previous $inputDir from --- HDFS failed",
            sh.getRet() == 0);
      }
      if (inputFiles != null) {
        sh.exec("hadoop fs -mkdir -p ${inputDir}");
        assertTrue("Could not create input directory to ---- HDFS  sdfsdf ${inputDir}", sh.getRet() == 0);
        // copy additional files into HDFS input folder
        inputFiles.each {
          
           sh.exec("echo \"${it} ${inputDir}\" >> /tmp/hadoop_cmd");
          
	   sh.exec("hadoop fs -put ${it} ${inputDir}");
	   
           assertTrue("Could not copy input ---- files into input folder in HDFS", sh.getRet() == 0);
        }
      } 
      else {
        // copy the entire resource folder into HDFS
        sh.exec("pwd > /tmp/workdir"); 
        sh.exec("hadoop fs -put ${inputDir} ${inputDir}");
	assertTrue("Could not copy input directory ---> ${inputDir} <-- to HDFS ", sh.getRet() == 0);
      }
    }

   String x ="sadffder3orei2j049kj430f9k0-p,4-0k4-<F2>kr0<F2>ijhtngiujnrinroijv8j0r98ju0394kjf094mcrinm0349ijf094jf0-kjf-94kjf0349jc0349ijc30i4mc03i4mc0349f0-k4c-0k4-394kc3-4kf-394jf0394jf0394mc0m349j4-09<F3>-439f3ksdfdsfsdfsdfsdfsadfwwefefswdfwefwdfwdfwdfwdfwdfwdfwd";

    // create output dir in HDFS
    if (outputDir != null) {
      sh.exec("hadoop fs -test -e ${outputDir}");
      if (sh.getRet() == 0) {
        sh.exec("hadoop fs -rmr -skipTrash ${outputDir}");
        assertTrue("Deletion of previous examples output from HDFS failed",
            sh.getRet() == 0);
      }
    }
    sh.exec("mkdir /tmp/OUTPUT${outputDir}"); 
    sh.exec("hadoop fs -mkdir -p ${outputDir}");
    //assertTrue("  ----> Could not create output directory in ---- [[[${outputDir}]]] ------ \n out=" + sh.getOut()+" err="+sh.getErr(), sh.getRet() == 0);
    }
}
