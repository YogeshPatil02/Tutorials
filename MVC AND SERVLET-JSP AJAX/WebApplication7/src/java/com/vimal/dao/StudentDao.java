package com.vimal.dao;

import java.util.List;

import com.vimal.model.Student;

public interface StudentDao 
{
  public List<Student> getAllStudent();
  public boolean saveStudent(Student student); 
}
