/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.bigtop.itest.hivesmoke;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

import org.apache.bigtop.itest.Contract;
import org.apache.bigtop.itest.ParameterSetter;
import org.apache.bigtop.itest.Property;
import org.apache.bigtop.itest.shell.Shell;

public class TestHiveETL {

  public static Shell sh = new Shell("/bin/bash -s");

  @BeforeClass
  public static void setUp() throws ClassNotFoundException, InterruptedException, NoSuchFieldException, IllegalAccessException {
    sh.exec("touch /tmp/hivetest");
  }
  public void validate(){
    java.io.File f = new java.io.File('./shell_tests/test.sh')
    assertTrue(f.exists());
    print("test file length " + f.length());
  }

  @Test(timeout=120000L)
  public void testCreate() throws SQLException {
    print("Starting exec ")
    sh.exec("cd ./shell_tests/ && source test.sh");
    print(sh.out +  " " + sh.err)
    print(sh.ret + " <--- return code") 
    assertEquals("Return code 0", 0, sh.ret)
  }

}
