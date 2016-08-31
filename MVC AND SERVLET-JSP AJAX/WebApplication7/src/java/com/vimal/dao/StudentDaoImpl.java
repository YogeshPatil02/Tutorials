package com.vimal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.vimal.model.DBConnection;
import com.vimal.model.Student;

public class StudentDaoImpl implements StudentDao {

	@Override
	public List<Student> getAllStudent() {
		System.out.println("Inside Class "+this.getClass().getName()+"  @method getAllStudent");
		Connection connection = DBConnection.getDBConnection();
		List<Student> studentList = null;
		try {
			studentList = new ArrayList<Student>();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from students");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				Student student = new Student(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("email"),
						resultSet.getString("phone"), resultSet.getInt("marks"));
				System.out.println("Student "+student);
				studentList.add(student);
			}
		} catch (SQLException e) {
			System.out.println("Exception " +e);
			e.printStackTrace();
		}
		return studentList;
	}

	@Override
	public boolean saveStudent(Student student) {
		boolean done=false;
		System.out.println("Inside Class "+this.getClass().getName()+"  @method saveStudent");
		Connection connection = DBConnection.getDBConnection();
		String sqlQuery= "INSERT INTO students( id,name, email, phone, marks )VALUES (MYIDSEQ.nextval,?,?,?,?)";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, student.getName());
			preparedStatement.setString(2, student.getEmail());
			preparedStatement.setString(3, student.getContact());
			preparedStatement.setInt(4, student.getMarks());
			done = preparedStatement.executeUpdate()>0;
		} catch (SQLException e) {
			System.out.println("Exception " +e);
			e.printStackTrace();
		}
		return done;
	}
 
	public static void main(String[] args) {
		
		//System.out.println(new StudentDaoImpl().saveStudent(new Student("ass", "dsdsdemail", "45454545", 78)));
		new StudentDaoImpl().getAllStudent();
	}
}
