drop database if exists quan_ly_diem_thi;
create database quan_ly_diem_thi;
use quan_ly_diem_thi;

CREATE TABLE hoc_sinh (
    maHs VARCHAR(20) PRIMARY KEY,
    tenHs VARCHAR(50),
    ngay_sinh DATETIME,
    lop VARCHAR(20),
    gt VARCHAR(20)
);

CREATE TABLE mon_hoc (
    maMH VARCHAR(20) PRIMARY KEY,
    tenMH VARCHAR(50),
    maGV VARCHAR(20),
    FOREIGN KEY (maGV)
        REFERENCES giao_vien (maGV)
);

CREATE TABLE giao_vien (
    maGV VARCHAR(20) PRIMARY KEY,
    tenGV VARCHAR(50),
    soDt VARCHAR(10)
);

CREATE TABLE bang_diem (
    maHS VARCHAR(20),
    maGV VARCHAR(20),
    diem_thi INT,
    ngayKT DATE,
    PRIMARY KEY (maHS , maGV),
    FOREIGN KEY (maHS)
        REFERENCES hoc_sinh (maHs),
    FOREIGN KEY (maGV)
        REFERENCES giao_vien (maGV)
);
