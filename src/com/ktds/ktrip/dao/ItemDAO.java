package com.ktds.ktrip.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ktds.ktrip.domain.ApplyVO;
import com.ktds.ktrip.domain.ItemVO;
import com.ktds.ktrip.jdbc.DBCon;



//Leeyong coding guide_item list & CRUD

public class ItemDAO {

//	private HashMap<String, ItemVO> dbMap;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DBCon db = new DBCon();
	private ResultSet rs = null;
	private int delRs = 0;
	
	public ItemDAO(){
		try {
			
			String DB_URL = "jdbc:mysql://ktrip-mysql.crl10pgh3bye.ap-northeast-2.rds.amazonaws.com:3306/ktripdb";
			String DB_USER = "ktrip";
			String DB_PASSWORD = "123456789";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<ItemVO> searchcount(String dest, int duration){
		
		String SQL = "SELECT * FROM trip_item WHERE DESTINATION = ? AND DURATION = ?";
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dest);
			pstmt.setInt(2, duration);
			

			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				ItemVO item = new ItemVO();
				item.setItem_id(rs.getInt("item_id"));
				item.setTitle(rs.getString("title"));
				item.setThumbnail(rs.getString("thumbnail"));
				item.setConcept(rs.getString("concept"));
				list.add(item);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//대기중인 여행
	public ArrayList<ItemVO> searchcount2(int user_id){
		String SQL = "SELECT * FROM trip_item t "
				+ "JOIN item_apply a "
				+ "ON t.ITEM_ID = a.ITEM_ID "
				+ "WHERE a.ITEM_STATUS = 1 and USER_ID = ?";
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {

				ItemVO item = new ItemVO();
				item.setApply_id(rs.getInt("apply_id"));
				item.setTitle(rs.getString("title"));
				item.setThumbnail(rs.getString("thumbnail"));
				item.setConcept(rs.getString("concept"));
				list.add(item);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	


	//다녀온 여행
	public ArrayList<ItemVO> searchcount3(int user_id){
		String SQL = "SELECT * FROM trip_item t "
				+ "JOIN item_apply a "
				+ "ON t.ITEM_ID = a.ITEM_ID "
				+ "WHERE a.ITEM_STATUS = 0 and USER_ID = ?";
		
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				ItemVO item = new ItemVO();
				item.setApply_id(rs.getInt("apply_id"));
				item.setTitle(rs.getString("title"));
				item.setThumbnail(rs.getString("thumbnail"));
				item.setConcept(rs.getString("concept"));
				list.add(item);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int delItem(int item_id) {
		String SQL = "DELETE FROM trip_item WHERE item_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, item_id);
			delRs = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return delRs;
			
		}
		
		return delRs;
	}

	public int viewItem(int item_id) {

		int res = 0;

		try {

			String SQL = "SELECT * FROM trip_item WHERE item_id = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, item_id);
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			return 1;
		}

		return res;
	}
	
	// 가이드의 상품을 DB에 등록/ 이미지 등록 미완
		public int addProduct(ItemVO item) {
			int res = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			DBCon db = new DBCon();
			try {
				conn = db.connect();

				String sql = "insert into trip_item "
						+ "(guide_id,destination,duration,num_max,concept,contents,item_status,num_min,price,title,thumbnail)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, item.getGuide_id());
				pstmt.setString(2, item.getDestination());
				pstmt.setInt(3, item.getDuration());
				pstmt.setInt(4, item.getNum_max());
				pstmt.setString(5, item.getConcept());
				pstmt.setString(6, item.getContents());
				pstmt.setString(7, item.getItem_status());
				pstmt.setInt(8, item.getNum_min());
				pstmt.setInt(9, item.getPrice());
				pstmt.setString(10, item.getTitle());
				pstmt.setString(11, item.getThumbnail());

				res = pstmt.executeUpdate();
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				db.close(pstmt, conn);
			}

			return res;
		}

		public int updateItem(ItemVO item, int user_id) {
			// 상품 수정할 경우
			int res = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			DBCon db = new DBCon();
			try {
				conn = db.connect();
				String isql2 = "\r\n" + 
						"update trip_item set title =?, contents =? ,concept=? ,duration=? ,num_max=? ,num_min=?, price=? ,thumbnail=? where item_id = ? and guide_id = ? ";
				pstmt = conn.prepareStatement(isql2);
				pstmt.setString(1, item.getTitle());
				pstmt.setString(2, item.getContents());
				pstmt.setString(3, item.getConcept());
				pstmt.setInt(4, item.getDuration());
				pstmt.setInt(5, item.getNum_max());
				pstmt.setInt(6, item.getNum_min());
				pstmt.setInt(7, item.getPrice());
				pstmt.setString(8, item.getThumbnail());
				pstmt.setInt(9, item.getItem_id());
				pstmt.setInt(10, user_id);

				res = pstmt.executeUpdate();

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.close(pstmt, conn);
			}

			return res;
		}

		public int delProduct(int item_id) {
			// 상품을 삭제할 경우

			int res = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			DBCon db = new DBCon();

			try {
				conn = db.connect();
				String isql3 = "delete from trip_item where item_id= ?";
				pstmt = conn.prepareStatement(isql3);
				pstmt.setInt(1, item_id);
				res = pstmt.executeUpdate();

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.close(pstmt, conn);
			}

			return res;
		}

		public List<ItemVO> showAll(int guide_id) {
			// 가이드가 DB에 등록한 상품을 전부 보여줌(fin)

			List<ItemVO> list = new ArrayList<ItemVO>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBCon db = new DBCon();
			try {
				conn = db.connect();
				String sql = "select item_id,title,duration, (select SUM(entry) from item_apply "
						+ "where item_status in (1,2) and item_id =trip_item.item_id) as count "
						+ "from trip_item where guide_id = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, guide_id);
				// @log
				System.out.println("guide_id>>>" + guide_id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ItemVO item = new ItemVO();
					item.setItem_id(rs.getInt("item_id"));
					item.setTitle(rs.getString("title"));
					item.setDuration(rs.getInt("duration"));
					item.setCnt(rs.getInt("count"));
					System.out.println(">>>" + rs.getInt("item_id"));
					System.out.println(">>>" + rs.getString("title"));
					System.out.println(">>>" + rs.getString("duration"));
					System.out.println(">>>" + rs.getInt("count"));
					list.add(item);
				}

			} catch (SQLException e1) {
				e1.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.close(rs, pstmt, conn);
			}

			return list;
		}

		public ItemVO showSelect(int item_id, int guide_id) {
			// 특정 상품을 선택했을 때 fin
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBCon db = new DBCon();
			ItemVO item = new ItemVO();

			try {
				conn = db.connect();
				String sql = "select title, num_max, duration, contents, num_min, price , thumbnail, concept "
						+ " from trip_item" + " where item_id = ? and guide_id = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, item_id);
				pstmt.setInt(2, guide_id);
				rs = pstmt.executeQuery();
				rs.next();
				item.setTitle(rs.getString("title"));
				item.setNum_max(rs.getInt("num_max"));
				item.setDuration(rs.getInt("duration"));
				item.setContents(rs.getString("contents"));
				item.setNum_min(rs.getInt("num_min"));
				item.setPrice(rs.getInt("price"));
				item.setThumbnail(rs.getString("thumbnail"));
				item.setConcept(rs.getString("concept"));
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.close(rs, pstmt, conn);
			}
			return item;
		}

		public List<ApplyVO> showApply(int item_id) {
			// 선택된 상품에 들어간 사람들 출력 fin
			ArrayList<ApplyVO> applyList = new ArrayList<ApplyVO>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBCon db = new DBCon();

			try {
				conn = db.connect();

				String sql = "select apply_id, user_id, (select id from user where user_id=item_apply.user_id) as name,start_date,end_date,entry,item_status from item_apply where item_status in(1,2) and item_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, item_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ApplyVO apply = new ApplyVO();
					apply.setApply_id(rs.getInt("apply_id"));
					apply.setUser_id(rs.getInt("user_id"));
					apply.setName(rs.getString("name"));
					apply.setStart_date(rs.getString("start_date"));
					apply.setEnd_date(rs.getString("end_date"));
					apply.setEntry(rs.getInt("entry"));
					apply.setItem_status(rs.getInt("item_status"));

					if (apply.getItem_status() == 0) {
						apply.setStatusToString("종료");
					} else if (apply.getItem_status() == 1) {
						apply.setStatusToString("대기");
					} else if (apply.getItem_status() == 2) {
						apply.setStatusToString("승낙");
					} else {
						apply.setStatusToString("거절");
					}
					applyList.add(apply);

				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.close(rs, pstmt, conn);
			}
			System.out.println("size()>>>" + applyList.size());
			return applyList;
		}

		public void changeStatus(int item_status, int apply_id) {
			int res= 0;
			ArrayList<ApplyVO> applyList = new ArrayList<ApplyVO>();
			System.out.println("DAO STATUS들어옴>>> 아이템 상태" + item_status + "," + apply_id);
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBCon db = new DBCon();
//			System.out.println("Change>>>" + user_id);
//			System.out.println("Change>>>" + item_status);
//			System.out.println("Change>>>" + apply_id);
			try {
				conn = db.connect();
				if (item_status == 2) { //승낙함
					System.out.println("승낙들어옴>>>");
					String sql = "update item_apply set item_status = 2 where apply_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, apply_id);
					res = pstmt.executeUpdate();
								
				} else if(item_status == 3){ // 거절함
					System.out.println("거절들어옴>>>");
					//String sql = "delete from item_apply where apply_id = ?";
					String sql = "update item_apply set item_status = 3 where apply_id = ?";
					pstmt = conn.prepareStatement(sql);
					//pstmt.setInt(1, user_id);
					pstmt.setInt(1, apply_id);
					res = pstmt.executeUpdate();
					
					System.out.println("거절 업뎃 완료");

				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.close(rs, pstmt, conn);
			}

		}
	
	
}
