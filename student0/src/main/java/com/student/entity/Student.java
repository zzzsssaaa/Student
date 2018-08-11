package com.student.entity;

public class Student {
    private int sid;
    private String sname;
    private String ssex;
    private String stel;
    private String semail;
    private String spwd;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail;
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd;
    }

//    public String toString() {
//        return "Student [id=" + id + ", pw=" + pw + ", userName=" + name + "]";
//    }
    public Student(){
        super();
    }

    public Student(int sid,String sname,String ssex,String stel,String semail,String spwd) {
        super();
        this.sid = sid;
        this.sname = sname;
        this.ssex = ssex;
        this.stel = stel;
        this.semail = semail;
        this.spwd = spwd;
    }

}
