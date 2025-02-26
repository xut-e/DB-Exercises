/* Copyright 2008, 2010, Oracle and/or its affiliates. All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2 of the License.

There are special exceptions to the terms and conditions of the GPL
as it is applied to this software. View the full text of the
exception in file EXCEPTIONS-CONNECTOR-C++ in the directory of this
software distribution.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
*/

/* Standard C++ includes */
#include <stdlib.h>
#include <iostream>

/*
  Include directly the different
  headers from cppconn/ and mysql_driver.h + mysql_util.h
  (and mysql_connection.h). This will reduce your build time!
*/
#include "mysql_connection.h"

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

using namespace std;

int main(void)
{

std::string username;
std::string password;

std::cout << "username: " << std::flush;
std::getline(std::cin, username);

std::cout << "\npassword: " << std::flush;
std::getline(std::cin, password);
cout << endl;


  sql::Driver *driver;
  sql::Connection *con;
  sql::Statement *stmt;
  sql::ResultSet *res;

  /* Create a connection */
  driver = get_driver_instance();
  con = driver->connect("tcp://127.0.0.1:3306","root", "root");
  /* Connect to the MySQL test database */
  con->setSchema("formulario");

  stmt = con->createStatement();
  res = stmt->executeQuery("SELECT * FROM usuarios");

  bool signIn = false;

  while (res->next()) {
    /*cout << "\t... MySQL replies: ";
     Access column data by alias or column name 
    cout << res->getString("_message") << endl;
    cout << "\t... MySQL says it again: ";
     Access column data by numeric offset, 1 is the first column
    cout << res->getString(1) << endl;*/

    int resultadoId = res->getInt(1);
    std::string resultadoUsername = res->getString(2);
    std::string resultadoPassword = res->getString(3);

    if(resultadoUsername == username && resultadoPassword == password)
    {
	signIn = true;
    }
  }

  if(signIn)
  {
	std::cout << "Welcome" << std::endl;
  }
  else
  {
	std::cout << "[ERROR] Usuario o contrasenya incorrectos" << std::endl;
  }

  delete res;
  delete stmt;
  delete con;

cout << endl;
return EXIT_SUCCESS;
}

