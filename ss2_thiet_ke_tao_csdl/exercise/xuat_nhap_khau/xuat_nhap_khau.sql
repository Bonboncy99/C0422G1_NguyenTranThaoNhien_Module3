drop database if exists xuat_nhap_khau;
create database xuat_nhap_khau;
use xuat_nhap_khau;

CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATETIME
);

CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(50)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATETIME
);

CREATE TABLE chi_tiet_phieu_nhap (
    so_phieu_nhap INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    PRIMARY KEY (so_phieu_nhap , ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY,
    ngay_dat_hang DATETIME,
    ma_nha_cung_cap int not null,
    foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(10) PRIMARY KEY,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_phieu_xuat INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    don_gia_xuat DOUBLE,
    so_luong_sx INT,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE chi_tiet_don_dat_hang (
    so_don_hang INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    PRIMARY KEY (so_don_hang , ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

