package com.example.takuma.moneypokei;

/**
 * Created by takuma on 15/11/28.
 */
public class PersonalData {
    private String name;
    private int point;

    public PersonalData(){
        name = "hello";
        point = 99999;
    }

    public String getName(){
        return this.name;
    }

    public int getPoint(){
        return this.point;
    }

    public void setName(String name){
        this.name = name;
    }

    public void setPoint(int point){
        this.point = point;
    }
}
