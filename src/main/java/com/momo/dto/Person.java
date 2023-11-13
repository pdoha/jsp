package com.momo.dto;

public class Person {
	private String name; //직접 접근해서 값변경 못하게함
	private int age;
	
	/*기본생성자*/
	public Person() {}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return name+ "/" + age;
	}
	public Person(String name, int age) {//getter, setter쓸거니까 외부에서 가져옴
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
