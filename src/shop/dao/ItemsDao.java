package shop.dao;

import shop.entity.Items;
import shop.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/4/14
 * Time: 11:02
 * Project: JavaWebIntelliJ
 * Detail:  商品的业务逻辑类
 */
public class ItemsDao {

    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private ArrayList<Items> list;

    public ItemsDao() {
        this.list = new ArrayList<Items>(10);
    }

    public ArrayList<Items> getAllItems(){

        try {
            conn = DBHelper.getInstance();
            String sql = "SELECT * FROM items";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            Items item;
            while (rs.next()){
                item = new Items();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
//                System.out.println(rs.getString("name"));
                item.setCity(rs.getString("city"));
                item.setNumber(rs.getInt("number"));
                item.setPrice(rs.getInt("price"));
                item.setPicture(rs.getString("picture"));

                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (null != rs){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (null != stmt){
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;

    }

    public Items getItemsById(int id){

        Items item = new Items();
        try {
            conn = DBHelper.getInstance();
            String sql = "SELECT * FROM items WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                item.setCity(rs.getString("city"));
                item.setNumber(rs.getInt("number"));
                item.setPrice(rs.getInt("price"));
                item.setPicture(rs.getString("picture"));
                return item;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (null != rs){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (null != stmt){
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //获取最近浏览的商品信息
    public ArrayList<Items> getViewList(String list){
        ArrayList<Items> itemsList = new ArrayList<Items>(5);
        int iCount = 5;

        if(null != list && list.length() > 0){
            String [] arr = list.split(",");
            if(arr.length >= 5){
                for (int i = arr.length - 1; i >= arr.length - iCount - 1 ; i--) {
                    itemsList.add(getItemsById(Integer.parseInt(arr[i])));
                }
            } else {
                for (int i = arr.length - 1; i >= 0 ; i--) {
                    itemsList.add(getItemsById(Integer.parseInt(arr[i])));
                }
            }
            return itemsList;
        } else {
            return null;
        }
    }

}
