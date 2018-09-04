package com.student.entity;

public class Student {
    private int sid;
    private String sstudentnumber;
    private String sname;
    private String ssex;
    private String szhengzhi;
    private String sbirthday;
    private String sqq;
    private String stel;
    private String stelparent;
    private String saddress;
    private String sidnumber;
    private String semail;
    private String spwd;
    //构造方法

    public Student() {
    }

    public Student(int sid, String sstudentnumber, String sname, String ssex, String szhengzhi, String sbirthday, String sqq, String stel, String stelparent, String saddress, String sidnumber, String semail, String spwd) {
        this.sid = sid;
        this.sstudentnumber = sstudentnumber;
        this.sname = sname;
        this.ssex = ssex;
        this.szhengzhi = szhengzhi;
        this.sbirthday = sbirthday;
        this.sqq = sqq;
        this.stel = stel;
        this.stelparent = stelparent;
        this.saddress = saddress;
        this.sidnumber = sidnumber;
        this.semail = semail;
        this.spwd = spwd;
    }

    //setter getter
    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSstudentnumber() {
        return sstudentnumber;
    }

    public void setSstudentnumber(String sstudentnumber) {
        this.sstudentnumber = sstudentnumber;
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

    public String getSzhengzhi() {
        return szhengzhi;
    }

    public void setSzhengzhi(String szhengzhi) {
        this.szhengzhi = szhengzhi;
    }

    public String getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(String sbirthday) {
        this.sbirthday = sbirthday;
    }

    public String getSqq() {
        return sqq;
    }

    public void setSqq(String sqq) {
        this.sqq = sqq;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getStelparent() {
        return stelparent;
    }

    public void setStelparent(String stelparent) {
        this.stelparent = stelparent;
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    public String getSidnumber() {
        return sidnumber;
    }

    public void setSidnumber(String sidnumber) {
        this.sidnumber = sidnumber;
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

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", sstudentnumber='" + sstudentnumber + '\'' +
                ", sname='" + sname + '\'' +
                ", ssex='" + ssex + '\'' +
                ", szhengzhi='" + szhengzhi + '\'' +
                ", sbirthday='" + sbirthday + '\'' +
                ", sqq='" + sqq + '\'' +
                ", stel='" + stel + '\'' +
                ", stelparent='" + stelparent + '\'' +
                ", saddress='" + saddress + '\'' +
                ", sidnumber='" + sidnumber + '\'' +
                ", semail='" + semail + '\'' +
                ", spwd='" + spwd + '\'' +
                '}';
    }

}
