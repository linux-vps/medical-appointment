package HealthCare.process;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import HealthCare.ConnectionPool;
import HealthCare.ConnectionPoolImpl;
import HealthCare.objects.SpecialityObject;

public class Speciality {

    private Connection con;
    private ConnectionPool cp;

    public Speciality() {
        this.cp = new ConnectionPoolImpl();
        try {
            this.con = cp.getConnectionPool("Speciality");
            if (this.con.getAutoCommit()) {
                this.con.setAutoCommit(false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<SpecialityObject> getSpecialityObjects(SpecialityObject similar, int total) {
        ArrayList<SpecialityObject> items = new ArrayList<>();
        SpecialityObject item;
        String sql = "";
        sql += "SELECT * FROM tblspeciality ";
        sql += "ORDER BY sp_id ASC ";
        sql += "LIMIT ? ";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, total);
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new SpecialityObject();

                    item.setSp_id(rs.getInt("sp_id"));
                    item.setSp_name(rs.getString("sp_name"));
                    item.setSp_description(rs.getString("sp_description"));
                    item.setSp_notes(rs.getString("sp_notes"));
                    item.setSp_language(rs.getString("sp_language"));
                    item.setSp_created_date(rs.getString("sp_created_date"));
                    item.setSp_modified_date(rs.getString("sp_modified_date"));
                    item.setSp_deleted(rs.getBoolean("sp_deleted"));

                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return items;
    }

    public boolean deleteSpeciality(int spId) {
        String sql = "DELETE FROM tblspeciality WHERE sp_id=?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, spId);

            int rowsAffected = pre.executeUpdate();
            if (rowsAffected > 0) {
                this.con.commit();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateSpeciality(SpecialityObject updatedSpeciality) {
        String sql = "UPDATE tblspeciality SET sp_name=?, sp_description=?, sp_notes=?, sp_language=?, sp_modified_date=?, sp_deleted=? WHERE sp_id=?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, updatedSpeciality.getSp_name());
            pre.setString(2, updatedSpeciality.getSp_description());
            pre.setString(3, updatedSpeciality.getSp_notes());
            pre.setString(4, updatedSpeciality.getSp_language());
            pre.setString(5, updatedSpeciality.getSp_modified_date());
            pre.setBoolean(6, updatedSpeciality.isSp_deleted());
            pre.setInt(7, updatedSpeciality.getSp_id());
            int rowsAffected = pre.executeUpdate();
            if (rowsAffected > 0) {
                this.con.commit();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return false;
    }

    public boolean addSpeciality(SpecialityObject newSpeciality) {
        String sql = "INSERT INTO tblspeciality (sp_name, sp_description, sp_notes, sp_language, sp_created_date, sp_deleted) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, newSpeciality.getSp_name());
            pre.setString(2, newSpeciality.getSp_description());
            pre.setString(3, newSpeciality.getSp_notes());
            pre.setString(4, newSpeciality.getSp_language());
            pre.setString(5, newSpeciality.getSp_created_date());
            pre.setBoolean(6, newSpeciality.isSp_deleted());

            int rowsAffected = pre.executeUpdate();
            if (rowsAffected > 0) {
                this.con.commit();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return false;
    }

    public int getDoctorCountBySpecialty(int spId) {
        String sql = "SELECT COUNT(*) AS doctor_count FROM tbluser WHERE user_parent_id = ?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, spId);
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getInt("doctor_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return 0;
    }

    public ArrayList<SpecialityObject> getAllSpecialties() {
        ArrayList<SpecialityObject> specialties = new ArrayList<>();
        String sql = "SELECT * FROM tblspeciality";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    SpecialityObject specialty = new SpecialityObject();
                    specialty.setSp_id(rs.getInt("sp_id"));
                    specialty.setSp_name(rs.getString("sp_name"));
                    specialty.setSp_description(rs.getString("sp_description"));
                    specialty.setSp_notes(rs.getString("sp_notes"));
                    specialty.setSp_language(rs.getString("sp_language"));
                    specialty.setSp_created_date(rs.getString("sp_created_date"));
                    specialty.setSp_modified_date(rs.getString("sp_modified_date"));
                    specialty.setSp_deleted(rs.getBoolean("sp_deleted"));
                    specialties.add(specialty);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return specialties;
    }

    public String getDoctorSp(int spId) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT sp_name FROM tblspeciality WHERE sp_id = ? ;");
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, spId);
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    return rs.getString("sp_name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }

    public static void main(String[] args) {
    	 Speciality sp = new Speciality();
         ArrayList<SpecialityObject> specialties = sp.getAllSpecialties();
         for (SpecialityObject specialty : specialties) {
             int doctorCount = sp.getDoctorCountBySpecialty(specialty.getSp_id());
             System.out.println("Specialty ID: " + specialty.getSp_id());
             System.out.println("Name: " + specialty.getSp_name());
             System.out.println("Description: " + specialty.getSp_description());
             System.out.println("Notes: " + specialty.getSp_notes());
             System.out.println("Language: " + specialty.getSp_language());
             System.out.println("Created Date: " + specialty.getSp_created_date());
             System.out.println("Modified Date: " + specialty.getSp_modified_date());
             System.out.println("Deleted: " + specialty.isSp_deleted());
             System.out.println("Number of Doctors: " + doctorCount);
             System.out.println("-----------------------------------------");
         }
     }
}
