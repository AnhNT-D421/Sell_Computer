/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.raven.viewmodels;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class RamResponse {
      private int id;
    private String dungLuongRam;
    private String loaiRam;
    private Date ngayTao, ngaySua;
    private String nguoiTao, nguoiSua;
    private int deleted;

    public RamResponse() {
    }

    public RamResponse(String dungLuongRam) {
        this.dungLuongRam = dungLuongRam;
    }

    public RamResponse(int id, String dungLuongRam, String loaiRam) {
        this.id = id;
        this.dungLuongRam = dungLuongRam;
        this.loaiRam = loaiRam;
    }

    public RamResponse(int id, String dungLuongRam, String loaiRam, Date ngayTao, Date ngaySua, String nguoiTao, String nguoiSua, int deleted) {
        this.id = id;
        this.dungLuongRam = dungLuongRam;
        this.loaiRam = loaiRam;
        this.ngayTao = ngayTao;
        this.ngaySua = ngaySua;
        this.nguoiTao = nguoiTao;
        this.nguoiSua = nguoiSua;
        this.deleted = deleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDungLuongRam() {
        return dungLuongRam;
    }

    public void setDungLuongRam(String dungLuongRam) {
        this.dungLuongRam = dungLuongRam;
    }

    public String getLoaiRam() {
        return loaiRam;
    }

    public void setLoaiRam(String loaiRam) {
        this.loaiRam = loaiRam;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Date getNgaySua() {
        return ngaySua;
    }

    public void setNgaySua(Date ngaySua) {
        this.ngaySua = ngaySua;
    }

    public String getNguoiTao() {
        return nguoiTao;
    }

    public void setNguoiTao(String nguoiTao) {
        this.nguoiTao = nguoiTao;
    }

    public String getNguoiSua() {
        return nguoiSua;
    }

    public void setNguoiSua(String nguoiSua) {
        this.nguoiSua = nguoiSua;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return dungLuongRam ;
    }
    
    
}
