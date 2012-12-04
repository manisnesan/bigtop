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
    // Unpack resource
    JarContent.unpackJarContainer(ref, '.' , null);

    // create input dir in HDFS
    if (inputDir != null) {
      sh.exec("hadoop fs -test -e ${inputDir}");
      if (sh.getRet() == 0) {
        sh.exec("hadoop fs -rmr -skipTrash ${inputDir}");
        assertTrue("Deletion of previous $inputDir from HDFS failed",
            sh.getRet() == 0);
      }
      if (inputFiles != null) {
        sh.exec("hadoop fs -mkdir -p ${inputDir}");
        assertTrue("Could not create input directory to HDFS", sh.getRet() == 0);
        // copy additional files into HDFS input folder
        inputFiles.each {
          sh.exec("hadoop fs -put ${it} ${inputDir}");
          assertTrue("Could not copy input files into input folder in HDFS", sh.getRet() == 0);
        }
      } else {
        // copy the entire resource folder into HDFS
        sh.exec("hadoop fs -put ${inputDir} ${inputDir}");
        assertTrue("Could not copy input directory to HDFS", sh.getRet() == 0);
      }
    }

    // create output dir in HDFS
    if (outputDir != null) {
      sh.exec("hadoop fs -test -e ${outputDir}");
      if (sh.getRet() == 0) {
        sh.exec("hadoop fs -rmr -skipTrash ${outputDir}");
        assertTrue("Deletion of previous examples output from HDFS failed",
            sh.getRet() == 0);
      }
      sh.exec("hadoop fs -mkdir -p ${outputDir}");
      assertTrue("Could not create output directory in HDFS", sh.getRet() == 0);
    }
  }
}
