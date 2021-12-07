package com.kh.tboard.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.tboard.model.vo.Attachment;
import com.kh.tboard.model.vo.Category;
import com.kh.tboard.model.vo.TBoard;

public class TBoardDao {
	
	private Properties prop = new Properties();
	
	public TBoardDao() {
		
		String fileName = TBoardDao.class.getResource("/sql/tboard/tboard-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertTBoard(Connection conn, TBoard tb) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertTBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tb.gettTitle());
			pstmt.setInt(2, tb.gettPrice());
			pstmt.setInt(3, tb.getCategoryNo());
			pstmt.setString(4, tb.getBookStatus());
			pstmt.setString(5, tb.getContent());
			pstmt.setInt(6, Integer.parseInt(tb.getMemberNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachmentList");
		
		// 반복적으로 리스트에 접근해서 한개씩 INSERT 
		try {
			for(Attachment at : list) {
		
				pstmt = conn.prepareStatement(sql);
				
			
				pstmt.setString(1, at.getFileName());
				pstmt.setString(2, at.getFilePath());
				pstmt.setString(3, at.getFileLevel());
				pstmt.setString(4, at.getStatus());
				pstmt.setString(5, at.getChangeName());
				
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<TBoard> selectThumbnailList(Connection conn,PageInfo pi) {
		// SELECT => ResultSet => 여러행 (while, ArrayList)
				// 변수
		ArrayList<TBoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				TBoard b = new TBoard();
				
				b.settNo(rset.getInt("T_NO"));
				b.settTitle(rset.getString("T_TITLE"));
				b.settPrice(rset.getInt("T_PRICE"));
				b.setTitleImg(rset.getString("TITLEIMG"));
			
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<TBoard> selectList(Connection conn, PageInfo pi, int category) {
		// SELECT 문 => ResultSet => 여러 행 이므로 ArrayList<Board>
		// 변수
		ArrayList<TBoard> pageList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				pageList.add(new TBoard(rset.getInt("T_NO"),
										rset.getString("T_TITLE"),
										rset.getInt("T_PRICE"),
										rset.getInt("CATEGORY_NO"),
										rset.getDate("CREATE_DATE"), 
										rset.getInt("T_COUNT"),
										rset.getString("MEMBER_NO"),
										rset.getString("STATUS"),
										rset.getString("TITLEIMG")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pageList;
	}

	public TBoard selectBoard(Connection conn, int boardNo) {
		// SELECT => ResultSet => PK 에 의해 한건만 => Board
		// 변수
		TBoard b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new TBoard(rset.getInt("T_NO"), 
						 	rset.getString("T_TITLE"),
							  rset.getInt("CATEGORY_NO"), 
							  rset.getString("CONTENT"), 
							  rset.getDate("CREATE_DATE"),
							  rset.getString("MEMBER_NO"),
							  rset.getInt("T_PRICE"),
							  rset.getString("STATUS"),
							  rset.getString("BOOK_STATUS"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int boardNo) {
		// SELECT => ResultSet => ArrayList<Attachment>, while 문
		// 변수
		ArrayList<Attachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment"); // 기존 쿼리문 재활용
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Attachment at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setFileName(rset.getString("FILE_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;

	}

	public int increaseCount(Connection conn, int boardNo) {
		// UPDATE => 처리된 행의 갯수
		// 변수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;	
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		
		
		ArrayList<Category> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Category(rset.getInt("CATEGORY_NO"), 
									  rset.getString("CATEGORY_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Attachment selectAttachment(Connection conn, int boardNo) {
		// SELECT => ResultSet => 첨부파일 한개(일반게시판) => Attachment 
		// 변수
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setFileName(rset.getString("FILE_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	public ArrayList<Attachment> selectAttachmentList2(Connection conn, int boardNo) {
		// SELECT => ResultSet => ArrayList<Attachment>, while 문
				// 변수
				ArrayList<Attachment> a_list = new ArrayList<>();
				
				PreparedStatement pstmt = null;
				
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectAttachment2"); // 기존 쿼리문 재활용
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, boardNo);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						
						Attachment at = new Attachment();
						
						at.setFileNo(rset.getInt("FILE_NO"));
						at.setFileName(rset.getString("FILE_NAME"));
						at.setChangeName(rset.getString("CHANGE_NAME"));
						at.setFilePath(rset.getString("FILE_PATH"));
						at.setTitleImg(rset.getString("TITLEIMG"));
						
						a_list.add(at);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return a_list;
	}

	public int updateTBoard(Connection conn, int boardNo, TBoard tb) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateTBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tb.gettTitle());
			pstmt.setInt(2, tb.gettPrice());
			pstmt.setInt(3, tb.getCategoryNo());
			pstmt.setString(4, tb.getBookStatus());
			pstmt.setString(5, tb.getContent());
			pstmt.setInt(6, 1);
			pstmt.setInt(7, boardNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(Connection conn, ArrayList<Attachment> list, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		// 반복적으로 리스트에 접근해서 한개씩 INSERT 
		try {
			for(int i = 0; i <= 2; i++) {
				try {
					
					pstmt = conn.prepareStatement(sql);
					
					
					pstmt.setString(1, list.get(i).getFileName());
					pstmt.setString(2, list.get(i).getFilePath());
					pstmt.setString(3, list.get(i).getStatus());
					pstmt.setString(4, list.get(i).getChangeName());
					pstmt.setInt(5, boardNo);
					pstmt.setInt(6, i+1);
					
					
					result = pstmt.executeUpdate();
				}
				catch(IndexOutOfBoundsException e){
					
					
				}
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
