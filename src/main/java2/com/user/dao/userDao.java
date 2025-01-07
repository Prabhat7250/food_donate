package com.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.model.user;

public class userDao {

    private static final String url = "jdbc:mysql://localhost:3306/food";
    private static final String userval = "root";
    private static final String pwd = "welcome";

    public void addUser(user user) {
        String query = "INSERT INTO user1 (id, username, password, email, country) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection con = DriverManager.getConnection(url, userval, pwd);
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, user.getId());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getPassword());
            pre.setString(4, user.getEmail());
            pre.setString(5, user.getCountry());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("User cannot be added: " + e.getMessage());
        }
    }

    public void removeUser(int id) {
        String query = "DELETE FROM user1 WHERE id = ?";
        try {
            Connection con = DriverManager.getConnection(url, userval, pwd);
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("User cannot be deleted: " + e.getMessage());
        }
    }

    public user getUserById(int id) {
        String query = "SELECT * FROM user1 WHERE id = ?";
        try {
            Connection con = DriverManager.getConnection(url, userval, pwd);
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, id);
            ResultSet re = pre.executeQuery();
            if (re.next()) {
                return new user(
                    re.getInt("id"),
                    re.getString("username"),
                    re.getString("password"),
                    re.getString("email"),
                    re.getString("country")
                );
            }
        } catch (SQLException e) {
            System.out.println("User cannot be fetched: " + e.getMessage());
        }
        return null;
    }

    public void updateUser(user user) {
        String query = "UPDATE user1 SET username = ?, password = ?, email = ?, country = ? WHERE id = ?";
        try {
            Connection con = DriverManager.getConnection(url, userval, pwd);
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getEmail());
            pre.setString(4, user.getCountry());
            pre.setInt(5, user.getId());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("User cannot be updated: " + e.getMessage());
        }
    }
}
