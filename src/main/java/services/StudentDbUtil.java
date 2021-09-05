/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import models.Student;

/**
 *
 * @author huynq
 */
public class StudentDbUtil {

    private DataSource dataSource;

    public StudentDbUtil(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Student> getStudents() throws Exception {

        List<Student> students = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {

            // get connection
            myConn = dataSource.getConnection();

            // create sql statement
            String sql = "select * from student order by last_name";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process result set
            while (myRs.next()) {

                // retrieve data from result set row
                int id = myRs.getInt("id");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                String email = myRs.getString("email");

                // create new student object
                Student tempStudent = new Student(id, firstName, lastName, email);

                // add it to the list of students
                students.add(tempStudent);
            }

            return students;

        } finally {
            close(myConn, myStmt, myRs);
        }

    }

    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

        if (myRs != null) try {
            myRs.close();
        } catch (SQLException ignore) {
        }

        if (myStmt != null) try {
            myStmt.close();
        } catch (SQLException ignore) {
        }

        if (myConn != null) try {
            myConn.close();
        } catch (SQLException ignore) {
        }
    }

    public void addStudent(Student theStudent) {
        
    }

}
